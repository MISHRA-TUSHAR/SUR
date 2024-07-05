# fastapi dev main.py
#.\venv\Scripts\activate

from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

class UserCreate(BaseModel):
  name: str
  email: str
  password: str

@app.post('/signup')
def signup_user(user: UserCreate):
  print(user.name)
  print(user.email)
  print(user.password)
  
  pass


# 1.16