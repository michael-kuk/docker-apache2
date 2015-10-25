# docker-apache2
Image is based on phusion/baseimage:0.9.17

## Installed packages
- curl
- build-essential
- Apache2
- PHP5
 - php5-gd
 - php5-mysql
 - php5-curl
 - php5-sqlite
 - php5-mcrypt
 - php-pear

__NOTE: Image does not have MySQL server installed as we are using docker and it can be easily linked from another container :)__

## Usage
This image is configured purely using following environment variables:
- ```PROJECT_ROOT``` => Root of your project containing all files, defaults /var/www/html
- ```WEB_ROOT``` => Path to folder containing index.html/index.php file within ```PROJECT_ROOT``` folder, the path must begin with ```/``` and defaults to ```/``` => ```PROJECT_ROOT```
- ```SSL_CERT``` => Path to SSL certificate, defaults to ```/etc/ssl/certs/ssl-cert-snakeoil.pem``` *Currently not working*
- ```SSL_KEY``` => Path to SSL certificate, defaults to ```/etc/ssl/private/ssl-cert-snakeoil.key``` *Currently not working*

## Example run commands
### No configuration - Display ```phpinfo()```

```
docker run -d -p 8080:80 -p 8443:443 --name apache2 michaelkuk/apache2
```

### Mount current directory
```
docker run -d -p 8080:80 -p 8443:443 --name <project_name> -v $(pwd):$(pwd) -e PROJECT_ROOT=$(pwd) michaelkuk/apache2
```

### Mount current directory with ```WEB_ROOT``` located in ```public``` directory

```
docker run -d -p 8080:80 -p 8443:443 -v $(pwd):$(pwd) -e PROJECT_ROOT=$(pwd) -e WEB_ROOT=/public michaelkuk/apache2
```
