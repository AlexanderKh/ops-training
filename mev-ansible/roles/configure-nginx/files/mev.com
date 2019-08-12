server {
  listen 80;
  server_name mev.com;

  access_log /var/log/nginx/mev.com.access.log;
  error_log /var/log/nginx/mev.com.error.log;

  location /api {
    proxy_pass http://127.0.0.1:4000;

    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header Host $proxy_host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
  location / {
    proxy_pass http://127.0.0.1:80;

    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header Host $proxy_host;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
}
