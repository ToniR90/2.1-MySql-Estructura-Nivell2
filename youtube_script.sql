CREATE DATABASE youtube;
USE youtube;


CREATE TABLE user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    username VARCHAR(100) NOT NULL,
    birth_date DATE,
    gender ENUM('male', 'female', 'other'),
    country VARCHAR(100),
    postal_code VARCHAR(10)
);

CREATE TABLE channel (
    channel_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    creation_date DATETIME,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE video (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150),
    description TEXT,
    size INT,
    filename VARCHAR(255),
    duration TIME,
    thumbnail VARCHAR(255),
    views INT,
    likes INT,
    dislikes INT,
    status ENUM('public', 'private', 'unlisted'),
    uploaded_by INT,
    upload_datetime DATETIME,
    FOREIGN KEY (uploaded_by) REFERENCES user(user_id)
);

CREATE TABLE tag (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE video_tag (
    video_id INT,
    tag_id INT,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES video(video_id),
    FOREIGN KEY (tag_id) REFERENCES tag(tag_id)
);

CREATE TABLE subscription (
    subscriber_id INT,
    channel_id INT,
    subscription_date DATETIME,
    PRIMARY KEY (subscriber_id, channel_id),
    FOREIGN KEY (subscriber_id) REFERENCES user(user_id),
    FOREIGN KEY (channel_id) REFERENCES channel(channel_id)
);

CREATE TABLE video_reaction (
    reaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    reaction_type ENUM('like', 'dislike'),
    reaction_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (video_id) REFERENCES video(video_id)
);

CREATE TABLE playlist (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    creation_date DATETIME,
    status ENUM('public', 'private'),
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE playlist_video (
    playlist_id INT,
    video_id INT,
    PRIMARY KEY (playlist_id, video_id),
    FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
    FOREIGN KEY (video_id) REFERENCES video(video_id)
);

CREATE TABLE comment (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    text TEXT,
    comment_datetime DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (video_id) REFERENCES video(video_id)
);

CREATE TABLE comment_reaction (
    reaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    comment_id INT,
    reaction_type ENUM('like', 'dislike'),
    reaction_date DATETIME,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (comment_id) REFERENCES comment(comment_id)
);
