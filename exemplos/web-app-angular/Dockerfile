FROM httpd:latest

RUN httpd -v

COPY ["./dist/web-app-angular/", "/usr/local/apache2/htdocs/"]
COPY ["./httpd/httpd.conf", "/usr/local/apache2/conf/httpd.conf"]

RUN chmod -R 755 /usr/local/apache2/htdocs/

EXPOSE 8080

COPY ["./startup", "/usr/local/bin/startup"]
RUN chmod +x /usr/local/bin/startup
ENTRYPOINT ["startup"]