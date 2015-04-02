{% from "template/map.jinja" import template with context %}

template:
  pkg.installed:
    - name: {{ template.pkg }}
  service.running:
    - name: {{ template.service }}
    - enable: True

hub_tar:
{# https://github.com/github/hub/releases  #}
{# for os, arch in linux:386,amd64; mac:amd64; windows:386,amd64 #}
  file.managed:
    - name: hub-linux-amd64-2.2.0.tar.gz
    - source: https://github.com/github/hub/releases/download/v2.2.0/hub-linux-amd64-2.2.0.tar.gz
    - extract
      - dest:
        path: /home/$user/hub

completion_bash:
https://github.com/github/hub/blob/master/etc/hub.bash_completion.sh

completion_zsh:
https://github.com/github/hub/blob/master/etc/hub.zsh_completion
  file:
    - line.managed
    - fpath=(~/hub/etc $fpath)


