require 'sinatra'
require 'sinatra/reloader'
require 'net/http'
require 'json'

get '/home' do
    erb :_home, :locals => { :message => false }
end

post '/playerItems' do
    if params[:playerId].nil? || params[:playerId].empty?
        return erb :_home, :locals => { :message => "Please fill in with the player profile name or id" }
    end
    response = getPlayerInventory(params[:playerId], params[:type])
    erb :_inventory,
        :locals => {
            :items => response[:items],
            :message => response[:message],
            :player => response[:player]
        }
end

# Handle unrecognized pages (404)
not_found do
    redirect to '/home'
end

def getPlayerInventory(playerId, type)
    url = "https://steamcommunity.com/#{type}/#{playerId}/inventory/json/730/2/"
    uri = URI(url)

    begin
        data = Hash.new
        data[:player] = playerId
        response = JSON.parse(Net::HTTP.get(uri))
        if response and !response.nil? or !response.empty? and response['success']
            data[:items] = response['rgDescriptions']
            data[:player] = playerId
        else
            data[:items] = Hash.new
            data[:message] = response['Error']
        end
        return data

    rescue => exception
        data[:items] = Hash.new
        data[:message] = 'Could not fetch data from the api.'
        return data
    end
end





