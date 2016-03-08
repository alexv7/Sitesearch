artist_list = [
              'The Doors',
              'The Doors',
              'Pink Floyd',
              'Ozzy Osbourne',
              'DJ Dado',
              'The Killers',
              'The Who'
              ]

  artist_list.each do |name|
    Artist.find_or_create_by( name: name )
  end

  Artist.create(name: "The Doors")


   label_list =[
                'Universal',
                'Virgin',
                'Atlantic',
                'Gefeen'
                ]

    label_list.each do |name|
      Label.find_or_create_by( name: name )
    end

    album_list = [
                 'The Best of The Doors',
                 'Waiting for the Sun',
                 'Dark Side of the Moon',
                 'Hot Fuss',
                 'Battle Born',
                 'Who Are You',
                 'Live At Leeds',
                 'No More Rain',
                 'The X Files'
                ]

    album_list.each do |name|
      Artist.find_or_create_by( name: name )
    end
  puts "Done!"