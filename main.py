from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hey! this is a test fastapi app!!!"}


@app.get("/health")
async def health():
    return {"message": "Everything is good here"}
