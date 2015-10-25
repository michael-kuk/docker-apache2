#!/bin/bash

source /etc/apache2/envvars

chmod -R 777 ${PROJECT_ROOT}

apache2 -X
