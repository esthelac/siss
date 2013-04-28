require 'net/http'
require 'json'

class LocationsController < ApplicationController

  def index
    # 1. Recibir lat, long, ciudad
    lat = params['lat'];
    lon = params['lon'];
    cty = params['cty'];

    # 2. Recuperar proximas 5 visitas
    url = URI.parse("http://api.open-notify.org/iss/v1/?" + "lat=" + lat + "&lon=-"+ lon  + "&n=10" + "&n=5");

	req = Net::HTTP::Get.new(url.path)
	res = Net::HTTP.start(url.host, url.port) {|http|
	  http.request(req)
	}
	#puts res.body #<-- Nuestra respuesta

	#puts JSON.parse(res.body)
	data = JSON.parse(res.body)
	responses = data["response"]

	responses.each do |item|
		#DateTime.strptime("1367035459", '%s')
	end



    # 3. Recuperar el clima de cada visita


    # 4. Retornar la data

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => responses }
    end
  end

end
