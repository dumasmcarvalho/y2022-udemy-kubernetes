FROM httpd:latest

RUN httpd -v

COPY ["./dist/web-app/", "/usr/local/apache2/htdocs/"]
COPY ["./httpd/httpd.conf", "/usr/local/apache2/conf/httpd.conf"]

RUN chmod -R 755 /usr/local/apache2/htdocs/

EXPOSE 8080