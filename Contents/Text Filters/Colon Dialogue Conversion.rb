#!/usr/bin/ruby
ARGF.set_encoding(Encoding::UTF_8)

# Read input
d = ARGF.read

d = d.gsub(/\n/, "\n\n")

# Any line with 2 colons in it will get transformed by this:
d = d.gsub(/^(.+?):: *(.+\n)\n?/){|s| $1.upcase + "\n" + $2 + "\n"}

# clean-up empty lines
d = d.gsub(/\n\n(?=\n)|\n\z/, "")

# Print the result
print d
