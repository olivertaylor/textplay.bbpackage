#!/usr/bin/ruby

# This script creates a tags files compatible with BBEdit for use with Fountain Screenplays

# ------------------------------

# First-up, read the input and setup 2 arrays to manipulate

text = ARGF.read
slugs = text
chars = text

# ------------------------------
#         TAGS HEADER
# ------------------------------

# This is a simple header so that BBEdit knows what kind of file this is
# This is REQUIRED

headr = "!_TAG_FILE_FORMAT	2	/extended format; --format=1 will not append ;\" to lines/
!_TAG_FILE_SORTED	1	/0=unsorted, 1=sorted, 2=foldcase/
!_TAG_PROGRAM_AUTHOR	Darren Hiebert	/dhiebert@users.sourceforge.net/
!_TAG_PROGRAM_NAME	Exuberant Ctags	//
!_TAG_PROGRAM_URL	http://ctags.sourceforge.net	/official site/
!_TAG_PROGRAM_VERSION	5.7	//"

# ------------------------------
#          SLUGLINES
# ------------------------------

# Look for all-caps lines and put them in an array
slugs = slugs.scan(/^[\ \t]*\n[ \t]*([^a-z\<\>\n]+)(?=\n\n)/)
slugs.each {|s|
  s.each {|g|
    # Strip-out INT EXT etc.
    g.gsub!(/^(?i:int\/ext|int|ext|i\/e)\s*[,\.-]?\s+/, '')
    # Strip-out TIME
    g.gsub!(/( - .*|\. .*)$/, '')
    # Add the ctags markup
    g << '	*.txt	0;"	access:public	kind:f'
  }
}
# Sort and remove duplicates
slugs = slugs.sort.uniq

# ------------------------------
#          CHARACTERS
# ------------------------------

# Look for dialogue-blocks and put the CHARACTER names in an array
chars = chars.scan(/^[\ \t]*\n[\ \t]*([^a-z\n\t]+)\n(?:[\ \t]*.+\n)+[\ \t]*$/)
chars.each {|c|
  # Add the ctags markup
  c.each {|x| x << '	*.txt	0;"	access:public	kind:c'}
}
# Sort and remove duplicates
chars = chars.sort.uniq

# ------------------------------
#            OUTPUT
# ------------------------------

puts headr
puts "\n\n\n"
puts chars
puts "\n\n"
puts slugs
