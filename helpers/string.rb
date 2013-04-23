class String

  def strip_whitespace
    self.gsub(/\s+/, '')
  end

  def strip_whitespace!
    replace(self.strip_whitespace)
  end

end