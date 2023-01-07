FROM golang:alpine as Builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o fullcycle .

CMD ./fullcycle

FROM scratch

COPY --from=builder /usr/src/app/fullcycle /go/bin/fullcycle

ENTRYPOINT ["/go/bin/fullcycle"]

