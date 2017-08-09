base:
  '*':
    - globals

{% set datacenters = ('nyc', 'ric', 'sfo', 'dev', 'qa') %}

{% for dc in datacenters %}
{{ dc }}:
  'dc:{{ dc }}':
    - match: grain
    - common
    - common.users
    - common.repositories
    - common.packages
    - common.files
    - common.services
  'G@dc:{{ dc }} and G@nodetype:api':
    - match: compound
    - api
    - api.packages
    - api.files
    - api.services