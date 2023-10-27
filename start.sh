#!/bin/bash

# Restart Nginx
service nginx restart

# Restart PHP-FPM
service php7.4-fpm restart

# Restart MySQL
service mysql restart

# Restart Elasticsearch
service elasticsearch restart

