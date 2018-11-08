apache2pkg:
  pkg.installed:
    - name: apache2

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf
    - watch_in: 
      - service: apache2

/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load
    - watch_in: 
      - service: apache2

libapache2-mod-php:
  pkg.installed:
    - watch_in: 
      - service: apache2

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://apache/php7.2.conf
    - watch_in: 
      - service: apache2

apache2:
  service.running:
    - enable: True


