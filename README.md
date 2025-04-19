# 🎬 2.1.2: YouTube - Database Project

This project consists of designing and implementing a simplified version of the YouTube database model. It includes users, videos, channels, playlists, tags, comments, and reactions.

## 📚 Description

The goal is to create a relational database for a mini version of YouTube where users can upload videos, interact with content, and organize videos into playlists and channels. The database is designed to capture essential features such as video publishing, reactions (likes/dislikes), subscriptions, and comments.

## 🧱 Database Structure

### 👤 User
Stores user profile information.
- `user_id` (Primary Key)
- `email` (Unique, Not Null)
- `password` (Not Null)
- `username` (Not Null)
- `birth_date`
- `gender` (Enum: 'male', 'female', 'other')
- `country`
- `postal_code`

### 📺 Channel
Each user can create one or more channels.
- `channel_id` (Primary Key)
- `name`
- `description`
- `creation_date`
- `user_id` (Foreign Key → user)

### 🎥 Video
Users upload videos to the platform.
- `video_id` (Primary Key)
- `title`
- `description`
- `size`
- `filename`
- `duration`
- `thumbnail`
- `views`
- `likes`
- `dislikes`
- `status` (Enum: 'public', 'private', 'unlisted')
- `uploaded_by` (Foreign Key → user)
- `upload_datetime`

### 🏷️ Tag
Tags help categorize videos.
- `tag_id` (Primary Key)
- `name`

### 🔗 Video-Tag (Many-to-Many)
- `video_id` (Foreign Key → video)
- `tag_id` (Foreign Key → tag)

### 🔔 Subscription
Users can subscribe to channels.
- `subscriber_id` (Foreign Key → user)
- `channel_id` (Foreign Key → channel)
- `subscription_date`

### 👍👎 Video Reaction
Tracks likes/dislikes on videos.
- `reaction_id` (Primary Key)
- `user_id` (Foreign Key → user)
- `video_id` (Foreign Key → video)
- `reaction_type` (Enum: 'like', 'dislike')
- `reaction_date`

### 📂 Playlist
Users can create playlists with videos.
- `playlist_id` (Primary Key)
- `name`
- `creation_date`
- `status` (Enum: 'public', 'private')
- `user_id` (Foreign Key → user)

### 📂🎥 Playlist-Video (Many-to-Many)
- `playlist_id` (Foreign Key → playlist)
- `video_id` (Foreign Key → video)

### 💬 Comment
Users can comment on videos.
- `comment_id` (Primary Key)
- `user_id` (Foreign Key → user)
- `video_id` (Foreign Key → video)
- `text`
- `comment_datetime`

### ❤️ Comment Reaction
Tracks likes/dislikes on comments.
- `reaction_id` (Primary Key)
- `user_id` (Foreign Key → user)
- `comment_id` (Foreign Key → comment)
- `reaction_type` (Enum: 'like', 'dislike')
- `reaction_date`

 
