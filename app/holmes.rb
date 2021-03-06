class Holmes
  class << self
    def search_in(args)
      if args[:dir].nil?
        return self.search_in_file(args[:file], args[:extensions])
      else
        return self.search_in_dir(args[:dir], args[:extensions])
      end
    end  

    protected
    def search_in_file(file_name, extensions)
      def extensions.join_with_prefix(prefix, separator)
        self.collect {|e| prefix + e}.join(separator)
      end
      
      pattern = extensions.join_with_prefix('.*\.', '|')
      { :file => file_name, :references => File.open(file_name).read().scan(/#{pattern}/) }
    end
    
    def search_in_dir(path, extensions)
      heap = []
      Dir.foreach path do |file_name|
        heap << self.search_in_file("#{path}/#{file_name}", extensions) if File.file? "#{path}/#{file_name}"
      end
      heap
    end
  end  
end
