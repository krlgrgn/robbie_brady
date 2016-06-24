module RobbieBrady
  class API < Grape::API
    format :json

    # Allow CORS
    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    resources :users do
      get do
        [{name: 'Robbie Brady'}]
      end
    end

    #add_swagger_documentation
  end
end
