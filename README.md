Poldek Cookbook
===============

This cookbook manages [poldek](http://poldek.pld-linux.org/) config and repositories.

## Requirements

### Platforms
- PLD Linux (Th, Ac)

### Chef
- Chef 11+

### Cookbooks
- None

## Recipes

## Attributes

## Resources/Providers

### `poldek_repository`

This LWRP provides an easy way to manage additional Poldek repositories.

#### Actions

- `:add` creates a repository file and builds the repository listing (default)
- `:remove` removes the repository file

#### Attribute Parameters

- `repo_name`: name attribute. Unique name name of the repository and config file
- `path`: Unique name of the repository. May be either path or URL.
- `ignore`: package patterns to ignore
- `auto`: Controling if repository index will be implicit loaded
- `autoup`: Controls if repository index will be implicit updated.

#### Examples

Add the glen's carme repo:

```ruby
poldek_repository 'carme' do
  path 'http://carme.pld-linux.org/~glen/th/x86_64/'
end
```

Remove carme repo:

```ruby
poldek_repository 'carme' do
  action :remove
end
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## Testing

1. `bundle install --without development --path .`
2. `bundle exec foodcritic -f any .`
3. `bundle exec rubocop`

## License and Author

Author:: Elan Ruusamäe (<glen@delfi.ee>)

Copyright 2016, Elan Ruusamäe

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
