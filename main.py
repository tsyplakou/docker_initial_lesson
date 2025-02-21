from fastapi import FastAPI
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, filename="app.log", filemode="w", format="%(asctime)s - %(levelname)s - %(message)s")
logger = logging.getLogger(__name__)
logger.info("FastAPI application started")

app = FastAPI()

@app.get("/")
def read_root():
    logger.info("GET request received")
    return {"message": "Hello from FastAPI in Google Cloud Run!"}
