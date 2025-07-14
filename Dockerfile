FROM golang:1.24.3
WORKDIR /app
RUN apt-get update && apt-get install -y gcc
COPY go.mod go.sum ./
RUN go mod download
COPY *.go ./
COPY tracker.db ./
RUN go build -o /final_main
CMD ["/final_main"]