FROM golang:1.17-alpine

ARG PORT=8080

ENV PORT=$PORT

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

RUN go build -o app-server

EXPOSE $PORT

CMD [ "./app-server" ]
