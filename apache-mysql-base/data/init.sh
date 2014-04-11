# Populate parameters.yml
sed -e "s/database_host: DB_HOST/database_host: $DB_PORT_3306_TCP_ADDR/
s/database_name: DB_NAME/database_name: $DB_NAME/
s/database_user: DB_USER/database_user: $DB_USER/
s/database_password: DB_PASS/database_password: $DB_PASS/g" /var/www/app/config/parameters.yml.dist > /var/www/app/config/parameters.yml

# Composer
cd /var/www/
composer install

# Start Apache (passing environment variables)
sudo -E /usr/sbin/apache2

/bin/bash
