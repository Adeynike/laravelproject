# # Used for prod build.
# FROM 147726474727.dkr.ecr.us-east-1.amazonaws.com/laravel-prob-image:latest as php

# # Copy configuration files.
# COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
# COPY ./docker/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
# COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf

# # Set working directory to ...
# WORKDIR /app

# # Copy files from current folder to container current folder (set in workdir).
# COPY --chown=www-data:www-data . .

# # Create laravel caching folders.
# RUN mkdir -p ./storage/framework
# RUN mkdir -p ./storage/framework/{cache, testing, sessions, views}
# RUN mkdir -p ./storage/framework/bootstrap
# RUN mkdir -p ./storage/framework/bootstrap/cache

# # Adjust user permission & group.
# RUN usermod --uid 1000 www-data
# RUN groupmod --gid 1000  www-data

# # Run the entrypoint file.
# # ENTRYPOINT [ "docker/entrypoint.sh" ]
# # RUN chmod +x docker/entrypoint.sh
# # ENTRYPOINT ["/docker/entrypoint.sh"]
# RUN chmod +x docker/entrypoint.sh

# ENTRYPOINT ["./docker/entrypoint.sh"]


# # Used for prod build.
# FROM 147726474727.dkr.ecr.us-east-1.amazonaws.com/laravel-prob-image:latest as php

# # Install system dependencies required for Composer
# RUN apt-get update && apt-get install -y \
#     git \
#     unzip \
#     libzip-dev \
#     && rm -rf /var/lib/apt/lists/*

# # Install Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Set working directory to /app
# WORKDIR /app

# # Copy configuration files
# COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
# COPY ./docker/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
# COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf

# # Copy files from current folder to container current folder (set in workdir)
# COPY --chown=www-data:www-data . .

# # Create Laravel caching folders
# RUN mkdir -p ./storage/framework/{cache,testing,sessions,views,bootstrap/cache}

# # Adjust user permission & group
# RUN usermod --uid 1000 www-data
# RUN groupmod --gid 1000 www-data

# # Make entrypoint script executable
# RUN chmod +x docker/entrypoint.sh

# # Set entrypoint
# ENTRYPOINT ["./docker/entrypoint.sh"]


# Used for prod build.
FROM 147726474727.dkr.ecr.us-east-1.amazonaws.com/laravel-prob-image:latest as php

# Install system dependencies required for Composer
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory to /app
WORKDIR /app

# Copy configuration files
COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
COPY ./docker/php/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy files from current folder to container current folder (set in workdir)
COPY --chown=www-data:www-data . .

# Copy vendor directory
COPY --chown=www-data:www-data vendor /app/vendor

# Create Laravel caching folders
RUN mkdir -p ./storage/framework/{cache,testing,sessions,views,bootstrap/cache}

# Adjust user permission & group
RUN usermod --uid 1000 www-data
RUN groupmod --gid 1000 www-data

# Make entrypoint script executable
RUN chmod +x docker/entrypoint.sh

# Set entrypoint
ENTRYPOINT ["./docker/entrypoint.sh"]
