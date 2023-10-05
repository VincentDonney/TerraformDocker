FROM python:3.9
COPY ./infra/requirements.txt /infra/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /infra/requirements.txt
COPY ./app /app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]

