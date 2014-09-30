class App < Sinatra::Application
  
  helpers Sinatra::ContentFor

  before do
    content_type :html, :charset => 'utf-8'
    cache_control :public, :must_revalidate, :max_age => 60 if settings.production?
  end

  get "/" do
    @selected = :home
    erb :index
  end

  get "/resume" do
    @selected = :curriculum
    erb :resume
  end

  not_found do
    erb :'404'
  end

end