CREATE TABLE IF NOT EXISTS user_info (
    username_id int GENERATED ALWAYS AS IDENTITY primary key not null,
    email TEXT,
    password TEXT not null
);