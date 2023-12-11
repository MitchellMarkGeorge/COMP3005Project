# COMP 3005 Final Project

This is the repo that holds all the SQL queries used in this project (creating the database, seeding it with test data, and 10 queries for testing).

### Setup instructions

- Create a new Postgres database (can be done through pgAdmin).
- Run all the queries in the `ddl.sql` file to create all the tables needed.
- Run all the queries in the `seed.sql` file to insert test data into the database.
- To test this database, you can use the 10 queries written in the `queries.sql`, with each having a description of what they do. 

### Assumptions and Explanations
These are the general assumptions I made when approaching this assignment:
- Every gym member, trainer, and admin have an account, and that account is strored in the `users` table. To differencitate them, a colunm named `account_type` is used.
- Only members have loyalty points, and since I didn't to have a `loyalty_points` colunm in the `users` table that would be `null` for trainers and admin, I decided to create a seperate table (`loyalty_points`) that refereces the user through its `member_id` colunm 
- Events (stored in the `events`) take place in a room (in the `rooms` table). This is done through the `room_id` in the `events` table.
- Multiple users can attend multiple events (i.e. multiple people can attend the same event as well), so a join table `users_events` is use that references the `user_id` and `event_id`.
- A single member can have many health goals, and this reflected in the `health_goals` table referencing the `user` through its `user_id`.
- Multiple members can do multiple workouts (stored in the `workouts` table). This is done through the `users_workouts` table by referencing the `workout_id` and `user_id`. Since users can also write notes based on the workouts, it made sense to put the `notes` colunm on the `users_workouts` table itself, since the `notes` belongs to the user in relation to the workout and not the workout itself.
- Members can also have multiple training sessionis with multiple trainers (and multiple members can be in the same session). This is done by having a `users_sessions` table that refences the member through `memeber_id` and the trainer through `trainer_id`.

