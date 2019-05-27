docker build -t angular-platform:builder -f Dockerfile.builder .
docker build -t angular-platform:nginx -f Dockerfile.nginx .