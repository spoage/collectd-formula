{% from "collectd/map.jinja" import collectd_settings with context %}

include:
  - collectd

{{ collectd_settings.plugindirconfig }}/apache.conf:
  file.managed:
    - source: salt://collectd/files/apache.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - watch_in:
      - service: collectd-service
