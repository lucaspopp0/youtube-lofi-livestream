# Official Python image
FROM python:3.9

# Update packages and install dependencies
RUN apt-get update && \
    apt-get install -y ffmpeg git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

RUN chmod +x ./run.sh
CMD ["sh", "-c", "./run.sh"]