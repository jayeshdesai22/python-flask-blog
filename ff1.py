import os.path
import math

from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime
# from werkzeug import secure_filename
from werkzeug.utils import secure_filename

# from werkzeug import secure_filename
import json

from flask_mail import Mail,Message

with open("config.json","r") as c:
    params=json.load(c)["params"]
local_server = True
app = Flask(__name__)
app.secret_key='super_secret_key'
app.config['UPLOAD_FOLDER']=params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL= True,
    MAIL_USERNAME=params['gmail_user'],
    MAIL_PASSWORD=params['password']
)
mail=Mail(app)

if local_server:
    app.config["SQLALCHEMY_DATABASE_URI"] = params["local_uri"]
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params["prod_uri"]

db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(20), unique=False, nullable=False)
    phone_num = db.Column(db.String(13), unique=True, nullable=False)
    msg = db.Column(db.String(50), unique=False, nullable=False)
    date = db.Column(db.String(50), unique=False, nullable=False)
    email = db.Column(db.String(20), unique=True, nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(20), unique=False, nullable=False)
    content = db.Column(db.String(13), unique=False, nullable=False)
    slug = db.Column(db.String(50), unique=False, nullable=False)
    tagline = db.Column(db.String(50), unique=False, nullable=False)
    image_file = db.Column(db.String(50), unique=False, nullable=False)
    date = db.Column(db.String(50), unique=False, nullable=True)


@app.route("/")
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts)/params["no_of_posts"])
    #[0:params["no_of_posts"]]
    page1  = request.args.get('page2')
    if (not str(page1).isnumeric()):
        page1=1
    page_main=int(page1)
    posts = posts[(page_main-1)*params["no_of_posts"]:
                  (page_main-1)*params["no_of_posts"]+params["no_of_posts"]]

    if (page_main==1):
        prev="#"
        next = "/?page2="+ str(page_main+1)
    elif (page_main == last):
        prev = "/?page2=" + str(page_main - 1)
        next = "#"
    else:
        prev = "/?page2=" + str(page_main - 1)
        next = "/?page2=" + str(page_main + 1)

    return render_template("index.html",params=params,posts=posts,prev=prev,next=next)


@app.route("/dashboard",methods=['GET','POST'])
def dashboard():

    if 'user' in session and session['user']== params['admin_user']:
        posts = Posts.query.all()
        return render_template('dashboard.html',params=params,posts=posts)

    if request.method == 'POST':
        username = request.form.get('uname')
        userpass = request.form.get('pass')

        if username==params['admin_user'] and userpass==params['admin_password']:
            session['user'] = username
            posts=Posts.query.all()
            return  render_template('dashboard.html', params=params,posts=posts)


    return render_template("login.html",params=params)


@app.route("/about")
def about():
    return render_template("about.html",params=params)


@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template("post.html",params=params,post=post)

@app.route("/edit/<string:sno>",methods=['GET','POST'])
def edit(sno):
    if 'user' in session and session['user']==params["admin_user"]:
        if request.method=="POST":
            box_title=request.form.get('title')
            box_content=request.form.get('content')
            box_tagline=request.form.get('tagline')
            box_slug=request.form.get('slug')
            box_date=datetime.now()
            box_img_file=request.form.get('image_file')

            if sno=='0':
                post=Posts(title=box_title,content=box_content,slug=box_slug,tagline=box_tagline,date=box_date,
                           image_file=box_img_file)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title=box_title
                post.content=box_content
                post.slug=box_slug
                post.tagline=box_tagline
                post.image_file=box_img_file
                post.date=box_date
                db.session.commit()
                return redirect('/edit/'+sno)
        post = Posts.query.filter_by(sno=sno).first()
        return  render_template("edit.html",params=params,post=post)


@app.route("/uploader",methods=['GET','POST'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method=='POST':
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Update Successfuly"


@app.route("/delete/<string:sno>",methods=["GET","POST"])
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect("/dashboard")

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/contact",methods=['GET','POST'])
def contact():
    if request.method == "POST":
        name= request.form.get('name')
        phone=request.form.get('phone')
        message=request.form.get('message')
        email=request.form.get('email1')

        entry= Contacts(name=name, phone_num=phone, msg=message,
                        date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()

        mail.send_message(
            'hii this is from code warrior' + name,
            sender=email,
            recipients= [params['gmail_user']],
            body = message + "\n" + phone )
    return render_template("contact.html",params=params)


app.run(debug=True)