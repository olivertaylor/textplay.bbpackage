#!/usr/bin/ruby

# Read input
d = ARGF.read

d = d.gsub(/\n/, "\n\n")

# The Transformations
d = d.gsub(/^g: (.+)$(\n+)/,  'GREEN'      + "\n" + '\1' + "\n\n")
d = d.gsub(/^m: (.+)$(\n+)/,  'MILLER'     + "\n" + '\1' + "\n\n")
d = d.gsub(/^v: (.+)$(\n+)/,  'VOSS'       + "\n" + '\1' + "\n\n")
d = d.gsub(/^w: (.+)$(\n+)/,  'WOO'        + "\n" + '\1' + "\n\n")
d = d.gsub(/^ww: (.+)$(\n+)/, 'WALLACH'    + "\n" + '\1' + "\n\n")
d = d.gsub(/^p: (.+)$(\n+)/,  'WILLIAM'    + "\n" + '\1' + "\n\n")
d = d.gsub(/^t: (.+)$(\n+)/,  'TORRES'     + "\n" + '\1' + "\n\n")
d = d.gsub(/^a: (.+)$(\n+)/,  'AIRMEN'     + "\n" + '\1' + "\n\n")
d = d.gsub(/^aa: (.+)$(\n+)/, 'AGENT'      + "\n" + '\1' + "\n\n")
d = d.gsub(/^r: (.+)$(\n+)/,  'RADIO ()'   + "\n" + '\1' + "\n\n")
d = d.gsub(/^h: (.+)$(\n+)/,  'HENDRICKS'  + "\n" + '\1' + "\n\n")
d = d.gsub(/^b: (.+)$(\n+)/,  'BARTON'  + "\n" + '\1' + "\n\n")
d = d.gsub(/^y: (.+)$(\n+)/,  'YAMAMOTO'  + "\n" + '\1' + "\n\n")

# Any line with a colon in it will get transformed by this:
d = d.gsub(/^(.+?): (.+\n)\n?/){|s| $1.upcase + "\n" + $2 + "\n"}

# Print the result
print d
