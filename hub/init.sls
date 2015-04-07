hub_tar:
{# https://github.com/github/hub/releases  #}
{# for os, arch in linux:386,amd64; mac:amd64; windows:386,amd64 #}
  archive:
    - extracted
    - name: /usr/cache/salt/hub
    - source: https://github.com/github/hub/releases/download/v2.2.0/hub-linux-amd64-2.2.0.tar.gz
    - source_hash: md5={{ salt['pillar.get']('hub_package:package:name:md5') }}
    - archive_format: tar
    - tar_options: vxz

#hub_alias_git:
#  file:
#    - line.managed
#    - name: /home/$user/.bash_aliases
#    - line: eval "$(hub alias -s)"

#hub_alias_git_zsh:
#  file:
#    - line.managed
#    - name: /home/$user/.zshrc
#    - line: eval "$(hub alias -s)"

# https://github.com/github/hub/blob/master/etc/hub.bash_completion.sh
completion_bash:
  file:
    - symlink
    - name: /user/share/bash-completion/completions/hub
    - target: /usr/cache/salt/hub/etc/hub.bash_completion.sh

# https://github.com/github/hub/blob/master/etc/hub.zsh_completion
#completion_zsh:
#  file:
#    - line.managed
#    - fpath=(~/hub/etc $fpath)
#

