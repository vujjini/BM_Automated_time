

cd flask_db

- to run the flask app:
$env:FLASK_APP="app.py"
py -m flask run

- to view the sql tables more easily download PostgreSQL by Weijan Chen extension on VS
- theres two tables spaces and events. events has foreign key column named space_id.
- SQL command to view events:
SELECT * FROM events;
to view spaces;
SELECT * FROM tables;
