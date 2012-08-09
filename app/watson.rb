class Watson
  class << self
    def search_files_in(args)
      Dir.new(args[:dir]).entries.reject {|f| f =~ /#{args[:extensions].join('|')}/ }
    end
  end
end



