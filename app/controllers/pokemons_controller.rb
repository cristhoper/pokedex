class PokemonsController < ApplicationController

  def index
    # function loads all pokemons of national region because the
    # pokedex national ID is 1
    begin
      url = Rails.configuration.api_url+'pokedex/1'
      response = RestClient.get url
      if response.code == 200
        # if response was successfully parse JSON
        response = JSON.parse(response)
        # get the values of all pokemons in the national region and paginate
        @pokemons = response["pokemon_entries"].paginate(:page => params[:page], :per_page => 12)
      else
        # if response code isn't succed, set a message to the user and show the view
        flash[:error] = 'Ocurrió un error en la consulta hacia pokeapi. Por favor, inténtalo nuevamente'
      end
    rescue
      #if an exception appears, set a message to the user and show the view
      flash[:error] = 'Ocurrió un error en la consulta hacia pokeapi. Por favor, inténtalo nuevamente'
    end
  end

  def show
    begin
      # get the detail information for pokemon id based on pokemon api.
      url = Rails.configuration.api_url+'pokemon/'+params[:id]
      response = RestClient.get url
      if response.code == 200
        # if response was successfully, save data in new var for view
        @pokemon_data = JSON.parse(response)
      else
        # if response code isn't succed, set a message to the user and show the view
        flash[:error] = 'Ocurrió un error en la consulta hacia pokeapi. Por favor, inténtalo nuevamente'
      end
    rescue
      #if an exception appears, set a message to the user and show the view
      flash[:error] = 'Ocurrió un error en la consulta hacia pokeapi. Por favor, inténtalo nuevamente'
    end
  end
end
