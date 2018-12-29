# Liara Angular Platform
The docker image for Angular projects. (Angular >= 2)

This image extends Liara Static Platform. Liara Static Platfrom uses nginx to serve static content. If you create a `liara_nginx.conf` in your project's root, Liara will use it to configure your nginx instance.

## Default liara_nginx.conf
```
location / {
  index index.html index.htm;
  try_files $uri $uri/ /index.html =404;
}
```

You can extend it to add your own config:
```
location / {
  # ...
}

location /api {
  # ...
}

location /images {
  # ...
}
```

## Usage with Liara CLI
```sh
cd projects/my-angular-app
liara deploy --angular
```

## Usage with Docker
Create a `Dockerfile` in your project's root directory:
```
FROM liararepo/angular-platform:builder as builder
FROM liararepo/angular-platform:nginx
```

Then build the image:
```sh
docker build -t my-angular-app .
```

Now you can run your app with:
```sh
docker run -d -p 8000:80 my-angular-app
```

Open up http://localhost:8000 in your browser.