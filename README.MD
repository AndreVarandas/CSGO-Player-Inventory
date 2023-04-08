# CSGO Player Inventory

Fetches public player profile Counter Strike items.

We have a live version at [Heroku](http://csgo-inventory-items.herokuapp.com/).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

- Ruby 3.2.2
- Bundler 2.4.10

```
$ gem install bundler
```

### Installing

To get it running localy, start by cloning this repository and then at the root folder run the following commands to install dependencies and start a development server.

```
$ bundle install
$ rackup
```

You can now access the local version at `http://localhost:9292/`.

## Deployment

Can be deployed directly to herokuapp.com. Simply create a new heroku project and push to the new heroku remote.

## Built With

- [Sinatra](http://sinatrarb.com/) - The web framework used
- [RubyGems](https://rubygems.org/) - Dependency Management
- [Sass](https://sass-lang.com/) - CSS with superpowers

## Contributing

Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) for details on our code of conduct. Feel free to open any issue and/or submit a pull request. 😎

## Authors

- **André Varandas** - _Initial work_ - [André Varandas](https://github.com/AndreVarandas).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
