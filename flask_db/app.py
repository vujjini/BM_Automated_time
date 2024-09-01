# turn this whole thing into a flask app. create a helper file to store the necessary functions. connect to a db or create one here.  
# create an endpoint that essentially connects with the frontend in the future. execute all the sql commands in this endpoint and create functions
# that take in inputs from the database and perform the tasks. 

from flask import Flask, render_template, request, redirect, url_for
from helper import search_pdf
import psycopg2
import os

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = os.path.join(os.getcwd(), 'files')

  
# Connect to the database 
# conn = psycopg2.connect(database="postgres", user="postgres", 
#                         password="blah@123", host="localhost", port="5432")

# cur = conn.cursor()

# cur.execute( 
#     '''CREATE TABLE IF NOT EXISTS spaces (id serial PRIMARY KEY, name varchar(100));''')

# cur.execute("INSERT INTO spaces (id, name) VALUES (0, '2708')")
# cur.execute('CREATE TABLE IF NOT EXISTS events (event_id serial, space_id INT, event_name varchar(100), PRIMARY KEY(event_id), FOREIGN KEY(space_id) REFERENCES spaces(space_id));')

# id = cur.fetchone()[0]
# name = "xyz"
# name2 = "dsdfewfew"

# cur.execute("INSERT INTO events (space_id, event_name) VALUES (%s, %s);", (id, name))
# cur.execute("INSERT INTO events (space_id, event_name) VALUES (%s, %s);", (id, name2))


# conn.commit()

# cur.close() 
# conn.close()

@app.route('/', methods=['GET', 'POST']) 
def index():
    if request.method == 'GET':
        return render_template("index.html")
    if request.method == 'POST':
        file = request.files['file']
        file_path = os.path.join(app.config['UPLOAD_FOLDER'], file.filename)
        file.save(file_path)
        timesheet = search_pdf(file_path)
        conn = psycopg2.connect(database="postgres", user="postgres", 
                        password="blah@123", host="localhost", port="5432")
        
        
        # create a cursor 
        cur = conn.cursor()
    
        for i in timesheet:
            cur.execute("SELECT space_id FROM spaces WHERE name=%s;", [i['event space']])
            space_id = cur.fetchone()[0]

            cur.execute("INSERT INTO events (space_id, event_name, start_time, end_time) VALUES (%s, %s, %s, %s);", (space_id, i['next_line'], i['start_time'], i['end_time']))
        
        conn.commit()
        cur.close()
        conn.close() 
        
        return f'File successfully uploaded'
