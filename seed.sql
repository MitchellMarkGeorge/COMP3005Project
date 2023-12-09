INSERT INTO
    users (
        first_name,
        last_name,
        password,
        email,
        account_type
    )
VALUES
    (
        'Ella',
        'Stockton',
        'ellaiscool18!',
        'ella@email.com',
        'member'
    ),
    (
        'Jack',
        'Coolman',
        'jackliftsweights23!',
        'jack@email.com',
        'member'
    ),
    (
        'Jane',
        'Weston',
        'jwest43~',
        'jane@email.com',
        'member'
    ),
    (
        'Jeff',
        'Mannly',
        'jeffrocks54*',
        'jeff@email.com',
        'trainer'
    ),
    (
        'Stan',
        'Swanson',
        'swansonstar%89',
        'stan@email.com',
        'trainer'
    ),
    (
        'Rebecca',
        'Wu',
        'rebeccawuuu!88',
        'rebwu@email.com',
        'trainer'
    ),
    (
        'Michael',
        'Bossman',
        'bossmanfitness75!',
        'mikeboss@email.com',
        'admin'
    );

INSERT INTO
    rooms (name)
VALUES
    ('Multipurpose Room 1'),
    ('Multipurpose Room 2'),
    ('Multipurpose Room 3'),
    ('Multipurpose Room 4');

INSERT INTO
    events (name, description, date, room_id)
VALUES
    (
        'Badminton',
        'Free open badminton session.',
        '2023-12-10',
        1
    ), (
        'Self Defense',
        'Free open self-defense session.',
        '2023-12-13',
        1
    ),
    (
        'Womens Kickboxing',
        'Free open kicboxing session for woment.',
        '2023-12-11',
        3
    ),
    (
        'Senior Yoga',
        'Free open yoga session for seniors.',
        '2023-12-14',
        3
    ),
    (
        'All-round fitness',
        'Free open fitness session session.',
        '2023-12-10',
        3
    ),
    (
        'Mens Boxing',
        'Free open boxing session for men.',
        '2023-12-12',
        1
    );

INSERT INTO
    user_events (event_id, user_id)
VALUES
    (1, 3),
    (1, 1),
    (1, 2),
    (2, 1),
    (2, 5),
    (2, 6),
    (3, 1),
    (3, 3),
    (3, 2),
    (3, 4),
    (4, 6),
    (6, 4);

INSERT INTO
    workouts (name, description, reps)
VALUES
    ('Situps', 'Core muscle exercise', 10),
    ('Crunches', 'Core muscle exercise', 10),
    ('Plank', 'Strength building exercise', 3),
    ('Pushups', 'Core muscle exercise', 50),
    ('Superman', 'Super exercise', 20);

INSERT INTO
    user_workouts (workout_id, user_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 5),
    (2, 2),
    (2, 4),
    (2, 3),
    (3, 5),
    (3, 4),
    (3, 3);

INSERT INTO
    loyalty_points (member_id, points)
VALUES
    (1, 1500),
    (2, 33500),
    (3, 49000);

INSERT INTO
    health_goals (title, detail, progress, user_id)
VALUES
    (
        'Loose 50 pounds',
        'Try and loose as much weight as possible',
        30,
        1
    ),
    (
        'Play more sports',
        'Maintain a more active lifestyle',
        45,
        1
    ),
    (
        'Do more than 10 crunches',
        'Be able to do more crunches (better core muscles)',
        75,
        2
    ),
    (
        'Attend more badminton session',
        'Be more engaged in activities',
        25,
        2
    ),
    (
        'Loose 70 pounds',
        'Need to shed the Christmas weight',
        80,
        3
    ),
    (
        'Do kick boxing twice a week',
        'Kickboxing seems fun',
        20,
        3
    ),
    (
        'Start doing yoga',
        'Need to relax using yoga',
        0,
        3
    );

INSERT INTO
    sessions (progress_notes, date)
VALUES
    (
        'Good progress. Need to work on Ellas lifting form',
        '2023-12-9'
    ),
    ('Focus on core strength', '2023-12-11'),
    (NULL, '2023-12-13'),
    (
        'Nicely done! Up the reps next week',
        '2023-12-12'
    ),
    ('Find more plank videos', '2023-12-10'),
    (NULL, '2023-12-15');

INSERT INTO
    users_sessions (session_id, trainer_id, member_id)
VALUES
    (1, 6, 1),
    (1, 6, 3),
    (2, 6, 3),
    (2, 6, 2),
    (3, 5, 1),
    (3, 5, 3),
    (4, 5, 3),
    (4, 5, 1),
    (5, 4, 2),
    (5, 4, 3),
    (6, 4, 1),
    (6, 4, 2);