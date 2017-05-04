class String
  def demodulize
    if i = self.rindex('::')
      self[(i+2)..-1]
    else
      self
    end
  end

  def deconstantize
    self.to_s[0, self.rindex('::') || 0] # implementation based on the one in facets' Module#spacename
  end

  def camelize
    self.split('_').collect(&:capitalize).join
  end
end
