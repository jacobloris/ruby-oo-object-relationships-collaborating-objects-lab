class MP3Importer
    attr_reader :path

    def initialize(path)
        @path = path
    end

    def files
        parent_path = Dir.glob(self.path+"/*").map {|file| file.split("/").last}
    end

    def import 
        self.files.map do |file|
            Song.new_by_filename(file)
        end
    end
end
