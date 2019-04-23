FROM python:3.6-alpine as base

FROM base as builder
RUN apk add --no-cache gcc musl-dev

RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --install-option="--prefix=/install" -r /requirements.txt

FROM base
COPY --from=builder /install /usr/local
WORKDIR /app
COPY . .
# COPY application ./application
# COPY volume-service.py ./
# COPY config.yaml .

CMD [ "python", "volume-service.py" ]
