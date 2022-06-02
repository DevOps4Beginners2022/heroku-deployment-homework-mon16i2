FROM golang:1.17-alpine

ENV PORT 80

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o app-server

EXPOSE $PORT

CMD go run main.go
