#!/usr/bin/ruby

# Read input
d = ARGF.read

d = d.gsub(/\n/, "\n\n")

# The Transformations
d = d.gsub(/^b: (.+)$(\n+)/,  'BETHANY'  + "\n" + '\1' + "\n\n")
d = d.gsub(/^f: (.+)$(\n+)/,  'AGENT FRANKIE'    + "\n" + '\1' + "\n\n")
d = d.gsub(/^g: (.+)$(\n+)/,  'GREEN'      + "\n" + '\1' + "\n\n")
d = d.gsub(/^m: (.+)$(\n+)/,  'MCCLOUD'       + "\n" + '\1' + "\n\n")
d = d.gsub(/^p: (.+)$(\n+)/,  'PRES. ARCHER'    + "\n" + '\1' + "\n\n")
d = d.gsub(/^r: (.+)$(\n+)/,  'RUBY'  + "\n" + '\1' + "\n\n")
d = d.gsub(/^s: (.+)$(\n+)/,  'SGT. FOXCRAFT'    + "\n" + '\1' + "\n\n")
d = d.gsub(/^t: (.+)$(\n+)/,  'TORRES'     + "\n" + '\1' + "\n\n")
d = d.gsub(/^w: (.+)$(\n+)/,  'WOO'        + "\n" + '\1' + "\n\n")
d = d.gsub(/^y: (.+)$(\n+)/,  'YAMAMOTO'  + "\n" + '\1' + "\n\n")
d = d.gsub(/^z: (.+)$(\n+)/,  'ZIMMER'     + "\n" + '\1' + "\n\n")

# Any line with a colon in it will get transformed by this:
d = d.gsub(/^(.+?): (.+\n)\n?/){|s| $1.upcase + "\n" + $2 + "\n"}

# Print the result
print d
