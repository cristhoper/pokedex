# README

## Project Description

This is a project to get the pokemon data from [Pokeapi](https://pokeapi.co/), 
which URL is defined in `config.api_url` in file `poke-test/config/application.rb`. 
The data is all the pokemons in the national region
The index info list all pokemons in groups of 12 and show the next data:

	Name
	Image

Each pokemon has a button to load a new page with pokemon details. 
This details are:

	Name
	Front image
	Back image
	Weight
	Height
	Abilities
	Moves


## Configuration

### Requirements & Installation
* Ruby version 2.3.3 or later
* Rails version 5.1.1

Install Ruby Version Manager(RVM) with Ruby. 
You can find the installation steps in [here](https://rvm.io/)
However, this are the few necessary steps:
Before any other step install mpapis public key (might need gpg2) (see security)

```bash
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source $HOME/.rvm/scripts/rvm
rvm list
rvm use
```

Project dependencies, deploy and execution:
```bash
bundle install
rails s
```
All is running in browser at `http://localhost:3000/`
