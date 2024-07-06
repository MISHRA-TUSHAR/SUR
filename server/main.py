# fastapi dev main.py
#.\venv\Scripts\activate

from fastapi import FastAPI
from fastapi import HTTPException
from pydantic import BaseModel
from sqlalchemy import create_engine
from sqlalchemy import TEXT, VARCHAR, Column, LargeBinary
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
import uuid
import bcrypt

app = FastAPI()

DATABASE_URL = "postgresql://postgres:0000@localhost:5432/sur"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

db = SessionLocal()

class UserCreate(BaseModel):
  name: str
  email: str
  password: str

class UserCreate(BaseModel):
  name: str
  email: str
  password: str

Base = declarative_base()

class User(Base):
    __tablename__ = 'users'

    id = Column(TEXT, primary_key=True)
    name = Column(VARCHAR(100))
    email = Column(VARCHAR(100))
    password = Column(LargeBinary)

@app.post('/signup')
def signup_user(user: UserCreate):
  user_db = db.query(User).filter(User.email == user.email).first()

  if user_db:
   raise HTTPException(status_code=400, detail="Email already registered")
  

  hashed_pw = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
  user_db = User(id=str(uuid.uuid4()),email=user.email,name=user.name,password=hashed_pw)
  db.add(user_db)
  db.commit()
  db.refresh(user_db)
  
  return user_db


Base.metadata.create_all(engine)

