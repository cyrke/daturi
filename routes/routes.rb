require "./models/img"

# Defines routes

# Home
get "/" do
  erb :index
end

# Converted
post "/" do
  images = params[:images]
  @imgs = []

  if images.nil? || images.count === 0
    redirect "/"
    return
  end

  images.each do |image|
    @imgs << Img.new(image[:filename], image[:type], image[:tempfile])
  end

  erb :converted, :locals => {:results => @imgs}
end