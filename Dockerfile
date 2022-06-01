FROM node:alpine
COPY --from=msoap/shell2http /app/shell2http /app/shell2http
COPY receiver.sh /app/receiver
RUN chmod +x /app/receiver
RUN npm install -g npm localtunnel pm2
ENTRYPOINT ["/app/shell2http"]
CMD ["-form", "-show-errors", "-include-stderr", "--port=80", "/command", "/app/receiver"]
