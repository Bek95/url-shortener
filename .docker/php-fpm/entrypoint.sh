#!/bin/sh

echo "🔥 Entrypoint script is running..."

# Vérifier que DB_HOST est bien défini
if [ -z "$DB_HOST" ]; then
  echo "❌ ERROR: DB_HOST is not set!"
  exit 1
fi

echo "🔍 DB_HOST is set to: $DB_HOST"

# Attendre que MySQL soit prêt
echo "⏳ Waiting for MySQL to be ready..."
until mysqladmin ping -h"$DB_HOST" --silent; do
  echo "⏳ MySQL is not ready yet. Retrying..."
  sleep 2
done

echo "✅ MySQL is ready! Running migrations..."
php artisan migrate --force

echo "🚀 Starting PHP-FPM..."
exec php-fpm
