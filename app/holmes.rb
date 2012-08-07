class Holmes
  class << self
    def search_in_file(file, *extension)
      def extension.join_with_prefix(prefix, separator)
        self.collect {|e| prefix + e}.join(separator)
      end
      
      pattern = extension.join_with_prefix('.*\.', '|')
      file.read().scan(/#{pattern}/)
    end
    
    def search_in_dir(path, *extension)
      content = []
      Dir.foreach path do |filename|
        content << self.search_in_file(File.open("#{path}/#{filename}"), *extension) if File.file? "#{path}/#{filename}"
      end
      content
    end
  end  
end
