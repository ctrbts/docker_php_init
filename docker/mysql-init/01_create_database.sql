CREATE DATABASE IF NOT EXISTS `tu_basededatos`;
GRANT ALL PRIVILEGES ON `tu_basededatos`.* TO 'tu_usuario'@'%';
FLUSH PRIVILEGES;