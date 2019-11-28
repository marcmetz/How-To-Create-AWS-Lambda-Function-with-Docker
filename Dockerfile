FROM lambci/lambda:build-python3.8

ENV VIRTUAL_ENV=venv
ENV PATH $VIRTUAL_ENV/bin:$PATH
RUN python3 -m venv $VIRTUAL_ENV

COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

WORKDIR /var/task/venv/lib/python3.7/site-packages

COPY lambda_function.py .

RUN zip -9qr upload-to-s3.zip .
RUN echo "upload-to-s3.zip created"
