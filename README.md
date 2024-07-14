# SUR - Flutter Music Application

## Overview
This project is a music application built with Flutter using the MVVM (Model-View-ViewModel) architecture. The backend is implemented using FastAPI, and PostgreSQL is used as the database. This application allows users to sign up, log in, upload songs, and manage their favorite songs.

## Features
- User authentication (sign up and log in)
- Upload songs with metadata and thumbnail images
- List all songs
- Favorite and unfavorite songs
- View list of favorite songs

## Architecture
### Frontend
- **Flutter**: The frontend is built using Flutter, implementing the MVVM architecture for better separation of concerns and maintainability.

### Backend
- **FastAPI**: The backend API is developed using FastAPI, a modern web framework for Python.
- **PostgreSQL**: PostgreSQL is used as the database to store user and song information.
- **Cloudinary**: Cloudinary is used for storing song files and thumbnails.

## Setup and Installation

### Backend Setup

1. **Clone the repository**
   ```
   git clone https://github.com/MISHRA-TUSHAR/SUR.git
   
   cd sur
   ```

2. **Create a virtual environment and activate it**
   ```
   python -m venv venv
   
   source venv/bin/activate
   # or .\venv\Scripts\activate
   ```

  3.**Install dependencies**
  ```
  uvicorn main:app --reload
  ```

## Project Structure

### Backend
- `main.py`: Entry point for the FastAPI application.
- `models/`: Contains SQLAlchemy models for the database.
- `routes/`: Contains route definitions for authentication and song management.
- `database.py`: Database configuration and connection setup.
- `middleware/`: Middleware for authentication.

### Frontend
- `lib/`: Contains Flutter application code organized into views, view models, and models.
- `models/`: Data models used in the application.
- `views/`: UI components and screens.
- `viewmodels/`: ViewModels containing business logic.

## API Endpoints

### Authentication
- `POST /auth/signup`: Sign up a new user.
- `POST /auth/login`: Log in an existing user.
- `GET /auth/`: Get current user data.

### Songs
- `POST /song/upload`: Upload a new song.
- `GET /song/list`: List all songs.
- `POST /song/favorite`: Favorite or unfavorite a song.
- `GET /song/list/favorites`: List all favorite songs.
- `GET /song/list`: List all songs.
- `POST /song/favorite`: Favorite or unfavorite a song.
- `GET /song/list/favorites`: List all favorite songs.
