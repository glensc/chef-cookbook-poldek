# poldek Cookbook CHANGELOG

## v0.2.1

- sort hold/ignore keys to get consistent poldek.conf

## v0.2.0

- add `poldek_repository` resource
- expand variables in template, so the attributes are looked up at converge stage

## v0.1.1

- configure `auto directory dependencies`, `pm command`
- add `hold_comments` and `ignore_comments` via attributes to describe why item is in the list
- add `generated by Chef` header to `poldek.conf`

## v0.1.0
- Initial version, includes default recipe to configure `poldek.conf`
