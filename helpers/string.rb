class String

  # Will return this string stripped of any whitespace.
  def strip_whitespace
    self.gsub(/\s+/, '')
  end

  # Will strip this string of any whitespace.
  def strip_whitespace!
    replace(self.strip_whitespace)
  end

end