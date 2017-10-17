Shoes.app(title: "Ruby Extraction Program RuXt", width: 600, height: 400) do
  background white

  flow width: 0.3, height: 0.2, margin: 10 do
    button "Exit", width: 0.3, height: 0.5 do
      Shoes.quit()
    end

    list_box :items => ["Extract", "Compress"] do |e|
       @cmd = e.text
    end
  end

  stack margin: 10 do
    background gainsboro
    subtitle "RuXt (Ruby Extractor)"
    tagline "GUI version 0.0.1"
  end

  flow margin: 10 do
    button "Choose a file" do
      $filename = ask_open_file
      @info.replace "Selected files: #{$filename}"
    end

    button "Execute" do
      case @cmd
      when "Extract"
        filetype  = $filename.partition(".").last
        directory = File.dirname($filename)
          case filetype
            when "tar"
              system("tar -xfv #{$filename} -C #{directory}")
            when "tar.gz"
              system("tar -xvzf #{$filename} -C #{directory}")
            when "zip"
              system("unzip #{$filename} -d #{directory}")
            when "rar"
              system("unrar e #{$filename} #{directory}")
            when "7z"
              system("7z x #{$filename} -o #{directory}")
        end

      when "Compress"

      end
    end
  end

  stack margin: 10 do
    background gainsboro
    @info = para "No file selected"
  end
end