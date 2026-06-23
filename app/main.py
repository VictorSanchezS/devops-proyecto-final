from fastapi import FastAPI
from sqlalchemy import create_engine, text
import os

app = FastAPI(title="DevOps Proyecto Final")

DATABASE_URL = os.getenv("DATABASE_URL", "postgresql://usuario:password@db:5432/midb")
engine = create_engine(DATABASE_URL)

@app.get("/")
def inicio():
    return {"mensaje": "Pipeline DevOps funcionando", "version": "1.0"}

@app.get("/salud")
def salud():
    return {"estado": "ok"}

@app.get("/db")
def test_db():
    with engine.connect() as conn:
        resultado = conn.execute(text("SELECT version()"))
        version = resultado.fetchone()[0]
    return {"postgresql": version}