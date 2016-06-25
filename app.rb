class App < Sinatra::Application
  
  helpers Sinatra::ContentFor

  helpers do
    def render(*args)
      if args.first.is_a?(Hash) && args.first.keys.include?(:partial)
        return erb "_#{args.first[:partial]}".to_sym, :layout => false
      else
        super
      end
    end
  end

  before do
    content_type :html, :charset => 'utf-8'
    cache_control :public, :must_revalidate, :max_age => 60 if settings.production?
  end

  get "/" do
    erb :index
  end

  get "/resume" do
    erb :resume
  end

  get "/about" do
    erb :about
  end

  get "/brosmar" do
    erb :brosmar
  end

  get "/bemate" do
    erb :bemate
  end

  get "/ducktypen" do
    erb :ducktypen
  end
  
  get "/europasinrefugio" do
    erb :europasinrefugio
  end

  get "/herramienta-comunidades" do
    erb :herramientacomunidades
  end

  get "/hola2016" do
    erb :hola2016
  end

  not_found do
    erb :'404'
  end

end