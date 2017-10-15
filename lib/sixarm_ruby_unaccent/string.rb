# -*- coding: utf-8 -*-
=begin rdoc
String extensions.
=end

class String
  # Replace a string's accented characters with unaccented characters.
  #
  # @example
  #   s = "Å Ç ß".freeze
  #   s.unaccent = > "AA C ss".freeze
  #
  # @return [String] a string that has no accents

  def unaccent
    unaccent_via_scan
  end

  # Replace a string's accented characters with unaccented characters,
  # by using string `#scan` to iterate on characters.
  #
  # @example
  #   s = "Å Ç ß".freeze
  #   s.unaccent_via_scan = > "AA C ss".freeze
  #
  # @return [String] a string that has no accents

  def unaccent_via_scan
    result = ''
    scan(/./) { |c| result << (ACCENTMAP[c] || c) }
    result
  end

  # Replace a string's accented characters with unaccented characters,
  # by using string `#each_char` to iterate on characters.
  #
  # @example
  #   s = "Å Ç ß".freeze
  #   s.unaccent_via_each_char = > "AA C ss".freeze
  #
  # @return [String] a string that has no accents

  def unaccent_via_each_char
    result = ''
    each_char { |c| result << (ACCENTMAP[c] || c) }
    result
  end

  # Replace a string's accented characters with unaccented characters,
  # by using string `#split` and `#map` to iterate on characters.
  #
  # @example
  #   s = "Å Ç ß".freeze
  #   s.unaccent_via_split_map = > "AA C ss".freeze
  #
  # @return [String] a string that has no accents

  def unaccent_via_split_map
    split(//u).map { |c| ACCENTMAP[c] || c }.join(''.freeze)
  end

  ACCENTMAP = {

    # 00A0 NO-BREAK SPACE
    # ->   0020 SPACE
    "\u{A0}".freeze => ' '.freeze,

    # 00A8 DIAERESIS
    # ->   0020 SPACE
    "\u{A8}".freeze => ' '.freeze,

    # 00AA FEMININE ORDINAL INDICATOR
    # ->   0061 LATIN SMALL LETTER A
    "\u{AA}".freeze => 'a'.freeze,

    # 00AF MACRON
    # ->   0020 SPACE
    "\u{AF}".freeze => ' '.freeze,

    # 00B2 SUPERSCRIPT TWO
    # ->   0032 DIGIT TWO
    "\u{B2}".freeze => '2'.freeze,

    # 00B3 SUPERSCRIPT THREE
    # ->   0033 DIGIT THREE
    "\u{B3}" => '3'.freeze,

    # 00B4 ACUTE ACCENT
    # ->   0020 SPACE
    "\u{B4}".freeze => ' '.freeze,

    # 00B5 MICRO SIGN
    # ->   03BC GREEK SMALL LETTER MU
    "\u{B5}".freeze => "\u{03BC}".freeze,

    # 00B8 CEDILLA
    # ->   0020 SPACE
    "\u{B8}".freeze => ' '.freeze,

    # 00B9 SUPERSCRIPT ONE
    # ->   0031 DIGIT ONE
    "\u{B9}".freeze => '1'.freeze,

    # 00BA MASCULINE ORDINAL INDICATOR
    # ->   006F LATIN SMALL LETTER O
    "\u{BA}".freeze => 'o'.freeze,

    # 00BC VULGAR FRACTION ONE QUARTER
    # ->   0031 DIGIT ONE
    #    + 2044 FRACTION SLASH
    #    + 0034 DIGIT FOUR
    "\u{BC}".freeze => "1\u{2044}4".freeze,

    # 00BD VULGAR FRACTION ONE HALF
    # ->   0031 DIGIT ONE
    #    + 2044 FRACTION SLASH
    #    + 0032 DIGIT TWO
    "\u{BD}".freeze => "1\u{2044}2".freeze,

    # 00BE VULGAR FRACTION THREE QUARTERS
    # ->   0033 DIGIT THREE
    #    + 2044 FRACTION SLASH
    #    + 0034 DIGIT FOUR
    "\u{BE}".freeze => "3\u{2044}4".freeze,

    # 00C0 LATIN CAPITAL LETTER A WITH GRAVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{C0}".freeze => 'A'.freeze,

    # 00C1 LATIN CAPITAL LETTER A WITH ACUTE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{C1}".freeze => 'A'.freeze,

    # 00C2 LATIN CAPITAL LETTER A WITH CIRCUMFLEX
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{C2}".freeze => 'A'.freeze,

    # 00C3 LATIN CAPITAL LETTER A WITH TILDE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{C3}".freeze => 'A'.freeze,

    # 00C4 LATIN CAPITAL LETTER A WITH DIAERESIS
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{C4}".freeze => 'A'.freeze,

    # 00C5 LATIN CAPITAL LETTER A WITH RING ABOVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{C5}".freeze => 'A'.freeze,

    # 00C6 LATIN CAPITAL LETTER AE
    # ->   0041 LATIN CAPITAL LETTER A
    #    + 0045 LATIN CAPITAL LETTER E
    "\u{C6}".freeze => 'AE'.freeze,

    # 00C7 LATIN CAPITAL LETTER C WITH CEDILLA
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{C7}".freeze => 'C'.freeze,

    # 00C8 LATIN CAPITAL LETTER E WITH GRAVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{C8}".freeze => 'E'.freeze,

    # 00C9 LATIN CAPITAL LETTER E WITH ACUTE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{C9}".freeze => 'E'.freeze,

    # 00CA LATIN CAPITAL LETTER E WITH CIRCUMFLEX
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{CA}".freeze => 'E'.freeze,

    # 00CB LATIN CAPITAL LETTER E WITH DIAERESIS
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{CB}".freeze => 'E'.freeze,

    # 00CC LATIN CAPITAL LETTER I WITH GRAVE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{CC}".freeze => 'I'.freeze,

    # 00CD LATIN CAPITAL LETTER I WITH ACUTE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{CD}".freeze => 'I'.freeze,

    # 00CE LATIN CAPITAL LETTER I WITH CIRCUMFLEX
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{CE}".freeze => 'I'.freeze,

    # 00CF LATIN CAPITAL LETTER I WITH DIAERESIS
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{CF}".freeze => 'I'.freeze,

    # 00D1 LATIN CAPITAL LETTER N WITH TILDE
    # ->   004E LATIN CAPITAL LETTER N
    "\u{D1}".freeze => 'N'.freeze,

    # 00D2 LATIN CAPITAL LETTER O WITH GRAVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{D2}".freeze => 'O'.freeze,

    # 00D3 LATIN CAPITAL LETTER O WITH ACUTE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{D3}".freeze => 'O'.freeze,

    # 00D4 LATIN CAPITAL LETTER O WITH CIRCUMFLEX
    # ->   004F LATIN CAPITAL LETTER O
    "\u{D4}".freeze => 'O'.freeze,

    # 00D5 LATIN CAPITAL LETTER O WITH TILDE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{D5}".freeze => 'O'.freeze,

    # 00D6 LATIN CAPITAL LETTER O WITH DIAERESIS
    # ->   004F LATIN CAPITAL LETTER O
    "\u{D6}".freeze => 'O'.freeze,

    # 00D8 LATIN CAPITAL LETTER O WITH STROKE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{D8}".freeze => 'O'.freeze,

    # 00D9 LATIN CAPITAL LETTER U WITH GRAVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{D9}".freeze => 'U'.freeze,

    # 00DA LATIN CAPITAL LETTER U WITH ACUTE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{DA}".freeze => 'U'.freeze,

    # 00DB LATIN CAPITAL LETTER U WITH CIRCUMFLEX
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{DB}".freeze => 'U'.freeze,

    # 00DC LATIN CAPITAL LETTER U WITH DIAERESIS
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{DC}".freeze => 'U'.freeze,

    # 00DD LATIN CAPITAL LETTER Y WITH ACUTE
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{DD}".freeze => 'Y'.freeze,

    # 00E0 LATIN SMALL LETTER A WITH GRAVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{E0}".freeze => 'a'.freeze,

    # 00E1 LATIN SMALL LETTER A WITH ACUTE
    # ->   0061 LATIN SMALL LETTER A
    "\u{E1}".freeze => 'a'.freeze,

    # 00E2 LATIN SMALL LETTER A WITH CIRCUMFLEX
    # ->   0061 LATIN SMALL LETTER A
    "\u{E2}".freeze => 'a'.freeze,

    # 00E3 LATIN SMALL LETTER A WITH TILDE
    # ->   0061 LATIN SMALL LETTER A
    "\u{E3}".freeze => 'a'.freeze,

    # 00E4 LATIN SMALL LETTER A WITH DIAERESIS
    # ->   0061 LATIN SMALL LETTER A
    "\u{E4}".freeze => 'a'.freeze,

    # 00E5 LATIN SMALL LETTER A WITH RING ABOVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{E5}".freeze => 'a'.freeze,

    # 00E6 LATIN SMALL LETTER AE
    # ->   0061 LATIN SMALL LETTER A
    #    + 0065 LATIN SMALL LETTER E
    "\u{E6}".freeze => 'ae'.freeze,

    # 00E7 LATIN SMALL LETTER C WITH CEDILLA
    # ->   0063 LATIN SMALL LETTER C
    "\u{E7}".freeze => 'c'.freeze,

    # 00E8 LATIN SMALL LETTER E WITH GRAVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{E8}".freeze => 'e'.freeze,

    # 00E9 LATIN SMALL LETTER E WITH ACUTE
    # ->   0065 LATIN SMALL LETTER E
    "\u{E9}".freeze => 'e'.freeze,

    # 00EA LATIN SMALL LETTER E WITH CIRCUMFLEX
    # ->   0065 LATIN SMALL LETTER E
    "\u{EA}".freeze => 'e'.freeze,

    # 00EB LATIN SMALL LETTER E WITH DIAERESIS
    # ->   0065 LATIN SMALL LETTER E
    "\u{EB}".freeze => 'e'.freeze,

    # 00EC LATIN SMALL LETTER I WITH GRAVE
    # ->   0069 LATIN SMALL LETTER I
    "\u{EC}".freeze => 'i'.freeze,

    # 00ED LATIN SMALL LETTER I WITH ACUTE
    # ->   0069 LATIN SMALL LETTER I
    "\u{ED}".freeze => 'i'.freeze,

    # 00EE LATIN SMALL LETTER I WITH CIRCUMFLEX
    # ->   0069 LATIN SMALL LETTER I
    "\u{EE}".freeze => 'i'.freeze,

    # 00EF LATIN SMALL LETTER I WITH DIAERESIS
    # ->   0069 LATIN SMALL LETTER I
    "\u{EF}".freeze => 'i'.freeze,

    # 00F1 LATIN SMALL LETTER N WITH TILDE
    # ->   006E LATIN SMALL LETTER N
    "\u{F1}".freeze => 'n'.freeze,

    # 00F2 LATIN SMALL LETTER O WITH GRAVE
    # ->   006F LATIN SMALL LETTER O
    "\u{F2}".freeze => 'o'.freeze,

    # 00F3 LATIN SMALL LETTER O WITH ACUTE
    # ->   006F LATIN SMALL LETTER O
    "\u{F3}".freeze => 'o'.freeze,

    # 00F4 LATIN SMALL LETTER O WITH CIRCUMFLEX
    # ->   006F LATIN SMALL LETTER O
    "\u{F4}".freeze => 'o'.freeze,

    # 00F5 LATIN SMALL LETTER O WITH TILDE
    # ->   006F LATIN SMALL LETTER O
    "\u{F5}".freeze => 'o'.freeze,

    # 00F6 LATIN SMALL LETTER O WITH DIAERESIS
    # ->   006F LATIN SMALL LETTER O
    "\u{F6}".freeze => 'o'.freeze,

    # 00F8 LATIN SMALL LETTER O WITH STROKE
    # ->   006F LATIN SMALL LETTER O
    "\u{F8}".freeze => 'o'.freeze,

    # 00F9 LATIN SMALL LETTER U WITH GRAVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{F9}".freeze => 'u'.freeze,

    # 00FA LATIN SMALL LETTER U WITH ACUTE
    # ->   0075 LATIN SMALL LETTER U
    "\u{FA}".freeze => 'u'.freeze,

    # 00FB LATIN SMALL LETTER U WITH CIRCUMFLEX
    # ->   0075 LATIN SMALL LETTER U
    "\u{FB}".freeze => 'u'.freeze,

    # 00FC LATIN SMALL LETTER U WITH DIAERESIS
    # ->   0075 LATIN SMALL LETTER U
    "\u{FC}".freeze => 'u'.freeze,

    # 00FD LATIN SMALL LETTER Y WITH ACUTE
    # ->   0079 LATIN SMALL LETTER Y
    "\u{FD}".freeze => 'y'.freeze,

    # 00FF LATIN SMALL LETTER Y WITH DIAERESIS
    # ->   0079 LATIN SMALL LETTER Y
    "\u{FF}".freeze => 'y'.freeze,

    # 0100 LATIN CAPITAL LETTER A WITH MACRON
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{0100}".freeze => 'A'.freeze,

    # 0101 LATIN SMALL LETTER A WITH MACRON
    # ->   0061 LATIN SMALL LETTER A
    "\u{0101}".freeze => 'a'.freeze,

    # 0102 LATIN CAPITAL LETTER A WITH BREVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{0102}".freeze => 'A'.freeze,

    # 0103 LATIN SMALL LETTER A WITH BREVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{0103}".freeze => 'a'.freeze,

    # 0104 LATIN CAPITAL LETTER A WITH OGONEK
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{0104}".freeze => 'A'.freeze,

    # 0105 LATIN SMALL LETTER A WITH OGONEK
    # ->   0061 LATIN SMALL LETTER A
    "\u{0105}".freeze => 'a'.freeze,

    # 0106 LATIN CAPITAL LETTER C WITH ACUTE
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{0106}".freeze => 'C'.freeze,

    # 0107 LATIN SMALL LETTER C WITH ACUTE
    # ->   0063 LATIN SMALL LETTER C
    "\u{0107}".freeze => 'c'.freeze,

    # 0108 LATIN CAPITAL LETTER C WITH CIRCUMFLEX
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{0108}".freeze => 'C'.freeze,

    # 0109 LATIN SMALL LETTER C WITH CIRCUMFLEX
    # ->   0063 LATIN SMALL LETTER C
    "\u{0109}".freeze => 'c'.freeze,

    # 010A LATIN CAPITAL LETTER C WITH DOT ABOVE
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{010A}".freeze => 'C'.freeze,

    # 010B LATIN SMALL LETTER C WITH DOT ABOVE
    # ->   0063 LATIN SMALL LETTER C
    "\u{010B}".freeze => 'c'.freeze,

    # 010C LATIN CAPITAL LETTER C WITH CARON
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{010C}".freeze => 'C'.freeze,

    # 010D LATIN SMALL LETTER C WITH CARON
    # ->   0063 LATIN SMALL LETTER C
    "\u{010D}".freeze => 'c'.freeze,

    # 010E LATIN CAPITAL LETTER D WITH CARON
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{010E}".freeze => 'D'.freeze,

    # 010F LATIN SMALL LETTER D WITH CARON
    # ->   0064 LATIN SMALL LETTER D
    "\u{010F}".freeze => 'd'.freeze,

    # 0110 LATIN CAPITAL LETTER D WITH STROKE
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{0110}".freeze => 'D'.freeze,

    # 0111 LATIN SMALL LETTER D WITH STROKE
    # ->   0064 LATIN SMALL LETTER D
    "\u{0111}".freeze => 'd'.freeze,

    # 0112 LATIN CAPITAL LETTER E WITH MACRON
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{0112}".freeze => 'E'.freeze,

    # 0113 LATIN SMALL LETTER E WITH MACRON
    # ->   0065 LATIN SMALL LETTER E
    "\u{0113}".freeze => 'e'.freeze,

    # 0114 LATIN CAPITAL LETTER E WITH BREVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{0114}".freeze => 'E'.freeze,

    # 0115 LATIN SMALL LETTER E WITH BREVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{0115}".freeze => 'e'.freeze,

    # 0116 LATIN CAPITAL LETTER E WITH DOT ABOVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{0116}".freeze => 'E'.freeze,

    # 0117 LATIN SMALL LETTER E WITH DOT ABOVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{0117}".freeze => 'e'.freeze,

    # 0118 LATIN CAPITAL LETTER E WITH OGONEK
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{0118}".freeze => 'E'.freeze,

    # 0119 LATIN SMALL LETTER E WITH OGONEK
    # ->   0065 LATIN SMALL LETTER E
    "\u{0119}".freeze => 'e'.freeze,

    # 011A LATIN CAPITAL LETTER E WITH CARON
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{011A}".freeze => 'E'.freeze,

    # 011B LATIN SMALL LETTER E WITH CARON
    # ->   0065 LATIN SMALL LETTER E
    "\u{011B}".freeze => 'e'.freeze,

    # 011C LATIN CAPITAL LETTER G WITH CIRCUMFLEX
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{011C}".freeze => 'G'.freeze,

    # 011D LATIN SMALL LETTER G WITH CIRCUMFLEX
    # ->   0067 LATIN SMALL LETTER G
    "\u{011D}".freeze => 'g'.freeze,

    # 011E LATIN CAPITAL LETTER G WITH BREVE
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{011E}".freeze => 'G'.freeze,

    # 011F LATIN SMALL LETTER G WITH BREVE
    # ->   0067 LATIN SMALL LETTER G
    "\u{011F}".freeze => 'g'.freeze,

    # 0120 LATIN CAPITAL LETTER G WITH DOT ABOVE
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{0120}".freeze => 'G'.freeze,

    # 0121 LATIN SMALL LETTER G WITH DOT ABOVE
    # ->   0067 LATIN SMALL LETTER G
    "\u{0121}".freeze => 'g'.freeze,

    # 0122 LATIN CAPITAL LETTER G WITH CEDILLA
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{0122}".freeze => 'G'.freeze,

    # 0123 LATIN SMALL LETTER G WITH CEDILLA
    # ->   0067 LATIN SMALL LETTER G
    "\u{0123}".freeze => 'g'.freeze,

    # 0124 LATIN CAPITAL LETTER H WITH CIRCUMFLEX
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{0124}".freeze => 'H'.freeze,

    # 0125 LATIN SMALL LETTER H WITH CIRCUMFLEX
    # ->   0068 LATIN SMALL LETTER H
    "\u{0125}".freeze => 'h'.freeze,

    # 0126 LATIN CAPITAL LETTER H WITH STROKE
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{0126}".freeze => 'H'.freeze,

    # 0127 LATIN SMALL LETTER H WITH STROKE
    # ->   0068 LATIN SMALL LETTER H
    "\u{0127}".freeze => 'h'.freeze,

    # 0128 LATIN CAPITAL LETTER I WITH TILDE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{0128}".freeze => 'I'.freeze,

    # 0129 LATIN SMALL LETTER I WITH TILDE
    # ->   0069 LATIN SMALL LETTER I
    "\u{0129}".freeze => 'i'.freeze,

    # 012A LATIN CAPITAL LETTER I WITH MACRON
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{012A}".freeze => 'I'.freeze,

    # 012B LATIN SMALL LETTER I WITH MACRON
    # ->   0069 LATIN SMALL LETTER I
    "\u{012B}".freeze => 'i'.freeze,

    # 012C LATIN CAPITAL LETTER I WITH BREVE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{012C}".freeze => 'I'.freeze,

    # 012D LATIN SMALL LETTER I WITH BREVE
    # ->   0069 LATIN SMALL LETTER I
    "\u{012D}".freeze => 'i'.freeze,

    # 012E LATIN CAPITAL LETTER I WITH OGONEK
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{012E}".freeze => 'I'.freeze,

    # 012F LATIN SMALL LETTER I WITH OGONEK
    # ->   0069 LATIN SMALL LETTER I
    "\u{012F}".freeze => 'i'.freeze,

    # 0130 LATIN CAPITAL LETTER I WITH DOT ABOVE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{0130}".freeze => 'I'.freeze,

    # 0132 LATIN CAPITAL LIGATURE IJ
    # ->   0049 LATIN CAPITAL LETTER I
    #    + 004A LATIN CAPITAL LETTER J
    "\u{0132}".freeze => 'IJ'.freeze,

    # 0133 LATIN SMALL LIGATURE IJ
    # ->   0069 LATIN SMALL LETTER I
    #    + 006A LATIN SMALL LETTER J
    "\u{0133}".freeze => 'ij'.freeze,

    # 0134 LATIN CAPITAL LETTER J WITH CIRCUMFLEX
    # ->   004A LATIN CAPITAL LETTER J
    "\u{0134}".freeze => 'J'.freeze,

    # 0135 LATIN SMALL LETTER J WITH CIRCUMFLEX
    # ->   006A LATIN SMALL LETTER J
    "\u{0135}".freeze => 'j'.freeze,

    # 0136 LATIN CAPITAL LETTER K WITH CEDILLA
    # ->   004B LATIN CAPITAL LETTER K
    "\u{0136}".freeze => 'K'.freeze,

    # 0137 LATIN SMALL LETTER K WITH CEDILLA
    # ->   006B LATIN SMALL LETTER K
    "\u{0137}".freeze => 'k'.freeze,

    # 0139 LATIN CAPITAL LETTER L WITH ACUTE
    # ->   004C LATIN CAPITAL LETTER L
    "\u{0139}".freeze => 'L'.freeze,

    # 013A LATIN SMALL LETTER L WITH ACUTE
    # ->   006C LATIN SMALL LETTER L
    "\u{013A}".freeze => 'l'.freeze,

    # 013B LATIN CAPITAL LETTER L WITH CEDILLA
    # ->   004C LATIN CAPITAL LETTER L
    "\u{013B}".freeze => 'L'.freeze,

    # 013C LATIN SMALL LETTER L WITH CEDILLA
    # ->   006C LATIN SMALL LETTER L
    "\u{013C}".freeze => 'l'.freeze,

    # 013D LATIN CAPITAL LETTER L WITH CARON
    # ->   004C LATIN CAPITAL LETTER L
    "\u{013D}".freeze => 'L'.freeze,

    # 013E LATIN SMALL LETTER L WITH CARON
    # ->   006C LATIN SMALL LETTER L
    "\u{013E}".freeze => 'l'.freeze,

    # 013F LATIN CAPITAL LETTER L WITH MIDDLE DOT
    # ->   004C LATIN CAPITAL LETTER L
    #    + 00B7 MIDDLE DOT
    "\u{013F}".freeze => "L\u{B7}".freeze,

    # 0140 LATIN SMALL LETTER L WITH MIDDLE DOT
    # ->   006C LATIN SMALL LETTER L
    #    + 00B7 MIDDLE DOT
    "\u{0140}".freeze => "l\u{B7}".freeze,

    # 0141 LATIN CAPITAL LETTER L WITH STROKE
    # ->   004C LATIN CAPITAL LETTER L
    "\u{0141}".freeze => 'L'.freeze,

    # 0142 LATIN SMALL LETTER L WITH STROKE
    # ->   006C LATIN SMALL LETTER L
    "\u{0142}".freeze => 'l'.freeze,

    # 0143 LATIN CAPITAL LETTER N WITH ACUTE
    # ->   004E LATIN CAPITAL LETTER N
    "\u{0143}".freeze => 'N'.freeze,

    # 0144 LATIN SMALL LETTER N WITH ACUTE
    # ->   006E LATIN SMALL LETTER N
    "\u{0144}".freeze => 'n'.freeze,

    # 0145 LATIN CAPITAL LETTER N WITH CEDILLA
    # ->   004E LATIN CAPITAL LETTER N
    "\u{0145}".freeze => 'N'.freeze,

    # 0146 LATIN SMALL LETTER N WITH CEDILLA
    # ->   006E LATIN SMALL LETTER N
    "\u{0146}".freeze => 'n'.freeze,

    # 0147 LATIN CAPITAL LETTER N WITH CARON
    # ->   004E LATIN CAPITAL LETTER N
    "\u{0147}".freeze => 'N'.freeze,

    # 0148 LATIN SMALL LETTER N WITH CARON
    # ->   006E LATIN SMALL LETTER N
    "\u{0148}".freeze => 'n'.freeze,

    # 0149 LATIN SMALL LETTER N PRECEDED BY APOSTROPHE
    # ->   02BC MODIFIER LETTER APOSTROPHE
    #    + 006E LATIN SMALL LETTER N
    "\u{0149}".freeze => "\u{02BC}n".freeze,

    # 014C LATIN CAPITAL LETTER O WITH MACRON
    # ->   004F LATIN CAPITAL LETTER O
    "\u{014C}".freeze => 'O'.freeze,

    # 014D LATIN SMALL LETTER O WITH MACRON
    # ->   006F LATIN SMALL LETTER O
    "\u{014D}".freeze => 'o'.freeze,

    # 014E LATIN CAPITAL LETTER O WITH BREVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{014E}".freeze => 'O'.freeze,

    # 014F LATIN SMALL LETTER O WITH BREVE
    # ->   006F LATIN SMALL LETTER O
    "\u{014F}".freeze => 'o'.freeze,

    # 0150 LATIN CAPITAL LETTER O WITH DOUBLE ACUTE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{0150}".freeze => 'O'.freeze,

    # 0151 LATIN SMALL LETTER O WITH DOUBLE ACUTE
    # ->   006F LATIN SMALL LETTER O
    "\u{0151}".freeze => 'o'.freeze,

    # 0154 LATIN CAPITAL LETTER R WITH ACUTE
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{0154}".freeze => 'R'.freeze,

    # 0155 LATIN SMALL LETTER R WITH ACUTE
    # ->   0072 LATIN SMALL LETTER R
    "\u{0155}".freeze => 'r'.freeze,

    # 0156 LATIN CAPITAL LETTER R WITH CEDILLA
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{0156}".freeze => 'R'.freeze,

    # 0157 LATIN SMALL LETTER R WITH CEDILLA
    # ->   0072 LATIN SMALL LETTER R
    "\u{0157}".freeze => 'r'.freeze,

    # 0158 LATIN CAPITAL LETTER R WITH CARON
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{0158}".freeze => 'R'.freeze,

    # 0159 LATIN SMALL LETTER R WITH CARON
    # ->   0072 LATIN SMALL LETTER R
    "\u{0159}".freeze => 'r'.freeze,

    # 015A LATIN CAPITAL LETTER S WITH ACUTE
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{015A}".freeze => 'S'.freeze,

    # 015B LATIN SMALL LETTER S WITH ACUTE
    # ->   0073 LATIN SMALL LETTER S
    "\u{015B}".freeze => 's'.freeze,

    # 015C LATIN CAPITAL LETTER S WITH CIRCUMFLEX
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{015C}".freeze => 'S'.freeze,

    # 015D LATIN SMALL LETTER S WITH CIRCUMFLEX
    # ->   0073 LATIN SMALL LETTER S
    "\u{015D}".freeze => 's'.freeze,

    # 015E LATIN CAPITAL LETTER S WITH CEDILLA
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{015E}".freeze => 'S'.freeze,

    # 015F LATIN SMALL LETTER S WITH CEDILLA
    # ->   0073 LATIN SMALL LETTER S
    "\u{015F}".freeze => 's'.freeze,

    # 0160 LATIN CAPITAL LETTER S WITH CARON
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{0160}".freeze => 'S'.freeze,

    # 0161 LATIN SMALL LETTER S WITH CARON
    # ->   0073 LATIN SMALL LETTER S
    "\u{0161}".freeze => 's'.freeze,

    # 0162 LATIN CAPITAL LETTER T WITH CEDILLA
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{0162}".freeze => 'T'.freeze,

    # 0163 LATIN SMALL LETTER T WITH CEDILLA
    # ->   0074 LATIN SMALL LETTER T
    "\u{0163}".freeze => 't'.freeze,

    # 0164 LATIN CAPITAL LETTER T WITH CARON
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{0164}".freeze => 'T'.freeze,

    # 0165 LATIN SMALL LETTER T WITH CARON
    # ->   0074 LATIN SMALL LETTER T
    "\u{0165}".freeze => 't'.freeze,

    # 0166 LATIN CAPITAL LETTER T WITH STROKE
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{0166}".freeze => 'T'.freeze,

    # 0167 LATIN SMALL LETTER T WITH STROKE
    # ->   0074 LATIN SMALL LETTER T
    "\u{0167}".freeze => 't'.freeze,

    # 0168 LATIN CAPITAL LETTER U WITH TILDE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{0168}".freeze => 'U'.freeze,

    # 0169 LATIN SMALL LETTER U WITH TILDE
    # ->   0075 LATIN SMALL LETTER U
    "\u{0169}".freeze => 'u'.freeze,

    # 016A LATIN CAPITAL LETTER U WITH MACRON
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{016A}".freeze => 'U'.freeze,

    # 016B LATIN SMALL LETTER U WITH MACRON
    # ->   0075 LATIN SMALL LETTER U
    "\u{016B}".freeze => 'u'.freeze,

    # 016C LATIN CAPITAL LETTER U WITH BREVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{016C}".freeze => 'U'.freeze,

    # 016D LATIN SMALL LETTER U WITH BREVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{016D}".freeze => 'u'.freeze,

    # 016E LATIN CAPITAL LETTER U WITH RING ABOVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{016E}".freeze => 'U'.freeze,

    # 016F LATIN SMALL LETTER U WITH RING ABOVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{016F}".freeze => 'u'.freeze,

    # 0170 LATIN CAPITAL LETTER U WITH DOUBLE ACUTE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{0170}".freeze => 'U'.freeze,

    # 0171 LATIN SMALL LETTER U WITH DOUBLE ACUTE
    # ->   0075 LATIN SMALL LETTER U
    "\u{0171}".freeze => 'u'.freeze,

    # 0172 LATIN CAPITAL LETTER U WITH OGONEK
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{0172}".freeze => 'U'.freeze,

    # 0173 LATIN SMALL LETTER U WITH OGONEK
    # ->   0075 LATIN SMALL LETTER U
    "\u{0173}".freeze => 'u'.freeze,

    # 0174 LATIN CAPITAL LETTER W WITH CIRCUMFLEX
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{0174}".freeze => 'W'.freeze,

    # 0175 LATIN SMALL LETTER W WITH CIRCUMFLEX
    # ->   0077 LATIN SMALL LETTER W
    "\u{0175}".freeze => 'w'.freeze,

    # 0176 LATIN CAPITAL LETTER Y WITH CIRCUMFLEX
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{0176}".freeze => 'Y'.freeze,

    # 0177 LATIN SMALL LETTER Y WITH CIRCUMFLEX
    # ->   0079 LATIN SMALL LETTER Y
    "\u{0177}".freeze => 'y'.freeze,

    # 0178 LATIN CAPITAL LETTER Y WITH DIAERESIS
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{0178}".freeze => 'Y'.freeze,

    # 0179 LATIN CAPITAL LETTER Z WITH ACUTE
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{0179}".freeze => 'Z'.freeze,

    # 017A LATIN SMALL LETTER Z WITH ACUTE
    # ->   007A LATIN SMALL LETTER Z
    "\u{017A}".freeze => 'z'.freeze,

    # 017B LATIN CAPITAL LETTER Z WITH DOT ABOVE
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{017B}".freeze => 'Z'.freeze,

    # 017C LATIN SMALL LETTER Z WITH DOT ABOVE
    # ->   007A LATIN SMALL LETTER Z
    "\u{017C}".freeze => 'z'.freeze,

    # 017D LATIN CAPITAL LETTER Z WITH CARON
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{017D}".freeze => 'Z'.freeze,

    # 017E LATIN SMALL LETTER Z WITH CARON
    # ->   007A LATIN SMALL LETTER Z
    "\u{017E}".freeze => 'z'.freeze,

    # 017F LATIN SMALL LETTER LONG S
    # ->   0073 LATIN SMALL LETTER S
    "\u{017F}".freeze => 's'.freeze,

    # 0180 LATIN SMALL LETTER B WITH STROKE
    # ->   0062 LATIN SMALL LETTER B
    "\u{0180}".freeze => 'b'.freeze,

    # 0181 LATIN CAPITAL LETTER B WITH HOOK
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{0181}".freeze => 'B'.freeze,

    # 0182 LATIN CAPITAL LETTER B WITH TOPBAR
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{0182}".freeze => 'B'.freeze,

    # 0183 LATIN SMALL LETTER B WITH TOPBAR
    # ->   0062 LATIN SMALL LETTER B
    "\u{0183}".freeze => 'b'.freeze,

    # 0187 LATIN CAPITAL LETTER C WITH HOOK
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{0187}".freeze => 'C'.freeze,

    # 0188 LATIN SMALL LETTER C WITH HOOK
    # ->   0063 LATIN SMALL LETTER C
    "\u{0188}".freeze => 'c'.freeze,

    # 018A LATIN CAPITAL LETTER D WITH HOOK
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{018A}".freeze => 'D'.freeze,

    # 018B LATIN CAPITAL LETTER D WITH TOPBAR
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{018B}".freeze => 'D'.freeze,

    # 018C LATIN SMALL LETTER D WITH TOPBAR
    # ->   0064 LATIN SMALL LETTER D
    "\u{018C}".freeze => 'd'.freeze,

    # 0191 LATIN CAPITAL LETTER F WITH HOOK
    # ->   0046 LATIN CAPITAL LETTER F
    "\u{0191}".freeze => 'F'.freeze,

    # 0192 LATIN SMALL LETTER F WITH HOOK
    # ->   0066 LATIN SMALL LETTER F
    "\u{0192}".freeze => 'f'.freeze,

    # 0193 LATIN CAPITAL LETTER G WITH HOOK
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{0193}".freeze => 'G'.freeze,

    # 0197 LATIN CAPITAL LETTER I WITH STROKE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{0197}".freeze => 'I'.freeze,

    # 0198 LATIN CAPITAL LETTER K WITH HOOK
    # ->   004B LATIN CAPITAL LETTER K
    "\u{0198}".freeze => 'K'.freeze,

    # 0199 LATIN SMALL LETTER K WITH HOOK
    # ->   006B LATIN SMALL LETTER K
    "\u{0199}".freeze => 'k'.freeze,

    # 019A LATIN SMALL LETTER L WITH BAR
    # ->   006C LATIN SMALL LETTER L
    "\u{019A}".freeze => 'l'.freeze,

    # 019D LATIN CAPITAL LETTER N WITH LEFT HOOK
    # ->   004E LATIN CAPITAL LETTER N
    "\u{019D}".freeze => 'N'.freeze,

    # 019E LATIN SMALL LETTER N WITH LONG RIGHT LEG
    # ->   006E LATIN SMALL LETTER N
    "\u{019E}".freeze => 'n'.freeze,

    # 019F LATIN CAPITAL LETTER O WITH MIDDLE TILDE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{019F}".freeze => 'O'.freeze,

    # 01A0 LATIN CAPITAL LETTER O WITH HORN
    # ->   004F LATIN CAPITAL LETTER O
    "\u{01A0}".freeze => 'O'.freeze,

    # 01A1 LATIN SMALL LETTER O WITH HORN
    # ->   006F LATIN SMALL LETTER O
    "\u{01A1}".freeze => 'o'.freeze,

    # 01A4 LATIN CAPITAL LETTER P WITH HOOK
    # ->   0050 LATIN CAPITAL LETTER P
    "\u{01A4}".freeze => 'P'.freeze,

    # 01A5 LATIN SMALL LETTER P WITH HOOK
    # ->   0070 LATIN SMALL LETTER P
    "\u{01A5}".freeze => 'p'.freeze,

    # 01AB LATIN SMALL LETTER T WITH PALATAL HOOK
    # ->   0074 LATIN SMALL LETTER T
    "\u{01AB}".freeze => 't'.freeze,

    # 01AC LATIN CAPITAL LETTER T WITH HOOK
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{01AC}".freeze => 'T'.freeze,

    # 01AD LATIN SMALL LETTER T WITH HOOK
    # ->   0074 LATIN SMALL LETTER T
    "\u{01AD}".freeze => 't'.freeze,

    # 01AE LATIN CAPITAL LETTER T WITH RETROFLEX HOOK
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{01AE}".freeze => 'T'.freeze,

    # 01AF LATIN CAPITAL LETTER U WITH HORN
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{01AF}".freeze => 'U'.freeze,

    # 01B0 LATIN SMALL LETTER U WITH HORN
    # ->   0075 LATIN SMALL LETTER U
    "\u{01B0}".freeze => 'u'.freeze,

    # 01B2 LATIN CAPITAL LETTER V WITH HOOK
    # ->   0056 LATIN CAPITAL LETTER V
    "\u{01B2}".freeze => 'V'.freeze,

    # 01B3 LATIN CAPITAL LETTER Y WITH HOOK
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{01B3}".freeze => 'Y'.freeze,

    # 01B4 LATIN SMALL LETTER Y WITH HOOK
    # ->   0079 LATIN SMALL LETTER Y
    "\u{01B4}".freeze => 'y'.freeze,

    # 01B5 LATIN CAPITAL LETTER Z WITH STROKE
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{01B5}".freeze => 'Z'.freeze,

    # 01B6 LATIN SMALL LETTER Z WITH STROKE
    # ->   007A LATIN SMALL LETTER Z
    "\u{01B6}".freeze => 'z'.freeze,

    # 01BA LATIN SMALL LETTER EZH WITH TAIL
    # ->   0292 LATIN SMALL LETTER EZH
    "\u{01BA}".freeze => "\u{0292}".freeze,

    # 01BE LATIN LETTER INVERTED GLOTTAL STOP WITH STROKE
    # ->   0296 LATIN LETTER INVERTED GLOTTAL STOP
    "\u{01BE}".freeze => "\u{0296}".freeze,

    # 01C4 LATIN CAPITAL LETTER DZ WITH CARON
    # ->   0044 LATIN CAPITAL LETTER D
    #    + 005A LATIN CAPITAL LETTER Z
    "\u{01C4}".freeze => 'DZ'.freeze,

    # 01C5 LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON
    # ->   0044 LATIN CAPITAL LETTER D
    #    + 007A LATIN SMALL LETTER Z
    "\u{01C5}".freeze => 'Dz'.freeze,

    # 01C6 LATIN SMALL LETTER DZ WITH CARON
    # ->   0064 LATIN SMALL LETTER D
    #    + 007A LATIN SMALL LETTER Z
    "\u{01C6}".freeze => 'dz'.freeze,

    # 01C7 LATIN CAPITAL LETTER LJ
    # ->   004C LATIN CAPITAL LETTER L
    #    + 004A LATIN CAPITAL LETTER J
    "\u{01C7}".freeze => 'LJ'.freeze,

    # 01C8 LATIN CAPITAL LETTER L WITH SMALL LETTER J
    # ->   004C LATIN CAPITAL LETTER L
    #    + 006A LATIN SMALL LETTER J
    "\u{01C8}".freeze => 'Lj'.freeze,

    # 01C9 LATIN SMALL LETTER LJ
    # ->   006C LATIN SMALL LETTER L
    #    + 006A LATIN SMALL LETTER J
    "\u{01C9}".freeze => 'lj'.freeze,

    # 01CA LATIN CAPITAL LETTER NJ
    # ->   004E LATIN CAPITAL LETTER N
    #    + 004A LATIN CAPITAL LETTER J
    "\u{01CA}".freeze => 'NJ'.freeze,

    # 01CB LATIN CAPITAL LETTER N WITH SMALL LETTER J
    # ->   004E LATIN CAPITAL LETTER N
    #    + 006A LATIN SMALL LETTER J
    "\u{01CB}".freeze => 'Nj'.freeze,

    # 01CC LATIN SMALL LETTER NJ
    # ->   006E LATIN SMALL LETTER N
    #    + 006A LATIN SMALL LETTER J
    "\u{01CC}".freeze => 'nj'.freeze,

    # 01CD LATIN CAPITAL LETTER A WITH CARON
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{01CD}".freeze => 'A'.freeze,

    # 01CE LATIN SMALL LETTER A WITH CARON
    # ->   0061 LATIN SMALL LETTER A
    "\u{01CE}".freeze => 'a'.freeze,

    # 01CF LATIN CAPITAL LETTER I WITH CARON
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{01CF}".freeze => 'I'.freeze,

    # 01D0 LATIN SMALL LETTER I WITH CARON
    # ->   0069 LATIN SMALL LETTER I
    "\u{01D0}".freeze => 'i'.freeze,

    # 01D1 LATIN CAPITAL LETTER O WITH CARON
    # ->   004F LATIN CAPITAL LETTER O
    "\u{01D1}".freeze => 'O'.freeze,

    # 01D2 LATIN SMALL LETTER O WITH CARON
    # ->   006F LATIN SMALL LETTER O
    "\u{01D2}".freeze => 'o'.freeze,

    # 01D3 LATIN CAPITAL LETTER U WITH CARON
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{01D3}".freeze => 'U'.freeze,

    # 01D4 LATIN SMALL LETTER U WITH CARON
    # ->   0075 LATIN SMALL LETTER U
    "\u{01D4}".freeze => 'u'.freeze,

    # 01D5 LATIN CAPITAL LETTER U WITH DIAERESIS AND MACRON
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{01D5}".freeze => 'U'.freeze,

    # 01D6 LATIN SMALL LETTER U WITH DIAERESIS AND MACRON
    # ->   0075 LATIN SMALL LETTER U
    "\u{01D6}".freeze => 'u'.freeze,

    # 01D7 LATIN CAPITAL LETTER U WITH DIAERESIS AND ACUTE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{01D7}".freeze => 'U'.freeze,

    # 01D8 LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE
    # ->   0075 LATIN SMALL LETTER U
    "\u{01D8}".freeze => 'u'.freeze,

    # 01D9 LATIN CAPITAL LETTER U WITH DIAERESIS AND CARON
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{01D9}".freeze => 'U'.freeze,

    # 01DA LATIN SMALL LETTER U WITH DIAERESIS AND CARON
    # ->   0075 LATIN SMALL LETTER U
    "\u{01DA}".freeze => 'u'.freeze,

    # 01DB LATIN CAPITAL LETTER U WITH DIAERESIS AND GRAVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{01DB}".freeze => 'U'.freeze,

    # 01DC LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{01DC}".freeze => 'u'.freeze,

    # 01DE LATIN CAPITAL LETTER A WITH DIAERESIS AND MACRON
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{01DE}".freeze => 'A'.freeze,

    # 01DF LATIN SMALL LETTER A WITH DIAERESIS AND MACRON
    # ->   0061 LATIN SMALL LETTER A
    "\u{01DF}".freeze => 'a'.freeze,

    # 01E0 LATIN CAPITAL LETTER A WITH DOT ABOVE AND MACRON
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{01E0}".freeze => 'A'.freeze,

    # 01E1 LATIN SMALL LETTER A WITH DOT ABOVE AND MACRON
    # ->   0061 LATIN SMALL LETTER A
    "\u{01E1}".freeze => 'a'.freeze,

    # 01E2 LATIN CAPITAL LETTER AE WITH MACRON
    # ->   0041 LATIN CAPITAL LETTER A
    #    + 0045 LATIN CAPITAL LETTER E
    "\u{01E2}".freeze => 'AE'.freeze,

    # 01E3 LATIN SMALL LETTER AE WITH MACRON
    # ->   0061 LATIN SMALL LETTER A
    #    + 0065 LATIN SMALL LETTER E
    "\u{01E3}".freeze => 'ae'.freeze,

    # 01E4 LATIN CAPITAL LETTER G WITH STROKE
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{01E4}".freeze => 'G'.freeze,

    # 01E5 LATIN SMALL LETTER G WITH STROKE
    # ->   0067 LATIN SMALL LETTER G
    "\u{01E5}".freeze => 'g'.freeze,

    # 01E6 LATIN CAPITAL LETTER G WITH CARON
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{01E6}".freeze => 'G'.freeze,

    # 01E7 LATIN SMALL LETTER G WITH CARON
    # ->   0067 LATIN SMALL LETTER G
    "\u{01E7}".freeze => 'g'.freeze,

    # 01E8 LATIN CAPITAL LETTER K WITH CARON
    # ->   004B LATIN CAPITAL LETTER K
    "\u{01E8}".freeze => 'K'.freeze,

    # 01E9 LATIN SMALL LETTER K WITH CARON
    # ->   006B LATIN SMALL LETTER K
    "\u{01E9}".freeze => 'k'.freeze,

    # 01EA LATIN CAPITAL LETTER O WITH OGONEK
    # ->   004F LATIN CAPITAL LETTER O
    "\u{01EA}".freeze => 'O'.freeze,

    # 01EB LATIN SMALL LETTER O WITH OGONEK
    # ->   006F LATIN SMALL LETTER O
    "\u{01EB}".freeze => 'o'.freeze,

    # 01EC LATIN CAPITAL LETTER O WITH OGONEK AND MACRON
    # ->   004F LATIN CAPITAL LETTER O
    "\u{01EC}".freeze => 'O'.freeze,

    # 01ED LATIN SMALL LETTER O WITH OGONEK AND MACRON
    # ->   006F LATIN SMALL LETTER O
    "\u{01ED}".freeze => 'o'.freeze,

    # 01EE LATIN CAPITAL LETTER EZH WITH CARON
    # ->   01B7 LATIN CAPITAL LETTER EZH
    "\u{01EE}".freeze => "\u{01B7}".freeze,

    # 01EF LATIN SMALL LETTER EZH WITH CARON
    # ->   0292 LATIN SMALL LETTER EZH
    "\u{01EF}".freeze => "\u{0292}".freeze,

    # 01F0 LATIN SMALL LETTER J WITH CARON
    # ->   006A LATIN SMALL LETTER J
    "\u{01F0}".freeze => 'j'.freeze,

    # 01F1 LATIN CAPITAL LETTER DZ
    # ->   0044 LATIN CAPITAL LETTER D
    #    + 005A LATIN CAPITAL LETTER Z
    "\u{01F1}".freeze => 'DZ'.freeze,

    # 01F2 LATIN CAPITAL LETTER D WITH SMALL LETTER Z
    # ->   0044 LATIN CAPITAL LETTER D
    #    + 007A LATIN SMALL LETTER Z
    "\u{01F2}".freeze => 'Dz'.freeze,

    # 01F3 LATIN SMALL LETTER DZ
    # ->   0064 LATIN SMALL LETTER D
    #    + 007A LATIN SMALL LETTER Z
    "\u{01F3}".freeze => 'dz'.freeze,

    # 01F4 LATIN CAPITAL LETTER G WITH ACUTE
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{01F4}".freeze => 'G'.freeze,

    # 01F5 LATIN SMALL LETTER G WITH ACUTE
    # ->   0067 LATIN SMALL LETTER G
    "\u{01F5}".freeze => 'g'.freeze,

    # 01F8 LATIN CAPITAL LETTER N WITH GRAVE
    # ->   004E LATIN CAPITAL LETTER N
    "\u{01F8}".freeze => 'N'.freeze,

    # 01F9 LATIN SMALL LETTER N WITH GRAVE
    # ->   006E LATIN SMALL LETTER N
    "\u{01F9}".freeze => 'n'.freeze,

    # 01FA LATIN CAPITAL LETTER A WITH RING ABOVE AND ACUTE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{01FA}".freeze => 'A'.freeze,

    # 01FB LATIN SMALL LETTER A WITH RING ABOVE AND ACUTE
    # ->   0061 LATIN SMALL LETTER A
    "\u{01FB}".freeze => 'a'.freeze,

    # 01FC LATIN CAPITAL LETTER AE WITH ACUTE
    # ->   0041 LATIN CAPITAL LETTER A
    #    + 0045 LATIN CAPITAL LETTER E
    "\u{01FC}".freeze => 'AE'.freeze,

    # 01FD LATIN SMALL LETTER AE WITH ACUTE
    # ->   0061 LATIN SMALL LETTER A
    #    + 0065 LATIN SMALL LETTER E
    "\u{01FD}".freeze => 'ae'.freeze,

    # 01FE LATIN CAPITAL LETTER O WITH STROKE AND ACUTE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{01FE}".freeze => 'O'.freeze,

    # 01FF LATIN SMALL LETTER O WITH STROKE AND ACUTE
    # ->   006F LATIN SMALL LETTER O
    "\u{01FF}".freeze => 'o'.freeze,

    # 0200 LATIN CAPITAL LETTER A WITH DOUBLE GRAVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{0200}".freeze => 'A'.freeze,

    # 0201 LATIN SMALL LETTER A WITH DOUBLE GRAVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{0201}".freeze => 'a'.freeze,

    # 0202 LATIN CAPITAL LETTER A WITH INVERTED BREVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{0202}".freeze => 'A'.freeze,

    # 0203 LATIN SMALL LETTER A WITH INVERTED BREVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{0203}".freeze => 'a'.freeze,

    # 0204 LATIN CAPITAL LETTER E WITH DOUBLE GRAVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{0204}".freeze => 'E'.freeze,

    # 0205 LATIN SMALL LETTER E WITH DOUBLE GRAVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{0205}".freeze => 'e'.freeze,

    # 0206 LATIN CAPITAL LETTER E WITH INVERTED BREVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{0206}".freeze => 'E'.freeze,

    # 0207 LATIN SMALL LETTER E WITH INVERTED BREVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{0207}".freeze => 'e'.freeze,

    # 0208 LATIN CAPITAL LETTER I WITH DOUBLE GRAVE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{0208}".freeze => 'I'.freeze,

    # 0209 LATIN SMALL LETTER I WITH DOUBLE GRAVE
    # ->   0069 LATIN SMALL LETTER I
    "\u{0209}".freeze => 'i'.freeze,

    # 020A LATIN CAPITAL LETTER I WITH INVERTED BREVE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{020A}".freeze => 'I'.freeze,

    # 020B LATIN SMALL LETTER I WITH INVERTED BREVE
    # ->   0069 LATIN SMALL LETTER I
    "\u{020B}".freeze => 'i'.freeze,

    # 020C LATIN CAPITAL LETTER O WITH DOUBLE GRAVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{020C}".freeze => 'O'.freeze,

    # 020D LATIN SMALL LETTER O WITH DOUBLE GRAVE
    # ->   006F LATIN SMALL LETTER O
    "\u{020D}".freeze => 'o'.freeze,

    # 020E LATIN CAPITAL LETTER O WITH INVERTED BREVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{020E}".freeze => 'O'.freeze,

    # 020F LATIN SMALL LETTER O WITH INVERTED BREVE
    # ->   006F LATIN SMALL LETTER O
    "\u{020F}".freeze => 'o'.freeze,

    # 0210 LATIN CAPITAL LETTER R WITH DOUBLE GRAVE
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{0210}".freeze => 'R'.freeze,

    # 0211 LATIN SMALL LETTER R WITH DOUBLE GRAVE
    # ->   0072 LATIN SMALL LETTER R
    "\u{0211}".freeze => 'r'.freeze,

    # 0212 LATIN CAPITAL LETTER R WITH INVERTED BREVE
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{0212}".freeze => 'R'.freeze,

    # 0213 LATIN SMALL LETTER R WITH INVERTED BREVE
    # ->   0072 LATIN SMALL LETTER R
    "\u{0213}".freeze => 'r'.freeze,

    # 0214 LATIN CAPITAL LETTER U WITH DOUBLE GRAVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{0214}".freeze => 'U'.freeze,

    # 0215 LATIN SMALL LETTER U WITH DOUBLE GRAVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{0215}".freeze => 'u'.freeze,

    # 0216 LATIN CAPITAL LETTER U WITH INVERTED BREVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{0216}".freeze => 'U'.freeze,

    # 0217 LATIN SMALL LETTER U WITH INVERTED BREVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{0217}".freeze => 'u'.freeze,

    # 0218 LATIN CAPITAL LETTER S WITH COMMA BELOW
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{0218}".freeze => 'S'.freeze,

    # 0219 LATIN SMALL LETTER S WITH COMMA BELOW
    # ->   0073 LATIN SMALL LETTER S
    "\u{0219}".freeze => 's'.freeze,

    # 021A LATIN CAPITAL LETTER T WITH COMMA BELOW
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{021A}".freeze => 'T'.freeze,

    # 021B LATIN SMALL LETTER T WITH COMMA BELOW
    # ->   0074 LATIN SMALL LETTER T
    "\u{021B}".freeze => 't'.freeze,

    # 021E LATIN CAPITAL LETTER H WITH CARON
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{021E}".freeze => 'H'.freeze,

    # 021F LATIN SMALL LETTER H WITH CARON
    # ->   0068 LATIN SMALL LETTER H
    "\u{021F}".freeze => 'h'.freeze,

    # 0220 LATIN CAPITAL LETTER N WITH LONG RIGHT LEG
    # ->   004E LATIN CAPITAL LETTER N
    "\u{0220}".freeze => 'N'.freeze,

    # 0221 LATIN SMALL LETTER D WITH CURL
    # ->   0064 LATIN SMALL LETTER D
    "\u{0221}".freeze => 'd'.freeze,

    # 0224 LATIN CAPITAL LETTER Z WITH HOOK
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{0224}".freeze => 'Z'.freeze,

    # 0225 LATIN SMALL LETTER Z WITH HOOK
    # ->   007A LATIN SMALL LETTER Z
    "\u{0225}".freeze => 'z'.freeze,

    # 0226 LATIN CAPITAL LETTER A WITH DOT ABOVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{0226}".freeze => 'A'.freeze,

    # 0227 LATIN SMALL LETTER A WITH DOT ABOVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{0227}".freeze => 'a'.freeze,

    # 0228 LATIN CAPITAL LETTER E WITH CEDILLA
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{0228}".freeze => 'E'.freeze,

    # 0229 LATIN SMALL LETTER E WITH CEDILLA
    # ->   0065 LATIN SMALL LETTER E
    "\u{0229}".freeze => 'e'.freeze,

    # 022A LATIN CAPITAL LETTER O WITH DIAERESIS AND MACRON
    # ->   004F LATIN CAPITAL LETTER O
    "\u{022A}".freeze => 'O'.freeze,

    # 022B LATIN SMALL LETTER O WITH DIAERESIS AND MACRON
    # ->   006F LATIN SMALL LETTER O
    "\u{022B}".freeze => 'o'.freeze,

    # 022C LATIN CAPITAL LETTER O WITH TILDE AND MACRON
    # ->   004F LATIN CAPITAL LETTER O
    "\u{022C}".freeze => 'O'.freeze,

    # 022D LATIN SMALL LETTER O WITH TILDE AND MACRON
    # ->   006F LATIN SMALL LETTER O
    "\u{022D}".freeze => 'o'.freeze,

    # 022E LATIN CAPITAL LETTER O WITH DOT ABOVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{022E}".freeze => 'O'.freeze,

    # 022F LATIN SMALL LETTER O WITH DOT ABOVE
    # ->   006F LATIN SMALL LETTER O
    "\u{022F}".freeze => 'o'.freeze,

    # 0230 LATIN CAPITAL LETTER O WITH DOT ABOVE AND MACRON
    # ->   004F LATIN CAPITAL LETTER O
    "\u{0230}".freeze => 'O'.freeze,

    # 0231 LATIN SMALL LETTER O WITH DOT ABOVE AND MACRON
    # ->   006F LATIN SMALL LETTER O
    "\u{0231}".freeze => 'o'.freeze,

    # 0232 LATIN CAPITAL LETTER Y WITH MACRON
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{0232}".freeze => 'Y'.freeze,

    # 0233 LATIN SMALL LETTER Y WITH MACRON
    # ->   0079 LATIN SMALL LETTER Y
    "\u{0233}".freeze => 'y'.freeze,

    # 0234 LATIN SMALL LETTER L WITH CURL
    # ->   006C LATIN SMALL LETTER L
    "\u{0234}".freeze => 'l'.freeze,

    # 0235 LATIN SMALL LETTER N WITH CURL
    # ->   006E LATIN SMALL LETTER N
    "\u{0235}".freeze => 'n'.freeze,

    # 0236 LATIN SMALL LETTER T WITH CURL
    # ->   0074 LATIN SMALL LETTER T
    "\u{0236}".freeze => 't'.freeze,

    # 0253 LATIN SMALL LETTER B WITH HOOK
    # ->   0062 LATIN SMALL LETTER B
    "\u{0253}".freeze => 'b'.freeze,

    # 0255 LATIN SMALL LETTER C WITH CURL
    # ->   0063 LATIN SMALL LETTER C
    "\u{0255}".freeze => 'c'.freeze,

    # 0256 LATIN SMALL LETTER D WITH TAIL
    # ->   0064 LATIN SMALL LETTER D
    "\u{0256}".freeze => 'd'.freeze,

    # 0257 LATIN SMALL LETTER D WITH HOOK
    # ->   0064 LATIN SMALL LETTER D
    "\u{0257}".freeze => 'd'.freeze,

    # 025A LATIN SMALL LETTER SCHWA WITH HOOK
    # ->   0259 LATIN SMALL LETTER SCHWA
    "\u{025A}".freeze => "\u{0259}".freeze,

    # 025D LATIN SMALL LETTER REVERSED OPEN E WITH HOOK
    # ->   025C LATIN SMALL LETTER REVERSED OPEN E
    "\u{025D}".freeze => "\u{025C}".freeze,

    # 0260 LATIN SMALL LETTER G WITH HOOK
    # ->   0067 LATIN SMALL LETTER G
    "\u{0260}".freeze => 'g'.freeze,

    # 0266 LATIN SMALL LETTER H WITH HOOK
    # ->   0068 LATIN SMALL LETTER H
    "\u{0266}".freeze => 'h'.freeze,

    # 0268 LATIN SMALL LETTER I WITH STROKE
    # ->   0069 LATIN SMALL LETTER I
    "\u{0268}".freeze => 'i'.freeze,

    # 026B LATIN SMALL LETTER L WITH MIDDLE TILDE
    # ->   006C LATIN SMALL LETTER L
    "\u{026B}".freeze => 'l'.freeze,

    # 026C LATIN SMALL LETTER L WITH BELT
    # ->   006C LATIN SMALL LETTER L
    "\u{026C}".freeze => 'l'.freeze,

    # 026D LATIN SMALL LETTER L WITH RETROFLEX HOOK
    # ->   006C LATIN SMALL LETTER L
    "\u{026D}".freeze => 'l'.freeze,

    # 0270 LATIN SMALL LETTER TURNED M WITH LONG LEG
    # ->   026F LATIN SMALL LETTER TURNED M
    "\u{0270}".freeze => "\u{026F}".freeze,

    # 0271 LATIN SMALL LETTER M WITH HOOK
    # ->   006D LATIN SMALL LETTER M
    "\u{0271}".freeze => 'm'.freeze,

    # 0272 LATIN SMALL LETTER N WITH LEFT HOOK
    # ->   006E LATIN SMALL LETTER N
    "\u{0272}".freeze => 'n'.freeze,

    # 0273 LATIN SMALL LETTER N WITH RETROFLEX HOOK
    # ->   006E LATIN SMALL LETTER N
    "\u{0273}".freeze => 'n'.freeze,

    # 027A LATIN SMALL LETTER TURNED R WITH LONG LEG
    # ->   0279 LATIN SMALL LETTER TURNED R
    "\u{027A}".freeze => "\u{0279}".freeze,

    # 027B LATIN SMALL LETTER TURNED R WITH HOOK
    # ->   0279 LATIN SMALL LETTER TURNED R
    "\u{027B}".freeze => "\u{0279}".freeze,

    # 027C LATIN SMALL LETTER R WITH LONG LEG
    # ->   0072 LATIN SMALL LETTER R
    "\u{027C}".freeze => 'r'.freeze,

    # 027D LATIN SMALL LETTER R WITH TAIL
    # ->   0072 LATIN SMALL LETTER R
    "\u{027D}".freeze => 'r'.freeze,

    # 027E LATIN SMALL LETTER R WITH FISHHOOK
    # ->   0072 LATIN SMALL LETTER R
    "\u{027E}".freeze => 'r'.freeze,

    # 0282 LATIN SMALL LETTER S WITH HOOK
    # ->   0073 LATIN SMALL LETTER S
    "\u{0282}".freeze => 's'.freeze,

    # 0286 LATIN SMALL LETTER ESH WITH CURL
    # ->   0283 LATIN SMALL LETTER ESH
    "\u{0286}".freeze => "\u{0283}".freeze,

    # 0288 LATIN SMALL LETTER T WITH RETROFLEX HOOK
    # ->   0074 LATIN SMALL LETTER T
    "\u{0288}".freeze => 't'.freeze,

    # 028B LATIN SMALL LETTER V WITH HOOK
    # ->   0076 LATIN SMALL LETTER V
    "\u{028B}".freeze => 'v'.freeze,

    # 0290 LATIN SMALL LETTER Z WITH RETROFLEX HOOK
    # ->   007A LATIN SMALL LETTER Z
    "\u{0290}".freeze => 'z'.freeze,

    # 0291 LATIN SMALL LETTER Z WITH CURL
    # ->   007A LATIN SMALL LETTER Z
    "\u{0291}".freeze => 'z'.freeze,

    # 0293 LATIN SMALL LETTER EZH WITH CURL
    # ->   0292 LATIN SMALL LETTER EZH
    "\u{0293}".freeze => "\u{0292}".freeze,

    # 029B LATIN LETTER SMALL CAPITAL G WITH HOOK
    # ->   0262 LATIN LETTER SMALL CAPITAL G
    "\u{029B}".freeze => "\u{0262}".freeze,

    # 029D LATIN SMALL LETTER J WITH CROSSED-TAIL
    # ->   006A LATIN SMALL LETTER J
    "\u{029D}".freeze => 'j'.freeze,

    # 02A0 LATIN SMALL LETTER Q WITH HOOK
    # ->   0071 LATIN SMALL LETTER Q
    "\u{02A0}".freeze => 'q'.freeze,

    # 02A1 LATIN LETTER GLOTTAL STOP WITH STROKE
    # ->   0294 LATIN LETTER GLOTTAL STOP
    "\u{02A1}".freeze => "\u{0294}".freeze,

    # 02A5 LATIN SMALL LETTER DZ DIGRAPH WITH CURL
    # ->   02A3 LATIN SMALL LETTER DZ DIGRAPH
    "\u{02A5}".freeze => "\u{02A3}".freeze,

    # 02AE LATIN SMALL LETTER TURNED H WITH FISHHOOK
    # ->   0265 LATIN SMALL LETTER TURNED H
    "\u{02AE}".freeze => "\u{0265}".freeze,

    # 02AF LATIN SMALL LETTER TURNED H WITH FISHHOOK AND TAIL
    # ->   0265 LATIN SMALL LETTER TURNED H
    "\u{02AF}".freeze => "\u{0265}".freeze,

    # 02B0 MODIFIER LETTER SMALL H
    # ->   0068 LATIN SMALL LETTER H
    "\u{02B0}".freeze => 'h'.freeze,

    # 02B1 MODIFIER LETTER SMALL H WITH HOOK
    # ->   0068 LATIN SMALL LETTER H
    "\u{02B1}".freeze => 'h'.freeze,

    # 02B2 MODIFIER LETTER SMALL J
    # ->   006A LATIN SMALL LETTER J
    "\u{02B2}".freeze => 'j'.freeze,

    # 02B3 MODIFIER LETTER SMALL R
    # ->   0072 LATIN SMALL LETTER R
    "\u{02B3}".freeze => 'r'.freeze,

    # 02B4 MODIFIER LETTER SMALL TURNED R
    # ->   0279 LATIN SMALL LETTER TURNED R
    "\u{02B4}".freeze => "\u{0279}".freeze,

    # 02B5 MODIFIER LETTER SMALL TURNED R WITH HOOK
    # ->   0279 LATIN SMALL LETTER TURNED R
    "\u{02B5}".freeze => "\u{0279}".freeze,

    # 02B6 MODIFIER LETTER SMALL CAPITAL INVERTED R
    # ->   0281 LATIN LETTER SMALL CAPITAL INVERTED R
    "\u{02B6}".freeze => "\u{0281}".freeze,

    # 02B7 MODIFIER LETTER SMALL W
    # ->   0077 LATIN SMALL LETTER W
    "\u{02B7}".freeze => 'w'.freeze,

    # 02B8 MODIFIER LETTER SMALL Y
    # ->   0079 LATIN SMALL LETTER Y
    "\u{02B8}".freeze => 'y'.freeze,

    # 02D8 BREVE
    # ->   0020 SPACE
    "\u{02D8}".freeze => ' '.freeze,

    # 02D9 DOT ABOVE
    # ->   0020 SPACE
    "\u{02D9}".freeze => ' '.freeze,

    # 02DA RING ABOVE
    # ->   0020 SPACE
    "\u{02DA}".freeze => ' '.freeze,

    # 02DB OGONEK
    # ->   0020 SPACE
    "\u{02DB}".freeze => ' '.freeze,

    # 02DC SMALL TILDE
    # ->   0020 SPACE
    "\u{02DC}".freeze => ' '.freeze,

    # 02DD DOUBLE ACUTE ACCENT
    # ->   0020 SPACE
    "\u{02DD}".freeze => ' '.freeze,

    # 02E0 MODIFIER LETTER SMALL GAMMA
    # ->   0263 LATIN SMALL LETTER GAMMA
    "\u{02E0}".freeze => "\u{0263}".freeze,

    # 02E1 MODIFIER LETTER SMALL L
    # ->   006C LATIN SMALL LETTER L
    "\u{02E1}".freeze => 'l'.freeze,

    # 02E2 MODIFIER LETTER SMALL S
    # ->   0073 LATIN SMALL LETTER S
    "\u{02E2}".freeze => 's'.freeze,

    # 02E3 MODIFIER LETTER SMALL X
    # ->   0078 LATIN SMALL LETTER X
    "\u{02E3}".freeze => 'x'.freeze,

    # 02E4 MODIFIER LETTER SMALL REVERSED GLOTTAL STOP
    # ->   0295 LATIN LETTER PHARYNGEAL VOICED FRICATIVE
    "\u{02E4}".freeze => "\u{0295}".freeze,

    # 0374 GREEK NUMERAL SIGN
    # ->   02B9 MODIFIER LETTER PRIME
    "\u{0374}".freeze => "\u{02B9}".freeze,

    # 037A GREEK YPOGEGRAMMENI
    # ->   0020 SPACE
    "\u{037A}".freeze => ' '.freeze,

    # 037E GREEK QUESTION MARK
    # ->   003B SEMICOLON
    "\u{037E}".freeze => ';'.freeze,

    # 0384 GREEK TONOS
    # ->   0020 SPACE
    "\u{0384}".freeze => ' '.freeze,

    # 0385 GREEK DIALYTIKA TONOS
    # ->   0020 SPACE
    "\u{0385}".freeze => ' '.freeze,

    # 0386 GREEK CAPITAL LETTER ALPHA WITH TONOS
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{0386}".freeze => "\u{0391}".freeze,

    # 0387 GREEK ANO TELEIA
    # ->   00B7 MIDDLE DOT
    "\u{0387}".freeze => "\u{B7}".freeze,

    # 0388 GREEK CAPITAL LETTER EPSILON WITH TONOS
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{0388}".freeze => "\u{0395}".freeze,

    # 0389 GREEK CAPITAL LETTER ETA WITH TONOS
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{0389}".freeze => "\u{0397}".freeze,

    # 038A GREEK CAPITAL LETTER IOTA WITH TONOS
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{038A}".freeze => "\u{0399}".freeze,

    # 038C GREEK CAPITAL LETTER OMICRON WITH TONOS
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{038C}".freeze => "\u{039F}".freeze,

    # 038E GREEK CAPITAL LETTER UPSILON WITH TONOS
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{038E}".freeze => "\u{03A5}".freeze,

    # 038F GREEK CAPITAL LETTER OMEGA WITH TONOS
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{038F}".freeze => "\u{03A9}".freeze,

    # 0390 GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{0390}".freeze => "\u{03B9}".freeze,

    # 03AA GREEK CAPITAL LETTER IOTA WITH DIALYTIKA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{03AA}".freeze => "\u{0399}".freeze,

    # 03AB GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{03AB}".freeze => "\u{03A5}".freeze,

    # 03AC GREEK SMALL LETTER ALPHA WITH TONOS
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{03AC}".freeze => "\u{03B1}".freeze,

    # 03AD GREEK SMALL LETTER EPSILON WITH TONOS
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{03AD}".freeze => "\u{03B5}".freeze,

    # 03AE GREEK SMALL LETTER ETA WITH TONOS
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{03AE}".freeze => "\u{03B7}".freeze,

    # 03AF GREEK SMALL LETTER IOTA WITH TONOS
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{03AF}".freeze => "\u{03B9}".freeze,

    # 03B0 GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{03B0}".freeze => "\u{03C5}".freeze,

    # 03CA GREEK SMALL LETTER IOTA WITH DIALYTIKA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{03CA}".freeze => "\u{03B9}".freeze,

    # 03CB GREEK SMALL LETTER UPSILON WITH DIALYTIKA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{03CB}".freeze => "\u{03C5}".freeze,

    # 03CC GREEK SMALL LETTER OMICRON WITH TONOS
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{03CC}".freeze => "\u{03BF}".freeze,

    # 03CD GREEK SMALL LETTER UPSILON WITH TONOS
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{03CD}".freeze => "\u{03C5}".freeze,

    # 03CE GREEK SMALL LETTER OMEGA WITH TONOS
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{03CE}".freeze => "\u{03C9}".freeze,

    # 03D0 GREEK BETA SYMBOL
    # ->   03B2 GREEK SMALL LETTER BETA
    "\u{03D0}".freeze => "\u{03B2}".freeze,

    # 03D1 GREEK THETA SYMBOL
    # ->   03B8 GREEK SMALL LETTER THETA
    "\u{03D1}".freeze => "\u{03B8}".freeze,

    # 03D2 GREEK UPSILON WITH HOOK SYMBOL
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{03D2}".freeze => "\u{03A5}".freeze,

    # 03D3 GREEK UPSILON WITH ACUTE AND HOOK SYMBOL
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{03D3}".freeze => "\u{03A5}".freeze,

    # 03D4 GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{03D4}".freeze => "\u{03A5}".freeze,

    # 03D5 GREEK PHI SYMBOL
    # ->   03C6 GREEK SMALL LETTER PHI
    "\u{03D5}".freeze => "\u{03C6}".freeze,

    # 03D6 GREEK PI SYMBOL
    # ->   03C0 GREEK SMALL LETTER PI
    "\u{03D6}".freeze => "\u{03C0}".freeze,

    # 03F0 GREEK KAPPA SYMBOL
    # ->   03BA GREEK SMALL LETTER KAPPA
    "\u{03F0}".freeze => "\u{03BA}".freeze,

    # 03F1 GREEK RHO SYMBOL
    # ->   03C1 GREEK SMALL LETTER RHO
    "\u{03F1}".freeze => "\u{03C1}".freeze,

    # 03F2 GREEK LUNATE SIGMA SYMBOL
    # ->   03C2 GREEK SMALL LETTER FINAL SIGMA
    "\u{03F2}".freeze => "\u{03C2}".freeze,

    # 03F4 GREEK CAPITAL THETA SYMBOL
    # ->   0398 GREEK CAPITAL LETTER THETA
    "\u{03F4}".freeze => "\u{0398}".freeze,

    # 03F5 GREEK LUNATE EPSILON SYMBOL
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{03F5}".freeze => "\u{03B5}".freeze,

    # 03F9 GREEK CAPITAL LUNATE SIGMA SYMBOL
    # ->   03A3 GREEK CAPITAL LETTER SIGMA
    "\u{03F9}".freeze => "\u{03A3}".freeze,

    # 0400 CYRILLIC CAPITAL LETTER IE WITH GRAVE
    # ->   0415 CYRILLIC CAPITAL LETTER IE
    "\u{0400}".freeze => "\u{0415}".freeze,

    # 0401 CYRILLIC CAPITAL LETTER IO
    # ->   0415 CYRILLIC CAPITAL LETTER IE
    "\u{0401}".freeze => "\u{0415}".freeze,

    # 0403 CYRILLIC CAPITAL LETTER GJE
    # ->   0413 CYRILLIC CAPITAL LETTER GHE
    "\u{0403}".freeze => "\u{0413}".freeze,

    # 0407 CYRILLIC CAPITAL LETTER YI
    # ->   0406 CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I
    "\u{0407}".freeze => "\u{0406}".freeze,

    # 040C CYRILLIC CAPITAL LETTER KJE
    # ->   041A CYRILLIC CAPITAL LETTER KA
    "\u{040C}".freeze => "\u{041A}".freeze,

    # 040D CYRILLIC CAPITAL LETTER I WITH GRAVE
    # ->   0418 CYRILLIC CAPITAL LETTER I
    "\u{040D}".freeze => "\u{0418}".freeze,

    # 040E CYRILLIC CAPITAL LETTER SHORT U
    # ->   0423 CYRILLIC CAPITAL LETTER U
    "\u{040E}".freeze => "\u{0423}".freeze,

    # 0419 CYRILLIC CAPITAL LETTER SHORT I
    # ->   0418 CYRILLIC CAPITAL LETTER I
    "\u{0419}".freeze => "\u{0418}".freeze,

    # 0439 CYRILLIC SMALL LETTER SHORT I
    # ->   0438 CYRILLIC SMALL LETTER I
    "\u{0439}".freeze => "\u{0438}".freeze,

    # 0450 CYRILLIC SMALL LETTER IE WITH GRAVE
    # ->   0435 CYRILLIC SMALL LETTER IE
    "\u{0450}".freeze => "\u{0435}".freeze,

    # 0451 CYRILLIC SMALL LETTER IO
    # ->   0435 CYRILLIC SMALL LETTER IE
    "\u{0451}".freeze => "\u{0435}".freeze,

    # 0453 CYRILLIC SMALL LETTER GJE
    # ->   0433 CYRILLIC SMALL LETTER GHE
    "\u{0453}".freeze => "\u{0433}".freeze,

    # 0457 CYRILLIC SMALL LETTER YI
    # ->   0456 CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I
    "\u{0457}".freeze => "\u{0456}".freeze,

    # 045C CYRILLIC SMALL LETTER KJE
    # ->   043A CYRILLIC SMALL LETTER KA
    "\u{045C}".freeze => "\u{043A}".freeze,

    # 045D CYRILLIC SMALL LETTER I WITH GRAVE
    # ->   0438 CYRILLIC SMALL LETTER I
    "\u{045D}".freeze => "\u{0438}".freeze,

    # 045E CYRILLIC SMALL LETTER SHORT U
    # ->   0443 CYRILLIC SMALL LETTER U
    "\u{045E}".freeze => "\u{0443}".freeze,

    # 0476 CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT
    # ->   0474 CYRILLIC CAPITAL LETTER IZHITSA
    "\u{0476}".freeze => "\u{0474}".freeze,

    # 0477 CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT
    # ->   0475 CYRILLIC SMALL LETTER IZHITSA
    "\u{0477}".freeze => "\u{0475}".freeze,

    # 047C CYRILLIC CAPITAL LETTER OMEGA WITH TITLO
    # ->   0460 CYRILLIC CAPITAL LETTER OMEGA
    "\u{047C}".freeze => "\u{0460}".freeze,

    # 047D CYRILLIC SMALL LETTER OMEGA WITH TITLO
    # ->   0461 CYRILLIC SMALL LETTER OMEGA
    "\u{047D}".freeze => "\u{0461}".freeze,

    # 048A CYRILLIC CAPITAL LETTER SHORT I WITH TAIL
    # ->   0418 CYRILLIC CAPITAL LETTER I
    "\u{048A}".freeze => "\u{0418}".freeze,

    # 048B CYRILLIC SMALL LETTER SHORT I WITH TAIL
    # ->   0438 CYRILLIC SMALL LETTER I
    "\u{048B}".freeze => "\u{0438}".freeze,

    # 048E CYRILLIC CAPITAL LETTER ER WITH TICK
    # ->   0420 CYRILLIC CAPITAL LETTER ER
    "\u{048E}".freeze => "\u{0420}".freeze,

    # 048F CYRILLIC SMALL LETTER ER WITH TICK
    # ->   0440 CYRILLIC SMALL LETTER ER
    "\u{048F}".freeze => "\u{0440}".freeze,

    # 0490 CYRILLIC CAPITAL LETTER GHE WITH UPTURN
    # ->   0413 CYRILLIC CAPITAL LETTER GHE
    "\u{0490}".freeze => "\u{0413}".freeze,

    # 0491 CYRILLIC SMALL LETTER GHE WITH UPTURN
    # ->   0433 CYRILLIC SMALL LETTER GHE
    "\u{0491}".freeze => "\u{0433}".freeze,

    # 0492 CYRILLIC CAPITAL LETTER GHE WITH STROKE
    # ->   0413 CYRILLIC CAPITAL LETTER GHE
    "\u{0492}".freeze => "\u{0413}".freeze,

    # 0493 CYRILLIC SMALL LETTER GHE WITH STROKE
    # ->   0433 CYRILLIC SMALL LETTER GHE
    "\u{0493}".freeze => "\u{0433}".freeze,

    # 0494 CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK
    # ->   0413 CYRILLIC CAPITAL LETTER GHE
    "\u{0494}".freeze => "\u{0413}".freeze,

    # 0495 CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK
    # ->   0433 CYRILLIC SMALL LETTER GHE
    "\u{0495}".freeze => "\u{0433}".freeze,

    # 0496 CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER
    # ->   0416 CYRILLIC CAPITAL LETTER ZHE
    "\u{0496}".freeze => "\u{0416}".freeze,

    # 0497 CYRILLIC SMALL LETTER ZHE WITH DESCENDER
    # ->   0436 CYRILLIC SMALL LETTER ZHE
    "\u{0497}".freeze => "\u{0436}".freeze,

    # 0498 CYRILLIC CAPITAL LETTER ZE WITH DESCENDER
    # ->   0417 CYRILLIC CAPITAL LETTER ZE
    "\u{0498}".freeze => "\u{0417}".freeze,

    # 0499 CYRILLIC SMALL LETTER ZE WITH DESCENDER
    # ->   0437 CYRILLIC SMALL LETTER ZE
    "\u{0499}".freeze => "\u{0437}".freeze,

    # 049A CYRILLIC CAPITAL LETTER KA WITH DESCENDER
    # ->   041A CYRILLIC CAPITAL LETTER KA
    "\u{049A}".freeze => "\u{041A}".freeze,

    # 049B CYRILLIC SMALL LETTER KA WITH DESCENDER
    # ->   043A CYRILLIC SMALL LETTER KA
    "\u{049B}".freeze => "\u{043A}".freeze,

    # 049C CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE
    # ->   041A CYRILLIC CAPITAL LETTER KA
    "\u{049C}".freeze => "\u{041A}".freeze,

    # 049D CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE
    # ->   043A CYRILLIC SMALL LETTER KA
    "\u{049D}".freeze => "\u{043A}".freeze,

    # 049E CYRILLIC CAPITAL LETTER KA WITH STROKE
    # ->   041A CYRILLIC CAPITAL LETTER KA
    "\u{049E}".freeze => "\u{041A}".freeze,

    # 049F CYRILLIC SMALL LETTER KA WITH STROKE
    # ->   043A CYRILLIC SMALL LETTER KA
    "\u{049F}".freeze => "\u{043A}".freeze,

    # 04A2 CYRILLIC CAPITAL LETTER EN WITH DESCENDER
    # ->   041D CYRILLIC CAPITAL LETTER EN
    "\u{04A2}".freeze => "\u{041D}".freeze,

    # 04A3 CYRILLIC SMALL LETTER EN WITH DESCENDER
    # ->   043D CYRILLIC SMALL LETTER EN
    "\u{04A3}".freeze => "\u{043D}".freeze,

    # 04A6 CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK
    # ->   041F CYRILLIC CAPITAL LETTER PE
    "\u{04A6}".freeze => "\u{041F}".freeze,

    # 04A7 CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK
    # ->   043F CYRILLIC SMALL LETTER PE
    "\u{04A7}".freeze => "\u{043F}".freeze,

    # 04AA CYRILLIC CAPITAL LETTER ES WITH DESCENDER
    # ->   0421 CYRILLIC CAPITAL LETTER ES
    "\u{04AA}".freeze => "\u{0421}".freeze,

    # 04AB CYRILLIC SMALL LETTER ES WITH DESCENDER
    # ->   0441 CYRILLIC SMALL LETTER ES
    "\u{04AB}".freeze => "\u{0441}".freeze,

    # 04AC CYRILLIC CAPITAL LETTER TE WITH DESCENDER
    # ->   0422 CYRILLIC CAPITAL LETTER TE
    "\u{04AC}".freeze => "\u{0422}".freeze,

    # 04AD CYRILLIC SMALL LETTER TE WITH DESCENDER
    # ->   0442 CYRILLIC SMALL LETTER TE
    "\u{04AD}".freeze => "\u{0442}".freeze,

    # 04B0 CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE
    # ->   04AE CYRILLIC CAPITAL LETTER STRAIGHT U
    "\u{04B0}".freeze => "\u{04AE}".freeze,

    # 04B1 CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE
    # ->   04AF CYRILLIC SMALL LETTER STRAIGHT U
    "\u{04B1}".freeze => "\u{04AF}".freeze,

    # 04B2 CYRILLIC CAPITAL LETTER HA WITH DESCENDER
    # ->   0425 CYRILLIC CAPITAL LETTER HA
    "\u{04B2}".freeze => "\u{0425}".freeze,

    # 04B3 CYRILLIC SMALL LETTER HA WITH DESCENDER
    # ->   0445 CYRILLIC SMALL LETTER HA
    "\u{04B3}".freeze => "\u{0445}".freeze,

    # 04B6 CYRILLIC CAPITAL LETTER CHE WITH DESCENDER
    # ->   0427 CYRILLIC CAPITAL LETTER CHE
    "\u{04B6}".freeze => "\u{0427}".freeze,

    # 04B7 CYRILLIC SMALL LETTER CHE WITH DESCENDER
    # ->   0447 CYRILLIC SMALL LETTER CHE
    "\u{04B7}".freeze => "\u{0447}".freeze,

    # 04B8 CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE
    # ->   0427 CYRILLIC CAPITAL LETTER CHE
    "\u{04B8}".freeze => "\u{0427}".freeze,

    # 04B9 CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE
    # ->   0447 CYRILLIC SMALL LETTER CHE
    "\u{04B9}".freeze => "\u{0447}".freeze,

    # 04BE CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER
    # ->   04BC CYRILLIC CAPITAL LETTER ABKHASIAN CHE
    "\u{04BE}".freeze => "\u{04BC}".freeze,

    # 04BF CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER
    # ->   04BD CYRILLIC SMALL LETTER ABKHASIAN CHE
    "\u{04BF}".freeze => "\u{04BD}".freeze,

    # 04C1 CYRILLIC CAPITAL LETTER ZHE WITH BREVE
    # ->   0416 CYRILLIC CAPITAL LETTER ZHE
    "\u{04C1}".freeze => "\u{0416}".freeze,

    # 04C2 CYRILLIC SMALL LETTER ZHE WITH BREVE
    # ->   0436 CYRILLIC SMALL LETTER ZHE
    "\u{04C2}".freeze => "\u{0436}".freeze,

    # 04C3 CYRILLIC CAPITAL LETTER KA WITH HOOK
    # ->   041A CYRILLIC CAPITAL LETTER KA
    "\u{04C3}".freeze => "\u{041A}".freeze,

    # 04C4 CYRILLIC SMALL LETTER KA WITH HOOK
    # ->   043A CYRILLIC SMALL LETTER KA
    "\u{04C4}".freeze => "\u{043A}".freeze,

    # 04C5 CYRILLIC CAPITAL LETTER EL WITH TAIL
    # ->   041B CYRILLIC CAPITAL LETTER EL
    "\u{04C5}".freeze => "\u{041B}".freeze,

    # 04C6 CYRILLIC SMALL LETTER EL WITH TAIL
    # ->   043B CYRILLIC SMALL LETTER EL
    "\u{04C6}".freeze => "\u{043B}".freeze,

    # 04C7 CYRILLIC CAPITAL LETTER EN WITH HOOK
    # ->   041D CYRILLIC CAPITAL LETTER EN
    "\u{04C7}".freeze => "\u{041D}".freeze,

    # 04C8 CYRILLIC SMALL LETTER EN WITH HOOK
    # ->   043D CYRILLIC SMALL LETTER EN
    "\u{04C8}".freeze => "\u{043D}".freeze,

    # 04C9 CYRILLIC CAPITAL LETTER EN WITH TAIL
    # ->   041D CYRILLIC CAPITAL LETTER EN
    "\u{04C9}".freeze => "\u{041D}".freeze,

    # 04CA CYRILLIC SMALL LETTER EN WITH TAIL
    # ->   043D CYRILLIC SMALL LETTER EN
    "\u{04CA}".freeze => "\u{043D}".freeze,

    # 04CD CYRILLIC CAPITAL LETTER EM WITH TAIL
    # ->   041C CYRILLIC CAPITAL LETTER EM
    "\u{04CD}".freeze => "\u{041C}".freeze,

    # 04CE CYRILLIC SMALL LETTER EM WITH TAIL
    # ->   043C CYRILLIC SMALL LETTER EM
    "\u{04CE}".freeze => "\u{043C}".freeze,

    # 04D0 CYRILLIC CAPITAL LETTER A WITH BREVE
    # ->   0410 CYRILLIC CAPITAL LETTER A
    "\u{04D0}".freeze => "\u{0410}".freeze,

    # 04D1 CYRILLIC SMALL LETTER A WITH BREVE
    # ->   0430 CYRILLIC SMALL LETTER A
    "\u{04D1}".freeze => "\u{0430}".freeze,

    # 04D2 CYRILLIC CAPITAL LETTER A WITH DIAERESIS
    # ->   0410 CYRILLIC CAPITAL LETTER A
    "\u{04D2}".freeze => "\u{0410}".freeze,

    # 04D3 CYRILLIC SMALL LETTER A WITH DIAERESIS
    # ->   0430 CYRILLIC SMALL LETTER A
    "\u{04D3}".freeze => "\u{0430}".freeze,

    # 04D6 CYRILLIC CAPITAL LETTER IE WITH BREVE
    # ->   0415 CYRILLIC CAPITAL LETTER IE
    "\u{04D6}".freeze => "\u{0415}".freeze,

    # 04D7 CYRILLIC SMALL LETTER IE WITH BREVE
    # ->   0435 CYRILLIC SMALL LETTER IE
    "\u{04D7}".freeze => "\u{0435}".freeze,

    # 04DA CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS
    # ->   04D8 CYRILLIC CAPITAL LETTER SCHWA
    "\u{04DA}".freeze => "\u{04D8}".freeze,

    # 04DB CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS
    # ->   04D9 CYRILLIC SMALL LETTER SCHWA
    "\u{04DB}".freeze => "\u{04D9}".freeze,

    # 04DC CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS
    # ->   0416 CYRILLIC CAPITAL LETTER ZHE
    "\u{04DC}".freeze => "\u{0416}".freeze,

    # 04DD CYRILLIC SMALL LETTER ZHE WITH DIAERESIS
    # ->   0436 CYRILLIC SMALL LETTER ZHE
    "\u{04DD}".freeze => "\u{0436}".freeze,

    # 04DE CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS
    # ->   0417 CYRILLIC CAPITAL LETTER ZE
    "\u{04DE}".freeze => "\u{0417}".freeze,

    # 04DF CYRILLIC SMALL LETTER ZE WITH DIAERESIS
    # ->   0437 CYRILLIC SMALL LETTER ZE
    "\u{04DF}".freeze => "\u{0437}".freeze,

    # 04E2 CYRILLIC CAPITAL LETTER I WITH MACRON
    # ->   0418 CYRILLIC CAPITAL LETTER I
    "\u{04E2}".freeze => "\u{0418}".freeze,

    # 04E3 CYRILLIC SMALL LETTER I WITH MACRON
    # ->   0438 CYRILLIC SMALL LETTER I
    "\u{04E3}".freeze => "\u{0438}".freeze,

    # 04E4 CYRILLIC CAPITAL LETTER I WITH DIAERESIS
    # ->   0418 CYRILLIC CAPITAL LETTER I
    "\u{04E4}".freeze => "\u{0418}".freeze,

    # 04E5 CYRILLIC SMALL LETTER I WITH DIAERESIS
    # ->   0438 CYRILLIC SMALL LETTER I
    "\u{04E5}".freeze => "\u{0438}".freeze,

    # 04E6 CYRILLIC CAPITAL LETTER O WITH DIAERESIS
    # ->   041E CYRILLIC CAPITAL LETTER O
    "\u{04E6}".freeze => "\u{041E}".freeze,

    # 04E7 CYRILLIC SMALL LETTER O WITH DIAERESIS
    # ->   043E CYRILLIC SMALL LETTER O
    "\u{04E7}".freeze => "\u{043E}".freeze,

    # 04EA CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS
    # ->   04E8 CYRILLIC CAPITAL LETTER BARRED O
    "\u{04EA}".freeze => "\u{04E8}".freeze,

    # 04EB CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS
    # ->   04E9 CYRILLIC SMALL LETTER BARRED O
    "\u{04EB}".freeze => "\u{04E9}".freeze,

    # 04EC CYRILLIC CAPITAL LETTER E WITH DIAERESIS
    # ->   042D CYRILLIC CAPITAL LETTER E
    "\u{04EC}".freeze => "\u{042D}".freeze,

    # 04ED CYRILLIC SMALL LETTER E WITH DIAERESIS
    # ->   044D CYRILLIC SMALL LETTER E
    "\u{04ED}".freeze => "\u{044D}".freeze,

    # 04EE CYRILLIC CAPITAL LETTER U WITH MACRON
    # ->   0423 CYRILLIC CAPITAL LETTER U
    "\u{04EE}".freeze => "\u{0423}".freeze,

    # 04EF CYRILLIC SMALL LETTER U WITH MACRON
    # ->   0443 CYRILLIC SMALL LETTER U
    "\u{04EF}".freeze => "\u{0443}".freeze,

    # 04F0 CYRILLIC CAPITAL LETTER U WITH DIAERESIS
    # ->   0423 CYRILLIC CAPITAL LETTER U
    "\u{04F0}".freeze => "\u{0423}".freeze,

    # 04F1 CYRILLIC SMALL LETTER U WITH DIAERESIS
    # ->   0443 CYRILLIC SMALL LETTER U
    "\u{04F1}".freeze => "\u{0443}".freeze,

    # 04F2 CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE
    # ->   0423 CYRILLIC CAPITAL LETTER U
    "\u{04F2}".freeze => "\u{0423}".freeze,

    # 04F3 CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE
    # ->   0443 CYRILLIC SMALL LETTER U
    "\u{04F3}".freeze => "\u{0443}".freeze,

    # 04F4 CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS
    # ->   0427 CYRILLIC CAPITAL LETTER CHE
    "\u{04F4}".freeze => "\u{0427}".freeze,

    # 04F5 CYRILLIC SMALL LETTER CHE WITH DIAERESIS
    # ->   0447 CYRILLIC SMALL LETTER CHE
    "\u{04F5}".freeze => "\u{0447}".freeze,

    # 04F8 CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS
    # ->   042B CYRILLIC CAPITAL LETTER YERU
    "\u{04F8}".freeze => "\u{042B}".freeze,

    # 04F9 CYRILLIC SMALL LETTER YERU WITH DIAERESIS
    # ->   044B CYRILLIC SMALL LETTER YERU
    "\u{04F9}".freeze => "\u{044B}".freeze,

    # 0587 ARMENIAN SMALL LIGATURE ECH YIWN
    # ->   0565 ARMENIAN SMALL LETTER ECH
    #    + 0582 ARMENIAN SMALL LETTER YIWN
    "\u{0587}".freeze => "\u{0565}\u{0582}".freeze,

    # 0622 ARABIC LETTER ALEF WITH MADDA ABOVE
    # ->   0627 ARABIC LETTER ALEF
    "\u{0622}".freeze => "\u{0627}".freeze,

    # 0623 ARABIC LETTER ALEF WITH HAMZA ABOVE
    # ->   0627 ARABIC LETTER ALEF
    "\u{0623}".freeze => "\u{0627}".freeze,

    # 0624 ARABIC LETTER WAW WITH HAMZA ABOVE
    # ->   0648 ARABIC LETTER WAW
    "\u{0624}".freeze => "\u{0648}".freeze,

    # 0625 ARABIC LETTER ALEF WITH HAMZA BELOW
    # ->   0627 ARABIC LETTER ALEF
    "\u{0625}".freeze => "\u{0627}".freeze,

    # 0626 ARABIC LETTER YEH WITH HAMZA ABOVE
    # ->   064A ARABIC LETTER YEH
    "\u{0626}".freeze => "\u{064A}".freeze,

    # 0672 ARABIC LETTER ALEF WITH WAVY HAMZA ABOVE
    # ->   0627 ARABIC LETTER ALEF
    "\u{0672}".freeze => "\u{0627}".freeze,

    # 0673 ARABIC LETTER ALEF WITH WAVY HAMZA BELOW
    # ->   0627 ARABIC LETTER ALEF
    "\u{0673}".freeze => "\u{0627}".freeze,

    # 0675 ARABIC LETTER HIGH HAMZA ALEF
    # ->   0627 ARABIC LETTER ALEF
    #    + 0674 ARABIC LETTER HIGH HAMZA
    "\u{0675}".freeze => "\u{0627}\u{0674}".freeze,

    # 0676 ARABIC LETTER HIGH HAMZA WAW
    # ->   0648 ARABIC LETTER WAW
    #    + 0674 ARABIC LETTER HIGH HAMZA
    "\u{0676}".freeze => "\u{0648}\u{0674}".freeze,

    # 0677 ARABIC LETTER U WITH HAMZA ABOVE
    # ->   06C7 ARABIC LETTER U
    #    + 0674 ARABIC LETTER HIGH HAMZA
    "\u{0677}".freeze => "\u{06C7}\u{0674}".freeze,

    # 0678 ARABIC LETTER HIGH HAMZA YEH
    # ->   064A ARABIC LETTER YEH
    #    + 0674 ARABIC LETTER HIGH HAMZA
    "\u{0678}".freeze => "\u{064A}\u{0674}".freeze,

    # 067C ARABIC LETTER TEH WITH RING
    # ->   062A ARABIC LETTER TEH
    "\u{067C}".freeze => "\u{062A}".freeze,

    # 067D ARABIC LETTER TEH WITH THREE DOTS ABOVE DOWNWARDS
    # ->   062A ARABIC LETTER TEH
    "\u{067D}".freeze => "\u{062A}".freeze,

    # 0681 ARABIC LETTER HAH WITH HAMZA ABOVE
    # ->   062D ARABIC LETTER HAH
    "\u{0681}".freeze => "\u{062D}".freeze,

    # 0682 ARABIC LETTER HAH WITH TWO DOTS VERTICAL ABOVE
    # ->   062D ARABIC LETTER HAH
    "\u{0682}".freeze => "\u{062D}".freeze,

    # 0685 ARABIC LETTER HAH WITH THREE DOTS ABOVE
    # ->   062D ARABIC LETTER HAH
    "\u{0685}".freeze => "\u{062D}".freeze,

    # 0689 ARABIC LETTER DAL WITH RING
    # ->   062F ARABIC LETTER DAL
    "\u{0689}".freeze => "\u{062F}".freeze,

    # 068A ARABIC LETTER DAL WITH DOT BELOW
    # ->   062F ARABIC LETTER DAL
    "\u{068A}".freeze => "\u{062F}".freeze,

    # 068B ARABIC LETTER DAL WITH DOT BELOW AND SMALL TAH
    # ->   062F ARABIC LETTER DAL
    "\u{068B}".freeze => "\u{062F}".freeze,

    # 068F ARABIC LETTER DAL WITH THREE DOTS ABOVE DOWNWARDS
    # ->   062F ARABIC LETTER DAL
    "\u{068F}".freeze => "\u{062F}".freeze,

    # 0690 ARABIC LETTER DAL WITH FOUR DOTS ABOVE
    # ->   062F ARABIC LETTER DAL
    "\u{0690}".freeze => "\u{062F}".freeze,

    # 0692 ARABIC LETTER REH WITH SMALL V
    # ->   0631 ARABIC LETTER REH
    "\u{0692}".freeze => "\u{0631}".freeze,

    # 0693 ARABIC LETTER REH WITH RING
    # ->   0631 ARABIC LETTER REH
    "\u{0693}".freeze => "\u{0631}".freeze,

    # 0694 ARABIC LETTER REH WITH DOT BELOW
    # ->   0631 ARABIC LETTER REH
    "\u{0694}".freeze => "\u{0631}".freeze,

    # 0695 ARABIC LETTER REH WITH SMALL V BELOW
    # ->   0631 ARABIC LETTER REH
    "\u{0695}".freeze => "\u{0631}".freeze,

    # 0696 ARABIC LETTER REH WITH DOT BELOW AND DOT ABOVE
    # ->   0631 ARABIC LETTER REH
    "\u{0696}".freeze => "\u{0631}".freeze,

    # 0697 ARABIC LETTER REH WITH TWO DOTS ABOVE
    # ->   0631 ARABIC LETTER REH
    "\u{0697}".freeze => "\u{0631}".freeze,

    # 0699 ARABIC LETTER REH WITH FOUR DOTS ABOVE
    # ->   0631 ARABIC LETTER REH
    "\u{0699}".freeze => "\u{0631}".freeze,

    # 069A ARABIC LETTER SEEN WITH DOT BELOW AND DOT ABOVE
    # ->   0633 ARABIC LETTER SEEN
    "\u{069A}".freeze => "\u{0633}".freeze,

    # 069B ARABIC LETTER SEEN WITH THREE DOTS BELOW
    # ->   0633 ARABIC LETTER SEEN
    "\u{069B}".freeze => "\u{0633}".freeze,

    # 069C ARABIC LETTER SEEN WITH THREE DOTS BELOW AND THREE DOTS ABOVE
    # ->   0633 ARABIC LETTER SEEN
    "\u{069C}".freeze => "\u{0633}".freeze,

    # 069D ARABIC LETTER SAD WITH TWO DOTS BELOW
    # ->   0635 ARABIC LETTER SAD
    "\u{069D}".freeze => "\u{0635}".freeze,

    # 069E ARABIC LETTER SAD WITH THREE DOTS ABOVE
    # ->   0635 ARABIC LETTER SAD
    "\u{069E}".freeze => "\u{0635}".freeze,

    # 069F ARABIC LETTER TAH WITH THREE DOTS ABOVE
    # ->   0637 ARABIC LETTER TAH
    "\u{069F}".freeze => "\u{0637}".freeze,

    # 06A0 ARABIC LETTER AIN WITH THREE DOTS ABOVE
    # ->   0639 ARABIC LETTER AIN
    "\u{06A0}".freeze => "\u{0639}".freeze,

    # 06A2 ARABIC LETTER FEH WITH DOT MOVED BELOW
    # ->   0641 ARABIC LETTER FEH
    "\u{06A2}".freeze => "\u{0641}".freeze,

    # 06A3 ARABIC LETTER FEH WITH DOT BELOW
    # ->   0641 ARABIC LETTER FEH
    "\u{06A3}".freeze => "\u{0641}".freeze,

    # 06A5 ARABIC LETTER FEH WITH THREE DOTS BELOW
    # ->   0641 ARABIC LETTER FEH
    "\u{06A5}".freeze => "\u{0641}".freeze,

    # 06A7 ARABIC LETTER QAF WITH DOT ABOVE
    # ->   0642 ARABIC LETTER QAF
    "\u{06A7}".freeze => "\u{0642}".freeze,

    # 06A8 ARABIC LETTER QAF WITH THREE DOTS ABOVE
    # ->   0642 ARABIC LETTER QAF
    "\u{06A8}".freeze => "\u{0642}".freeze,

    # 06AB ARABIC LETTER KAF WITH RING
    # ->   0643 ARABIC LETTER KAF
    "\u{06AB}".freeze => "\u{0643}".freeze,

    # 06AC ARABIC LETTER KAF WITH DOT ABOVE
    # ->   0643 ARABIC LETTER KAF
    "\u{06AC}".freeze => "\u{0643}".freeze,

    # 06AE ARABIC LETTER KAF WITH THREE DOTS BELOW
    # ->   0643 ARABIC LETTER KAF
    "\u{06AE}".freeze => "\u{0643}".freeze,

    # 06B0 ARABIC LETTER GAF WITH RING
    # ->   06AF ARABIC LETTER GAF
    "\u{06B0}".freeze => "\u{06AF}".freeze,

    # 06B2 ARABIC LETTER GAF WITH TWO DOTS BELOW
    # ->   06AF ARABIC LETTER GAF
    "\u{06B2}".freeze => "\u{06AF}".freeze,

    # 06B4 ARABIC LETTER GAF WITH THREE DOTS ABOVE
    # ->   06AF ARABIC LETTER GAF
    "\u{06B4}".freeze => "\u{06AF}".freeze,

    # 06B5 ARABIC LETTER LAM WITH SMALL V
    # ->   0644 ARABIC LETTER LAM
    "\u{06B5}".freeze => "\u{0644}".freeze,

    # 06B6 ARABIC LETTER LAM WITH DOT ABOVE
    # ->   0644 ARABIC LETTER LAM
    "\u{06B6}".freeze => "\u{0644}".freeze,

    # 06B7 ARABIC LETTER LAM WITH THREE DOTS ABOVE
    # ->   0644 ARABIC LETTER LAM
    "\u{06B7}".freeze => "\u{0644}".freeze,

    # 06B8 ARABIC LETTER LAM WITH THREE DOTS BELOW
    # ->   0644 ARABIC LETTER LAM
    "\u{06B8}".freeze => "\u{0644}".freeze,

    # 06B9 ARABIC LETTER NOON WITH DOT BELOW
    # ->   0646 ARABIC LETTER NOON
    "\u{06B9}".freeze => "\u{0646}".freeze,

    # 06BC ARABIC LETTER NOON WITH RING
    # ->   0646 ARABIC LETTER NOON
    "\u{06BC}".freeze => "\u{0646}".freeze,

    # 06BD ARABIC LETTER NOON WITH THREE DOTS ABOVE
    # ->   0646 ARABIC LETTER NOON
    "\u{06BD}".freeze => "\u{0646}".freeze,

    # 06BF ARABIC LETTER TCHEH WITH DOT ABOVE
    # ->   0686 ARABIC LETTER TCHEH
    "\u{06BF}".freeze => "\u{0686}".freeze,

    # 06C0 ARABIC LETTER HEH WITH YEH ABOVE
    # ->   06D5 ARABIC LETTER AE
    "\u{06C0}".freeze => "\u{06D5}".freeze,

    # 06C2 ARABIC LETTER HEH GOAL WITH HAMZA ABOVE
    # ->   06C1 ARABIC LETTER HEH GOAL
    "\u{06C2}".freeze => "\u{06C1}".freeze,

    # 06C4 ARABIC LETTER WAW WITH RING
    # ->   0648 ARABIC LETTER WAW
    "\u{06C4}".freeze => "\u{0648}".freeze,

    # 06CA ARABIC LETTER WAW WITH TWO DOTS ABOVE
    # ->   0648 ARABIC LETTER WAW
    "\u{06CA}".freeze => "\u{0648}".freeze,

    # 06CD ARABIC LETTER YEH WITH TAIL
    # ->   064A ARABIC LETTER YEH
    "\u{06CD}".freeze => "\u{064A}".freeze,

    # 06CE ARABIC LETTER YEH WITH SMALL V
    # ->   064A ARABIC LETTER YEH
    "\u{06CE}".freeze => "\u{064A}".freeze,

    # 06CF ARABIC LETTER WAW WITH DOT ABOVE
    # ->   0648 ARABIC LETTER WAW
    "\u{06CF}".freeze => "\u{0648}".freeze,

    # 06D1 ARABIC LETTER YEH WITH THREE DOTS BELOW
    # ->   064A ARABIC LETTER YEH
    "\u{06D1}".freeze => "\u{064A}".freeze,

    # 06D3 ARABIC LETTER YEH BARREE WITH HAMZA ABOVE
    # ->   06D2 ARABIC LETTER YEH BARREE
    "\u{06D3}".freeze => "\u{06D2}".freeze,

    # 06EE ARABIC LETTER DAL WITH INVERTED V
    # ->   062F ARABIC LETTER DAL
    "\u{06EE}".freeze => "\u{062F}".freeze,

    # 06EF ARABIC LETTER REH WITH INVERTED V
    # ->   0631 ARABIC LETTER REH
    "\u{06EF}".freeze => "\u{0631}".freeze,

    # 06FA ARABIC LETTER SHEEN WITH DOT BELOW
    # ->   0634 ARABIC LETTER SHEEN
    "\u{06FA}".freeze => "\u{0634}".freeze,

    # 06FB ARABIC LETTER DAD WITH DOT BELOW
    # ->   0636 ARABIC LETTER DAD
    "\u{06FB}".freeze => "\u{0636}".freeze,

    # 06FC ARABIC LETTER GHAIN WITH DOT BELOW
    # ->   063A ARABIC LETTER GHAIN
    "\u{06FC}".freeze => "\u{063A}".freeze,

    # 06FF ARABIC LETTER HEH WITH INVERTED V
    # ->   0647 ARABIC LETTER HEH
    "\u{06FF}".freeze => "\u{0647}".freeze,

    # 0929 DEVANAGARI LETTER NNNA
    # ->   0928 DEVANAGARI LETTER NA
    "\u{0929}".freeze => "\u{0928}".freeze,

    # 0931 DEVANAGARI LETTER RRA
    # ->   0930 DEVANAGARI LETTER RA
    "\u{0931}".freeze => "\u{0930}".freeze,

    # 0934 DEVANAGARI LETTER LLLA
    # ->   0933 DEVANAGARI LETTER LLA
    "\u{0934}".freeze => "\u{0933}".freeze,

    # 0958 DEVANAGARI LETTER QA
    # ->   0915 DEVANAGARI LETTER KA
    "\u{0958}".freeze => "\u{0915}".freeze,

    # 0959 DEVANAGARI LETTER KHHA
    # ->   0916 DEVANAGARI LETTER KHA
    "\u{0959}".freeze => "\u{0916}".freeze,

    # 095A DEVANAGARI LETTER GHHA
    # ->   0917 DEVANAGARI LETTER GA
    "\u{095A}".freeze => "\u{0917}".freeze,

    # 095B DEVANAGARI LETTER ZA
    # ->   091C DEVANAGARI LETTER JA
    "\u{095B}".freeze => "\u{091C}".freeze,

    # 095C DEVANAGARI LETTER DDDHA
    # ->   0921 DEVANAGARI LETTER DDA
    "\u{095C}".freeze => "\u{0921}".freeze,

    # 095D DEVANAGARI LETTER RHA
    # ->   0922 DEVANAGARI LETTER DDHA
    "\u{095D}".freeze => "\u{0922}".freeze,

    # 095E DEVANAGARI LETTER FA
    # ->   092B DEVANAGARI LETTER PHA
    "\u{095E}".freeze => "\u{092B}".freeze,

    # 095F DEVANAGARI LETTER YYA
    # ->   092F DEVANAGARI LETTER YA
    "\u{095F}".freeze => "\u{092F}".freeze,

    # 09DC BENGALI LETTER RRA
    # ->   09A1 BENGALI LETTER DDA
    "\u{09DC}".freeze => "\u{09A1}".freeze,

    # 09DD BENGALI LETTER RHA
    # ->   09A2 BENGALI LETTER DDHA
    "\u{09DD}".freeze => "\u{09A2}".freeze,

    # 09DF BENGALI LETTER YYA
    # ->   09AF BENGALI LETTER YA
    "\u{09DF}".freeze => "\u{09AF}".freeze,

    # 09F0 BENGALI LETTER RA WITH MIDDLE DIAGONAL
    # ->   09B0 BENGALI LETTER RA
    "\u{09F0}".freeze => "\u{09B0}".freeze,

    # 09F1 BENGALI LETTER RA WITH LOWER DIAGONAL
    # ->   09B0 BENGALI LETTER RA
    "\u{09F1}".freeze => "\u{09B0}".freeze,

    # 0A33 GURMUKHI LETTER LLA
    # ->   0A32 GURMUKHI LETTER LA
    "\u{0A33}".freeze => "\u{0A32}".freeze,

    # 0A36 GURMUKHI LETTER SHA
    # ->   0A38 GURMUKHI LETTER SA
    "\u{0A36}".freeze => "\u{0A38}".freeze,

    # 0A59 GURMUKHI LETTER KHHA
    # ->   0A16 GURMUKHI LETTER KHA
    "\u{0A59}".freeze => "\u{0A16}".freeze,

    # 0A5A GURMUKHI LETTER GHHA
    # ->   0A17 GURMUKHI LETTER GA
    "\u{0A5A}".freeze => "\u{0A17}".freeze,

    # 0A5B GURMUKHI LETTER ZA
    # ->   0A1C GURMUKHI LETTER JA
    "\u{0A5B}".freeze => "\u{0A1C}".freeze,

    # 0A5E GURMUKHI LETTER FA
    # ->   0A2B GURMUKHI LETTER PHA
    "\u{0A5E}".freeze => "\u{0A2B}".freeze,

    # 0B5C ORIYA LETTER RRA
    # ->   0B21 ORIYA LETTER DDA
    "\u{0B5C}".freeze => "\u{0B21}".freeze,

    # 0B5D ORIYA LETTER RHA
    # ->   0B22 ORIYA LETTER DDHA
    "\u{0B5D}".freeze => "\u{0B22}".freeze,

    # 0B94 TAMIL LETTER AU
    # ->   0B92 TAMIL LETTER O
    "\u{0B94}".freeze => "\u{0B92}".freeze,

    # 0E33 THAI CHARACTER SARA AM
    # ->   0E32 THAI CHARACTER SARA AA
    "\u{0E33}".freeze => "\u{0E32}".freeze,

    # 0EB3 LAO VOWEL SIGN AM
    # ->   0EB2 LAO VOWEL SIGN AA
    "\u{0EB3}".freeze => "\u{0EB2}".freeze,

    # 0EDC LAO HO NO
    # ->   0EAB LAO LETTER HO SUNG
    #    + 0E99 LAO LETTER NO
    "\u{0EDC}".freeze => "\u{0EAB}\u{0E99}".freeze,

    # 0EDD LAO HO MO
    # ->   0EAB LAO LETTER HO SUNG
    #    + 0EA1 LAO LETTER MO
    "\u{0EDD}".freeze => "\u{0EAB}\u{0EA1}".freeze,

    # 0F0C TIBETAN MARK DELIMITER TSHEG BSTAR
    # ->   0F0B TIBETAN MARK INTERSYLLABIC TSHEG
    "\u{0F0C}".freeze => "\u{0F0B}".freeze,

    # 0F43 TIBETAN LETTER GHA
    # ->   0F42 TIBETAN LETTER GA
    "\u{0F43}".freeze => "\u{0F42}".freeze,

    # 0F4D TIBETAN LETTER DDHA
    # ->   0F4C TIBETAN LETTER DDA
    "\u{0F4D}".freeze => "\u{0F4C}".freeze,

    # 0F52 TIBETAN LETTER DHA
    # ->   0F51 TIBETAN LETTER DA
    "\u{0F52}".freeze => "\u{0F51}".freeze,

    # 0F57 TIBETAN LETTER BHA
    # ->   0F56 TIBETAN LETTER BA
    "\u{0F57}".freeze => "\u{0F56}".freeze,

    # 0F5C TIBETAN LETTER DZHA
    # ->   0F5B TIBETAN LETTER DZA
    "\u{0F5C}".freeze => "\u{0F5B}".freeze,

    # 0F69 TIBETAN LETTER KSSA
    # ->   0F40 TIBETAN LETTER KA
    "\u{0F69}".freeze => "\u{0F40}".freeze,

    # 1026 MYANMAR LETTER UU
    # ->   1025 MYANMAR LETTER U
    "\u{1026}".freeze => "\u{1025}".freeze,

    # 1D0C LATIN LETTER SMALL CAPITAL L WITH STROKE
    # ->   029F LATIN LETTER SMALL CAPITAL L
    "\u{1D0C}".freeze => "\u{029F}".freeze,

    # 1D13 LATIN SMALL LETTER SIDEWAYS O WITH STROKE
    # ->   1D11 LATIN SMALL LETTER SIDEWAYS O
    "\u{1D13}".freeze => "\u{1D11}".freeze,

    # 1D2C MODIFIER LETTER CAPITAL A
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1D2C}".freeze => 'A'.freeze,

    # 1D2D MODIFIER LETTER CAPITAL AE
    # ->   0041 LATIN CAPITAL LETTER A
    #    + 0045 LATIN CAPITAL LETTER E
    "\u{1D2D}".freeze => 'AE'.freeze,

    # 1D2E MODIFIER LETTER CAPITAL B
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{1D2E}".freeze => 'B'.freeze,

    # 1D30 MODIFIER LETTER CAPITAL D
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{1D30}".freeze => 'D'.freeze,

    # 1D31 MODIFIER LETTER CAPITAL E
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1D31}".freeze => 'E'.freeze,

    # 1D32 MODIFIER LETTER CAPITAL REVERSED E
    # ->   018E LATIN CAPITAL LETTER REVERSED E
    "\u{1D32}".freeze => "\u{018E}".freeze,

    # 1D33 MODIFIER LETTER CAPITAL G
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{1D33}".freeze => 'G'.freeze,

    # 1D34 MODIFIER LETTER CAPITAL H
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{1D34}".freeze => 'H'.freeze,

    # 1D35 MODIFIER LETTER CAPITAL I
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{1D35}".freeze => 'I'.freeze,

    # 1D36 MODIFIER LETTER CAPITAL J
    # ->   004A LATIN CAPITAL LETTER J
    "\u{1D36}".freeze => 'J'.freeze,

    # 1D37 MODIFIER LETTER CAPITAL K
    # ->   004B LATIN CAPITAL LETTER K
    "\u{1D37}".freeze => 'K'.freeze,

    # 1D38 MODIFIER LETTER CAPITAL L
    # ->   004C LATIN CAPITAL LETTER L
    "\u{1D38}".freeze => 'L'.freeze,

    # 1D39 MODIFIER LETTER CAPITAL M
    # ->   004D LATIN CAPITAL LETTER M
    "\u{1D39}".freeze => 'M'.freeze,

    # 1D3A MODIFIER LETTER CAPITAL N
    # ->   004E LATIN CAPITAL LETTER N
    "\u{1D3A}".freeze => 'N'.freeze,

    # 1D3C MODIFIER LETTER CAPITAL O
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1D3C}".freeze => 'O'.freeze,

    # 1D3D MODIFIER LETTER CAPITAL OU
    # ->   0222 LATIN CAPITAL LETTER OU
    "\u{1D3D}".freeze => "\u{0222}".freeze,

    # 1D3E MODIFIER LETTER CAPITAL P
    # ->   0050 LATIN CAPITAL LETTER P
    "\u{1D3E}".freeze => 'P'.freeze,

    # 1D3F MODIFIER LETTER CAPITAL R
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{1D3F}".freeze => 'R'.freeze,

    # 1D40 MODIFIER LETTER CAPITAL T
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{1D40}".freeze => 'T'.freeze,

    # 1D41 MODIFIER LETTER CAPITAL U
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1D41}".freeze => 'U'.freeze,

    # 1D42 MODIFIER LETTER CAPITAL W
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{1D42}".freeze => 'W'.freeze,

    # 1D43 MODIFIER LETTER SMALL A
    # ->   0061 LATIN SMALL LETTER A
    "\u{1D43}".freeze => 'a'.freeze,

    # 1D44 MODIFIER LETTER SMALL TURNED A
    # ->   0250 LATIN SMALL LETTER TURNED A
    "\u{1D44}".freeze => "\u{0250}".freeze,

    # 1D45 MODIFIER LETTER SMALL ALPHA
    # ->   0251 LATIN SMALL LETTER ALPHA
    "\u{1D45}".freeze => "\u{0251}".freeze,

    # 1D46 MODIFIER LETTER SMALL TURNED AE
    # ->   1D02 LATIN SMALL LETTER TURNED AE
    "\u{1D46}".freeze => "\u{1D02}".freeze,

    # 1D47 MODIFIER LETTER SMALL B
    # ->   0062 LATIN SMALL LETTER B
    "\u{1D47}".freeze => 'b'.freeze,

    # 1D48 MODIFIER LETTER SMALL D
    # ->   0064 LATIN SMALL LETTER D
    "\u{1D48}".freeze => 'd'.freeze,

    # 1D49 MODIFIER LETTER SMALL E
    # ->   0065 LATIN SMALL LETTER E
    "\u{1D49}".freeze => 'e'.freeze,

    # 1D4A MODIFIER LETTER SMALL SCHWA
    # ->   0259 LATIN SMALL LETTER SCHWA
    "\u{1D4A}".freeze => "\u{0259}".freeze,

    # 1D4B MODIFIER LETTER SMALL OPEN E
    # ->   025B LATIN SMALL LETTER OPEN E
    "\u{1D4B}".freeze => "\u{025B}".freeze,

    # 1D4C MODIFIER LETTER SMALL TURNED OPEN E
    # ->   025C LATIN SMALL LETTER REVERSED OPEN E
    "\u{1D4C}".freeze => "\u{025C}".freeze,

    # 1D4D MODIFIER LETTER SMALL G
    # ->   0067 LATIN SMALL LETTER G
    "\u{1D4D}".freeze => 'g'.freeze,

    # 1D4F MODIFIER LETTER SMALL K
    # ->   006B LATIN SMALL LETTER K
    "\u{1D4F}".freeze => 'k'.freeze,

    # 1D50 MODIFIER LETTER SMALL M
    # ->   006D LATIN SMALL LETTER M
    "\u{1D50}".freeze => 'm'.freeze,

    # 1D51 MODIFIER LETTER SMALL ENG
    # ->   014B LATIN SMALL LETTER ENG
    "\u{1D51}".freeze => "\u{014B}".freeze,

    # 1D52 MODIFIER LETTER SMALL O
    # ->   006F LATIN SMALL LETTER O
    "\u{1D52}".freeze => 'o'.freeze,

    # 1D53 MODIFIER LETTER SMALL OPEN O
    # ->   0254 LATIN SMALL LETTER OPEN O
    "\u{1D53}".freeze => "\u{0254}".freeze,

    # 1D54 MODIFIER LETTER SMALL TOP HALF O
    # ->   1D16 LATIN SMALL LETTER TOP HALF O
    "\u{1D54}".freeze => "\u{1D16}".freeze,

    # 1D55 MODIFIER LETTER SMALL BOTTOM HALF O
    # ->   1D17 LATIN SMALL LETTER BOTTOM HALF O
    "\u{1D55}".freeze => "\u{1D17}".freeze,

    # 1D56 MODIFIER LETTER SMALL P
    # ->   0070 LATIN SMALL LETTER P
    "\u{1D56}".freeze => 'p'.freeze,

    # 1D57 MODIFIER LETTER SMALL T
    # ->   0074 LATIN SMALL LETTER T
    "\u{1D57}".freeze => 't'.freeze,

    # 1D58 MODIFIER LETTER SMALL U
    # ->   0075 LATIN SMALL LETTER U
    "\u{1D58}".freeze => 'u'.freeze,

    # 1D59 MODIFIER LETTER SMALL SIDEWAYS U
    # ->   1D1D LATIN SMALL LETTER SIDEWAYS U
    "\u{1D59}".freeze => "\u{1D1D}".freeze,

    # 1D5A MODIFIER LETTER SMALL TURNED M
    # ->   026F LATIN SMALL LETTER TURNED M
    "\u{1D5A}".freeze => "\u{026F}".freeze,

    # 1D5B MODIFIER LETTER SMALL V
    # ->   0076 LATIN SMALL LETTER V
    "\u{1D5B}".freeze => 'v'.freeze,

    # 1D5C MODIFIER LETTER SMALL AIN
    # ->   1D25 LATIN LETTER AIN
    "\u{1D5C}".freeze => "\u{1D25}".freeze,

    # 1D5D MODIFIER LETTER SMALL BETA
    # ->   03B2 GREEK SMALL LETTER BETA
    "\u{1D5D}".freeze => "\u{03B2}".freeze,

    # 1D5E MODIFIER LETTER SMALL GREEK GAMMA
    # ->   03B3 GREEK SMALL LETTER GAMMA
    "\u{1D5E}".freeze => "\u{03B3}".freeze,

    # 1D5F MODIFIER LETTER SMALL DELTA
    # ->   03B4 GREEK SMALL LETTER DELTA
    "\u{1D5F}".freeze => "\u{03B4}".freeze,

    # 1D60 MODIFIER LETTER SMALL GREEK PHI
    # ->   03C6 GREEK SMALL LETTER PHI
    "\u{1D60}".freeze => "\u{03C6}".freeze,

    # 1D61 MODIFIER LETTER SMALL CHI
    # ->   03C7 GREEK SMALL LETTER CHI
    "\u{1D61}".freeze => "\u{03C7}".freeze,

    # 1D62 LATIN SUBSCRIPT SMALL LETTER I
    # ->   0069 LATIN SMALL LETTER I
    "\u{1D62}".freeze => 'i'.freeze,

    # 1D63 LATIN SUBSCRIPT SMALL LETTER R
    # ->   0072 LATIN SMALL LETTER R
    "\u{1D63}".freeze => 'r'.freeze,

    # 1D64 LATIN SUBSCRIPT SMALL LETTER U
    # ->   0075 LATIN SMALL LETTER U
    "\u{1D64}".freeze => 'u'.freeze,

    # 1D65 LATIN SUBSCRIPT SMALL LETTER V
    # ->   0076 LATIN SMALL LETTER V
    "\u{1D65}".freeze => 'v'.freeze,

    # 1D66 GREEK SUBSCRIPT SMALL LETTER BETA
    # ->   03B2 GREEK SMALL LETTER BETA
    "\u{1D66}".freeze => "\u{03B2}".freeze,

    # 1D67 GREEK SUBSCRIPT SMALL LETTER GAMMA
    # ->   03B3 GREEK SMALL LETTER GAMMA
    "\u{1D67}".freeze => "\u{03B3}".freeze,

    # 1D68 GREEK SUBSCRIPT SMALL LETTER RHO
    # ->   03C1 GREEK SMALL LETTER RHO
    "\u{1D68}".freeze => "\u{03C1}".freeze,

    # 1D69 GREEK SUBSCRIPT SMALL LETTER PHI
    # ->   03C6 GREEK SMALL LETTER PHI
    "\u{1D69}".freeze => "\u{03C6}".freeze,

    # 1D6A GREEK SUBSCRIPT SMALL LETTER CHI
    # ->   03C7 GREEK SMALL LETTER CHI
    "\u{1D6A}".freeze => "\u{03C7}".freeze,

    # 1E00 LATIN CAPITAL LETTER A WITH RING BELOW
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1E00}".freeze => 'A'.freeze,

    # 1E01 LATIN SMALL LETTER A WITH RING BELOW
    # ->   0061 LATIN SMALL LETTER A
    "\u{1E01}".freeze => 'a'.freeze,

    # 1E02 LATIN CAPITAL LETTER B WITH DOT ABOVE
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{1E02}".freeze => 'B'.freeze,

    # 1E03 LATIN SMALL LETTER B WITH DOT ABOVE
    # ->   0062 LATIN SMALL LETTER B
    "\u{1E03}".freeze => 'b'.freeze,

    # 1E04 LATIN CAPITAL LETTER B WITH DOT BELOW
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{1E04}".freeze => 'B'.freeze,

    # 1E05 LATIN SMALL LETTER B WITH DOT BELOW
    # ->   0062 LATIN SMALL LETTER B
    "\u{1E05}".freeze => 'b'.freeze,

    # 1E06 LATIN CAPITAL LETTER B WITH LINE BELOW
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{1E06}".freeze => 'B'.freeze,

    # 1E07 LATIN SMALL LETTER B WITH LINE BELOW
    # ->   0062 LATIN SMALL LETTER B
    "\u{1E07}".freeze => 'b'.freeze,

    # 1E08 LATIN CAPITAL LETTER C WITH CEDILLA AND ACUTE
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{1E08}".freeze => 'C'.freeze,

    # 1E09 LATIN SMALL LETTER C WITH CEDILLA AND ACUTE
    # ->   0063 LATIN SMALL LETTER C
    "\u{1E09}".freeze => 'c'.freeze,

    # 1E0A LATIN CAPITAL LETTER D WITH DOT ABOVE
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{1E0A}".freeze => 'D'.freeze,

    # 1E0B LATIN SMALL LETTER D WITH DOT ABOVE
    # ->   0064 LATIN SMALL LETTER D
    "\u{1E0B}".freeze => 'd'.freeze,

    # 1E0C LATIN CAPITAL LETTER D WITH DOT BELOW
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{1E0C}".freeze => 'D'.freeze,

    # 1E0D LATIN SMALL LETTER D WITH DOT BELOW
    # ->   0064 LATIN SMALL LETTER D
    "\u{1E0D}".freeze => 'd'.freeze,

    # 1E0E LATIN CAPITAL LETTER D WITH LINE BELOW
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{1E0E}".freeze => 'D'.freeze,

    # 1E0F LATIN SMALL LETTER D WITH LINE BELOW
    # ->   0064 LATIN SMALL LETTER D
    "\u{1E0F}".freeze => 'd'.freeze,

    # 1E10 LATIN CAPITAL LETTER D WITH CEDILLA
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{1E10}".freeze => 'D'.freeze,

    # 1E11 LATIN SMALL LETTER D WITH CEDILLA
    # ->   0064 LATIN SMALL LETTER D
    "\u{1E11}".freeze => 'd'.freeze,

    # 1E12 LATIN CAPITAL LETTER D WITH CIRCUMFLEX BELOW
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{1E12}".freeze => 'D'.freeze,

    # 1E13 LATIN SMALL LETTER D WITH CIRCUMFLEX BELOW
    # ->   0064 LATIN SMALL LETTER D
    "\u{1E13}".freeze => 'd'.freeze,

    # 1E14 LATIN CAPITAL LETTER E WITH MACRON AND GRAVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1E14}".freeze => 'E'.freeze,

    # 1E15 LATIN SMALL LETTER E WITH MACRON AND GRAVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1E15}".freeze => 'e'.freeze,

    # 1E16 LATIN CAPITAL LETTER E WITH MACRON AND ACUTE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1E16}".freeze => 'E'.freeze,

    # 1E17 LATIN SMALL LETTER E WITH MACRON AND ACUTE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1E17}".freeze => 'e'.freeze,

    # 1E18 LATIN CAPITAL LETTER E WITH CIRCUMFLEX BELOW
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1E18}".freeze => 'E'.freeze,

    # 1E19 LATIN SMALL LETTER E WITH CIRCUMFLEX BELOW
    # ->   0065 LATIN SMALL LETTER E
    "\u{1E19}".freeze => 'e'.freeze,

    # 1E1A LATIN CAPITAL LETTER E WITH TILDE BELOW
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1E1A}".freeze => 'E'.freeze,

    # 1E1B LATIN SMALL LETTER E WITH TILDE BELOW
    # ->   0065 LATIN SMALL LETTER E
    "\u{1E1B}".freeze => 'e'.freeze,

    # 1E1C LATIN CAPITAL LETTER E WITH CEDILLA AND BREVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1E1C}".freeze => 'E'.freeze,

    # 1E1D LATIN SMALL LETTER E WITH CEDILLA AND BREVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1E1D}".freeze => 'e'.freeze,

    # 1E1E LATIN CAPITAL LETTER F WITH DOT ABOVE
    # ->   0046 LATIN CAPITAL LETTER F
    "\u{1E1E}".freeze => 'F'.freeze,

    # 1E1F LATIN SMALL LETTER F WITH DOT ABOVE
    # ->   0066 LATIN SMALL LETTER F
    "\u{1E1F}".freeze => 'f'.freeze,

    # 1E20 LATIN CAPITAL LETTER G WITH MACRON
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{1E20}".freeze => 'G'.freeze,

    # 1E21 LATIN SMALL LETTER G WITH MACRON
    # ->   0067 LATIN SMALL LETTER G
    "\u{1E21}".freeze => 'g'.freeze,

    # 1E22 LATIN CAPITAL LETTER H WITH DOT ABOVE
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{1E22}".freeze => 'H'.freeze,

    # 1E23 LATIN SMALL LETTER H WITH DOT ABOVE
    # ->   0068 LATIN SMALL LETTER H
    "\u{1E23}".freeze => 'h'.freeze,

    # 1E24 LATIN CAPITAL LETTER H WITH DOT BELOW
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{1E24}".freeze => 'H'.freeze,

    # 1E25 LATIN SMALL LETTER H WITH DOT BELOW
    # ->   0068 LATIN SMALL LETTER H
    "\u{1E25}".freeze => 'h'.freeze,

    # 1E26 LATIN CAPITAL LETTER H WITH DIAERESIS
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{1E26}".freeze => 'H'.freeze,

    # 1E27 LATIN SMALL LETTER H WITH DIAERESIS
    # ->   0068 LATIN SMALL LETTER H
    "\u{1E27}".freeze => 'h'.freeze,

    # 1E28 LATIN CAPITAL LETTER H WITH CEDILLA
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{1E28}".freeze => 'H'.freeze,

    # 1E29 LATIN SMALL LETTER H WITH CEDILLA
    # ->   0068 LATIN SMALL LETTER H
    "\u{1E29}".freeze => 'h'.freeze,

    # 1E2A LATIN CAPITAL LETTER H WITH BREVE BELOW
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{1E2A}".freeze => 'H'.freeze,

    # 1E2B LATIN SMALL LETTER H WITH BREVE BELOW
    # ->   0068 LATIN SMALL LETTER H
    "\u{1E2B}".freeze => 'h'.freeze,

    # 1E2C LATIN CAPITAL LETTER I WITH TILDE BELOW
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{1E2C}".freeze => 'I'.freeze,

    # 1E2D LATIN SMALL LETTER I WITH TILDE BELOW
    # ->   0069 LATIN SMALL LETTER I
    "\u{1E2D}".freeze => 'i'.freeze,

    # 1E2E LATIN CAPITAL LETTER I WITH DIAERESIS AND ACUTE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{1E2E}".freeze => 'I'.freeze,

    # 1E2F LATIN SMALL LETTER I WITH DIAERESIS AND ACUTE
    # ->   0069 LATIN SMALL LETTER I
    "\u{1E2F}".freeze => 'i'.freeze,

    # 1E30 LATIN CAPITAL LETTER K WITH ACUTE
    # ->   004B LATIN CAPITAL LETTER K
    "\u{1E30}".freeze => 'K'.freeze,

    # 1E31 LATIN SMALL LETTER K WITH ACUTE
    # ->   006B LATIN SMALL LETTER K
    "\u{1E31}".freeze => 'k'.freeze,

    # 1E32 LATIN CAPITAL LETTER K WITH DOT BELOW
    # ->   004B LATIN CAPITAL LETTER K
    "\u{1E32}".freeze => 'K'.freeze,

    # 1E33 LATIN SMALL LETTER K WITH DOT BELOW
    # ->   006B LATIN SMALL LETTER K
    "\u{1E33}".freeze => 'k'.freeze,

    # 1E34 LATIN CAPITAL LETTER K WITH LINE BELOW
    # ->   004B LATIN CAPITAL LETTER K
    "\u{1E34}".freeze => 'K'.freeze,

    # 1E35 LATIN SMALL LETTER K WITH LINE BELOW
    # ->   006B LATIN SMALL LETTER K
    "\u{1E35}".freeze => 'k'.freeze,

    # 1E36 LATIN CAPITAL LETTER L WITH DOT BELOW
    # ->   004C LATIN CAPITAL LETTER L
    "\u{1E36}".freeze => 'L'.freeze,

    # 1E37 LATIN SMALL LETTER L WITH DOT BELOW
    # ->   006C LATIN SMALL LETTER L
    "\u{1E37}".freeze => 'l'.freeze,

    # 1E38 LATIN CAPITAL LETTER L WITH DOT BELOW AND MACRON
    # ->   004C LATIN CAPITAL LETTER L
    "\u{1E38}".freeze => 'L'.freeze,

    # 1E39 LATIN SMALL LETTER L WITH DOT BELOW AND MACRON
    # ->   006C LATIN SMALL LETTER L
    "\u{1E39}".freeze => 'l'.freeze,

    # 1E3A LATIN CAPITAL LETTER L WITH LINE BELOW
    # ->   004C LATIN CAPITAL LETTER L
    "\u{1E3A}".freeze => 'L'.freeze,

    # 1E3B LATIN SMALL LETTER L WITH LINE BELOW
    # ->   006C LATIN SMALL LETTER L
    "\u{1E3B}".freeze => 'l'.freeze,

    # 1E3C LATIN CAPITAL LETTER L WITH CIRCUMFLEX BELOW
    # ->   004C LATIN CAPITAL LETTER L
    "\u{1E3C}".freeze => 'L'.freeze,

    # 1E3D LATIN SMALL LETTER L WITH CIRCUMFLEX BELOW
    # ->   006C LATIN SMALL LETTER L
    "\u{1E3D}".freeze => 'l'.freeze,

    # 1E3E LATIN CAPITAL LETTER M WITH ACUTE
    # ->   004D LATIN CAPITAL LETTER M
    "\u{1E3E}".freeze => 'M'.freeze,

    # 1E3F LATIN SMALL LETTER M WITH ACUTE
    # ->   006D LATIN SMALL LETTER M
    "\u{1E3F}".freeze => 'm'.freeze,

    # 1E40 LATIN CAPITAL LETTER M WITH DOT ABOVE
    # ->   004D LATIN CAPITAL LETTER M
    "\u{1E40}".freeze => 'M'.freeze,

    # 1E41 LATIN SMALL LETTER M WITH DOT ABOVE
    # ->   006D LATIN SMALL LETTER M
    "\u{1E41}".freeze => 'm'.freeze,

    # 1E42 LATIN CAPITAL LETTER M WITH DOT BELOW
    # ->   004D LATIN CAPITAL LETTER M
    "\u{1E42}".freeze => 'M'.freeze,

    # 1E43 LATIN SMALL LETTER M WITH DOT BELOW
    # ->   006D LATIN SMALL LETTER M
    "\u{1E43}".freeze => 'm'.freeze,

    # 1E44 LATIN CAPITAL LETTER N WITH DOT ABOVE
    # ->   004E LATIN CAPITAL LETTER N
    "\u{1E44}".freeze => 'N'.freeze,

    # 1E45 LATIN SMALL LETTER N WITH DOT ABOVE
    # ->   006E LATIN SMALL LETTER N
    "\u{1E45}".freeze => 'n'.freeze,

    # 1E46 LATIN CAPITAL LETTER N WITH DOT BELOW
    # ->   004E LATIN CAPITAL LETTER N
    "\u{1E46}".freeze => 'N'.freeze,

    # 1E47 LATIN SMALL LETTER N WITH DOT BELOW
    # ->   006E LATIN SMALL LETTER N
    "\u{1E47}".freeze => 'n'.freeze,

    # 1E48 LATIN CAPITAL LETTER N WITH LINE BELOW
    # ->   004E LATIN CAPITAL LETTER N
    "\u{1E48}".freeze => 'N'.freeze,

    # 1E49 LATIN SMALL LETTER N WITH LINE BELOW
    # ->   006E LATIN SMALL LETTER N
    "\u{1E49}".freeze => 'n'.freeze,

    # 1E4A LATIN CAPITAL LETTER N WITH CIRCUMFLEX BELOW
    # ->   004E LATIN CAPITAL LETTER N
    "\u{1E4A}".freeze => 'N'.freeze,

    # 1E4B LATIN SMALL LETTER N WITH CIRCUMFLEX BELOW
    # ->   006E LATIN SMALL LETTER N
    "\u{1E4B}".freeze => 'n'.freeze,

    # 1E4C LATIN CAPITAL LETTER O WITH TILDE AND ACUTE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1E4C}".freeze => 'O'.freeze,

    # 1E4D LATIN SMALL LETTER O WITH TILDE AND ACUTE
    # ->   006F LATIN SMALL LETTER O
    "\u{1E4D}".freeze => 'o'.freeze,

    # 1E4E LATIN CAPITAL LETTER O WITH TILDE AND DIAERESIS
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1E4E}".freeze => 'O'.freeze,

    # 1E4F LATIN SMALL LETTER O WITH TILDE AND DIAERESIS
    # ->   006F LATIN SMALL LETTER O
    "\u{1E4F}".freeze => 'o'.freeze,

    # 1E50 LATIN CAPITAL LETTER O WITH MACRON AND GRAVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1E50}".freeze => 'O'.freeze,

    # 1E51 LATIN SMALL LETTER O WITH MACRON AND GRAVE
    # ->   006F LATIN SMALL LETTER O
    "\u{1E51}".freeze => 'o'.freeze,

    # 1E52 LATIN CAPITAL LETTER O WITH MACRON AND ACUTE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1E52}".freeze => 'O'.freeze,

    # 1E53 LATIN SMALL LETTER O WITH MACRON AND ACUTE
    # ->   006F LATIN SMALL LETTER O
    "\u{1E53}".freeze => 'o'.freeze,

    # 1E54 LATIN CAPITAL LETTER P WITH ACUTE
    # ->   0050 LATIN CAPITAL LETTER P
    "\u{1E54}".freeze => 'P'.freeze,

    # 1E55 LATIN SMALL LETTER P WITH ACUTE
    # ->   0070 LATIN SMALL LETTER P
    "\u{1E55}".freeze => 'p'.freeze,

    # 1E56 LATIN CAPITAL LETTER P WITH DOT ABOVE
    # ->   0050 LATIN CAPITAL LETTER P
    "\u{1E56}".freeze => 'P'.freeze,

    # 1E57 LATIN SMALL LETTER P WITH DOT ABOVE
    # ->   0070 LATIN SMALL LETTER P
    "\u{1E57}".freeze => 'p'.freeze,

    # 1E58 LATIN CAPITAL LETTER R WITH DOT ABOVE
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{1E58}".freeze => 'R'.freeze,

    # 1E59 LATIN SMALL LETTER R WITH DOT ABOVE
    # ->   0072 LATIN SMALL LETTER R
    "\u{1E59}".freeze => 'r'.freeze,

    # 1E5A LATIN CAPITAL LETTER R WITH DOT BELOW
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{1E5A}".freeze => 'R'.freeze,

    # 1E5B LATIN SMALL LETTER R WITH DOT BELOW
    # ->   0072 LATIN SMALL LETTER R
    "\u{1E5B}".freeze => 'r'.freeze,

    # 1E5C LATIN CAPITAL LETTER R WITH DOT BELOW AND MACRON
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{1E5C}".freeze => 'R'.freeze,

    # 1E5D LATIN SMALL LETTER R WITH DOT BELOW AND MACRON
    # ->   0072 LATIN SMALL LETTER R
    "\u{1E5D}".freeze => 'r'.freeze,

    # 1E5E LATIN CAPITAL LETTER R WITH LINE BELOW
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{1E5E}".freeze => 'R'.freeze,

    # 1E5F LATIN SMALL LETTER R WITH LINE BELOW
    # ->   0072 LATIN SMALL LETTER R
    "\u{1E5F}".freeze => 'r'.freeze,

    # 1E60 LATIN CAPITAL LETTER S WITH DOT ABOVE
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{1E60}".freeze => 'S'.freeze,

    # 1E61 LATIN SMALL LETTER S WITH DOT ABOVE
    # ->   0073 LATIN SMALL LETTER S
    "\u{1E61}".freeze => 's'.freeze,

    # 1E62 LATIN CAPITAL LETTER S WITH DOT BELOW
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{1E62}".freeze => 'S'.freeze,

    # 1E63 LATIN SMALL LETTER S WITH DOT BELOW
    # ->   0073 LATIN SMALL LETTER S
    "\u{1E63}".freeze => 's'.freeze,

    # 1E64 LATIN CAPITAL LETTER S WITH ACUTE AND DOT ABOVE
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{1E64}".freeze => 'S'.freeze,

    # 1E65 LATIN SMALL LETTER S WITH ACUTE AND DOT ABOVE
    # ->   0073 LATIN SMALL LETTER S
    "\u{1E65}".freeze => 's'.freeze,

    # 1E66 LATIN CAPITAL LETTER S WITH CARON AND DOT ABOVE
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{1E66}".freeze => 'S'.freeze,

    # 1E67 LATIN SMALL LETTER S WITH CARON AND DOT ABOVE
    # ->   0073 LATIN SMALL LETTER S
    "\u{1E67}".freeze => 's'.freeze,

    # 1E68 LATIN CAPITAL LETTER S WITH DOT BELOW AND DOT ABOVE
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{1E68}".freeze => 'S'.freeze,

    # 1E69 LATIN SMALL LETTER S WITH DOT BELOW AND DOT ABOVE
    # ->   0073 LATIN SMALL LETTER S
    "\u{1E69}".freeze => 's'.freeze,

    # 1E6A LATIN CAPITAL LETTER T WITH DOT ABOVE
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{1E6A}".freeze => 'T'.freeze,

    # 1E6B LATIN SMALL LETTER T WITH DOT ABOVE
    # ->   0074 LATIN SMALL LETTER T
    "\u{1E6B}".freeze => 't'.freeze,

    # 1E6C LATIN CAPITAL LETTER T WITH DOT BELOW
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{1E6C}".freeze => 'T'.freeze,

    # 1E6D LATIN SMALL LETTER T WITH DOT BELOW
    # ->   0074 LATIN SMALL LETTER T
    "\u{1E6D}".freeze => 't'.freeze,

    # 1E6E LATIN CAPITAL LETTER T WITH LINE BELOW
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{1E6E}".freeze => 'T'.freeze,

    # 1E6F LATIN SMALL LETTER T WITH LINE BELOW
    # ->   0074 LATIN SMALL LETTER T
    "\u{1E6F}".freeze => 't'.freeze,

    # 1E70 LATIN CAPITAL LETTER T WITH CIRCUMFLEX BELOW
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{1E70}".freeze => 'T'.freeze,

    # 1E71 LATIN SMALL LETTER T WITH CIRCUMFLEX BELOW
    # ->   0074 LATIN SMALL LETTER T
    "\u{1E71}".freeze => 't'.freeze,

    # 1E72 LATIN CAPITAL LETTER U WITH DIAERESIS BELOW
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1E72}".freeze => 'U'.freeze,

    # 1E73 LATIN SMALL LETTER U WITH DIAERESIS BELOW
    # ->   0075 LATIN SMALL LETTER U
    "\u{1E73}".freeze => 'u'.freeze,

    # 1E74 LATIN CAPITAL LETTER U WITH TILDE BELOW
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1E74}".freeze => 'U'.freeze,

    # 1E75 LATIN SMALL LETTER U WITH TILDE BELOW
    # ->   0075 LATIN SMALL LETTER U
    "\u{1E75}".freeze => 'u'.freeze,

    # 1E76 LATIN CAPITAL LETTER U WITH CIRCUMFLEX BELOW
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1E76}".freeze => 'U'.freeze,

    # 1E77 LATIN SMALL LETTER U WITH CIRCUMFLEX BELOW
    # ->   0075 LATIN SMALL LETTER U
    "\u{1E77}".freeze => 'u'.freeze,

    # 1E78 LATIN CAPITAL LETTER U WITH TILDE AND ACUTE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1E78}".freeze => 'U'.freeze,

    # 1E79 LATIN SMALL LETTER U WITH TILDE AND ACUTE
    # ->   0075 LATIN SMALL LETTER U
    "\u{1E79}".freeze => 'u'.freeze,

    # 1E7A LATIN CAPITAL LETTER U WITH MACRON AND DIAERESIS
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1E7A}".freeze => 'U'.freeze,

    # 1E7B LATIN SMALL LETTER U WITH MACRON AND DIAERESIS
    # ->   0075 LATIN SMALL LETTER U
    "\u{1E7B}".freeze => 'u'.freeze,

    # 1E7C LATIN CAPITAL LETTER V WITH TILDE
    # ->   0056 LATIN CAPITAL LETTER V
    "\u{1E7C}".freeze => 'V'.freeze,

    # 1E7D LATIN SMALL LETTER V WITH TILDE
    # ->   0076 LATIN SMALL LETTER V
    "\u{1E7D}".freeze => 'v'.freeze,

    # 1E7E LATIN CAPITAL LETTER V WITH DOT BELOW
    # ->   0056 LATIN CAPITAL LETTER V
    "\u{1E7E}".freeze => 'V'.freeze,

    # 1E7F LATIN SMALL LETTER V WITH DOT BELOW
    # ->   0076 LATIN SMALL LETTER V
    "\u{1E7F}".freeze => 'v'.freeze,

    # 1E80 LATIN CAPITAL LETTER W WITH GRAVE
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{1E80}".freeze => 'W'.freeze,

    # 1E81 LATIN SMALL LETTER W WITH GRAVE
    # ->   0077 LATIN SMALL LETTER W
    "\u{1E81}".freeze => 'w'.freeze,

    # 1E82 LATIN CAPITAL LETTER W WITH ACUTE
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{1E82}".freeze => 'W'.freeze,

    # 1E83 LATIN SMALL LETTER W WITH ACUTE
    # ->   0077 LATIN SMALL LETTER W
    "\u{1E83}".freeze => 'w'.freeze,

    # 1E84 LATIN CAPITAL LETTER W WITH DIAERESIS
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{1E84}".freeze => 'W'.freeze,

    # 1E85 LATIN SMALL LETTER W WITH DIAERESIS
    # ->   0077 LATIN SMALL LETTER W
    "\u{1E85}".freeze => 'w'.freeze,

    # 1E86 LATIN CAPITAL LETTER W WITH DOT ABOVE
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{1E86}".freeze => 'W'.freeze,

    # 1E87 LATIN SMALL LETTER W WITH DOT ABOVE
    # ->   0077 LATIN SMALL LETTER W
    "\u{1E87}".freeze => 'w'.freeze,

    # 1E88 LATIN CAPITAL LETTER W WITH DOT BELOW
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{1E88}".freeze => 'W'.freeze,

    # 1E89 LATIN SMALL LETTER W WITH DOT BELOW
    # ->   0077 LATIN SMALL LETTER W
    "\u{1E89}".freeze => 'w'.freeze,

    # 1E8A LATIN CAPITAL LETTER X WITH DOT ABOVE
    # ->   0058 LATIN CAPITAL LETTER X
    "\u{1E8A}".freeze => 'X'.freeze,

    # 1E8B LATIN SMALL LETTER X WITH DOT ABOVE
    # ->   0078 LATIN SMALL LETTER X
    "\u{1E8B}".freeze => 'x'.freeze,

    # 1E8C LATIN CAPITAL LETTER X WITH DIAERESIS
    # ->   0058 LATIN CAPITAL LETTER X
    "\u{1E8C}".freeze => 'X'.freeze,

    # 1E8D LATIN SMALL LETTER X WITH DIAERESIS
    # ->   0078 LATIN SMALL LETTER X
    "\u{1E8D}".freeze => 'x'.freeze,

    # 1E8E LATIN CAPITAL LETTER Y WITH DOT ABOVE
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{1E8E}".freeze => 'Y'.freeze,

    # 1E8F LATIN SMALL LETTER Y WITH DOT ABOVE
    # ->   0079 LATIN SMALL LETTER Y
    "\u{1E8F}".freeze => 'y'.freeze,

    # 1E90 LATIN CAPITAL LETTER Z WITH CIRCUMFLEX
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{1E90}".freeze => 'Z'.freeze,

    # 1E91 LATIN SMALL LETTER Z WITH CIRCUMFLEX
    # ->   007A LATIN SMALL LETTER Z
    "\u{1E91}".freeze => 'z'.freeze,

    # 1E92 LATIN CAPITAL LETTER Z WITH DOT BELOW
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{1E92}".freeze => 'Z'.freeze,

    # 1E93 LATIN SMALL LETTER Z WITH DOT BELOW
    # ->   007A LATIN SMALL LETTER Z
    "\u{1E93}".freeze => 'z'.freeze,

    # 1E94 LATIN CAPITAL LETTER Z WITH LINE BELOW
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{1E94}".freeze => 'Z'.freeze,

    # 1E95 LATIN SMALL LETTER Z WITH LINE BELOW
    # ->   007A LATIN SMALL LETTER Z
    "\u{1E95}".freeze => 'z'.freeze,

    # 1E96 LATIN SMALL LETTER H WITH LINE BELOW
    # ->   0068 LATIN SMALL LETTER H
    "\u{1E96}".freeze => 'h'.freeze,

    # 1E97 LATIN SMALL LETTER T WITH DIAERESIS
    # ->   0074 LATIN SMALL LETTER T
    "\u{1E97}".freeze => 't'.freeze,

    # 1E98 LATIN SMALL LETTER W WITH RING ABOVE
    # ->   0077 LATIN SMALL LETTER W
    "\u{1E98}".freeze => 'w'.freeze,

    # 1E99 LATIN SMALL LETTER Y WITH RING ABOVE
    # ->   0079 LATIN SMALL LETTER Y
    "\u{1E99}".freeze => 'y'.freeze,

    # 1E9A LATIN SMALL LETTER A WITH RIGHT HALF RING
    # ->   0061 LATIN SMALL LETTER A
    #    + 02BE MODIFIER LETTER RIGHT HALF RING
    "\u{1E9A}".freeze => "a\u{02BE}".freeze,

    # 1E9B LATIN SMALL LETTER LONG S WITH DOT ABOVE
    # ->   0073 LATIN SMALL LETTER S
    "\u{1E9B}".freeze => 's'.freeze,

    # 1EA0 LATIN CAPITAL LETTER A WITH DOT BELOW
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EA0}".freeze => 'A'.freeze,

    # 1EA1 LATIN SMALL LETTER A WITH DOT BELOW
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EA1}".freeze => 'a'.freeze,

    # 1EA2 LATIN CAPITAL LETTER A WITH HOOK ABOVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EA2}".freeze => 'A'.freeze,

    # 1EA3 LATIN SMALL LETTER A WITH HOOK ABOVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EA3}".freeze => 'a'.freeze,

    # 1EA4 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND ACUTE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EA4}".freeze => 'A'.freeze,

    # 1EA5 LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EA5}".freeze => 'a'.freeze,

    # 1EA6 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND GRAVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EA6}".freeze => 'A'.freeze,

    # 1EA7 LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EA7}".freeze => 'a'.freeze,

    # 1EA8 LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EA8}".freeze => 'A'.freeze,

    # 1EA9 LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EA9}".freeze => 'a'.freeze,

    # 1EAA LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND TILDE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EAA}".freeze => 'A'.freeze,

    # 1EAB LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EAB}".freeze => 'a'.freeze,

    # 1EAC LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND DOT BELOW
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EAC}".freeze => 'A'.freeze,

    # 1EAD LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EAD}".freeze => 'a'.freeze,

    # 1EAE LATIN CAPITAL LETTER A WITH BREVE AND ACUTE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EAE}".freeze => 'A'.freeze,

    # 1EAF LATIN SMALL LETTER A WITH BREVE AND ACUTE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EAF}".freeze => 'a'.freeze,

    # 1EB0 LATIN CAPITAL LETTER A WITH BREVE AND GRAVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EB0}".freeze => 'A'.freeze,

    # 1EB1 LATIN SMALL LETTER A WITH BREVE AND GRAVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EB1}".freeze => 'a'.freeze,

    # 1EB2 LATIN CAPITAL LETTER A WITH BREVE AND HOOK ABOVE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EB2}".freeze => 'A'.freeze,

    # 1EB3 LATIN SMALL LETTER A WITH BREVE AND HOOK ABOVE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EB3}".freeze => 'a'.freeze,

    # 1EB4 LATIN CAPITAL LETTER A WITH BREVE AND TILDE
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EB4}".freeze => 'A'.freeze,

    # 1EB5 LATIN SMALL LETTER A WITH BREVE AND TILDE
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EB5}".freeze => 'a'.freeze,

    # 1EB6 LATIN CAPITAL LETTER A WITH BREVE AND DOT BELOW
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{1EB6}".freeze => 'A'.freeze,

    # 1EB7 LATIN SMALL LETTER A WITH BREVE AND DOT BELOW
    # ->   0061 LATIN SMALL LETTER A
    "\u{1EB7}".freeze => 'a'.freeze,

    # 1EB8 LATIN CAPITAL LETTER E WITH DOT BELOW
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EB8}".freeze => 'E'.freeze,

    # 1EB9 LATIN SMALL LETTER E WITH DOT BELOW
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EB9}".freeze => 'e'.freeze,

    # 1EBA LATIN CAPITAL LETTER E WITH HOOK ABOVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EBA}".freeze => 'E'.freeze,

    # 1EBB LATIN SMALL LETTER E WITH HOOK ABOVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EBB}".freeze => 'e'.freeze,

    # 1EBC LATIN CAPITAL LETTER E WITH TILDE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EBC}".freeze => 'E'.freeze,

    # 1EBD LATIN SMALL LETTER E WITH TILDE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EBD}".freeze => 'e'.freeze,

    # 1EBE LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EBE}".freeze => 'E'.freeze,

    # 1EBF LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EBF}".freeze => 'e'.freeze,

    # 1EC0 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EC0}".freeze => 'E'.freeze,

    # 1EC1 LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EC1}".freeze => 'e'.freeze,

    # 1EC2 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EC2}".freeze => 'E'.freeze,

    # 1EC3 LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EC3}".freeze => 'e'.freeze,

    # 1EC4 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EC4}".freeze => 'E'.freeze,

    # 1EC5 LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EC5}".freeze => 'e'.freeze,

    # 1EC6 LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND DOT BELOW
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{1EC6}".freeze => 'E'.freeze,

    # 1EC7 LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW
    # ->   0065 LATIN SMALL LETTER E
    "\u{1EC7}".freeze => 'e'.freeze,

    # 1EC8 LATIN CAPITAL LETTER I WITH HOOK ABOVE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{1EC8}".freeze => 'I'.freeze,

    # 1EC9 LATIN SMALL LETTER I WITH HOOK ABOVE
    # ->   0069 LATIN SMALL LETTER I
    "\u{1EC9}".freeze => 'i'.freeze,

    # 1ECA LATIN CAPITAL LETTER I WITH DOT BELOW
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{1ECA}".freeze => 'I'.freeze,

    # 1ECB LATIN SMALL LETTER I WITH DOT BELOW
    # ->   0069 LATIN SMALL LETTER I
    "\u{1ECB}".freeze => 'i'.freeze,

    # 1ECC LATIN CAPITAL LETTER O WITH DOT BELOW
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1ECC}".freeze => 'O'.freeze,

    # 1ECD LATIN SMALL LETTER O WITH DOT BELOW
    # ->   006F LATIN SMALL LETTER O
    "\u{1ECD}".freeze => 'o'.freeze,

    # 1ECE LATIN CAPITAL LETTER O WITH HOOK ABOVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1ECE}".freeze => 'O'.freeze,

    # 1ECF LATIN SMALL LETTER O WITH HOOK ABOVE
    # ->   006F LATIN SMALL LETTER O
    "\u{1ECF}".freeze => 'o'.freeze,

    # 1ED0 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND ACUTE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1ED0}".freeze => 'O'.freeze,

    # 1ED1 LATIN SMALL LETTER O WITH CIRCUMFLEX AND ACUTE
    # ->   006F LATIN SMALL LETTER O
    "\u{1ED1}".freeze => 'o'.freeze,

    # 1ED2 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND GRAVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1ED2}".freeze => 'O'.freeze,

    # 1ED3 LATIN SMALL LETTER O WITH CIRCUMFLEX AND GRAVE
    # ->   006F LATIN SMALL LETTER O
    "\u{1ED3}".freeze => 'o'.freeze,

    # 1ED4 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1ED4}".freeze => 'O'.freeze,

    # 1ED5 LATIN SMALL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE
    # ->   006F LATIN SMALL LETTER O
    "\u{1ED5}".freeze => 'o'.freeze,

    # 1ED6 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND TILDE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1ED6}".freeze => 'O'.freeze,

    # 1ED7 LATIN SMALL LETTER O WITH CIRCUMFLEX AND TILDE
    # ->   006F LATIN SMALL LETTER O
    "\u{1ED7}".freeze => 'o'.freeze,

    # 1ED8 LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND DOT BELOW
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1ED8}".freeze => 'O'.freeze,

    # 1ED9 LATIN SMALL LETTER O WITH CIRCUMFLEX AND DOT BELOW
    # ->   006F LATIN SMALL LETTER O
    "\u{1ED9}".freeze => 'o'.freeze,

    # 1EDA LATIN CAPITAL LETTER O WITH HORN AND ACUTE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1EDA}".freeze => 'O'.freeze,

    # 1EDB LATIN SMALL LETTER O WITH HORN AND ACUTE
    # ->   006F LATIN SMALL LETTER O
    "\u{1EDB}".freeze => 'o'.freeze,

    # 1EDC LATIN CAPITAL LETTER O WITH HORN AND GRAVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1EDC}".freeze => 'O'.freeze,

    # 1EDD LATIN SMALL LETTER O WITH HORN AND GRAVE
    # ->   006F LATIN SMALL LETTER O
    "\u{1EDD}".freeze => 'o'.freeze,

    # 1EDE LATIN CAPITAL LETTER O WITH HORN AND HOOK ABOVE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1EDE}".freeze => 'O'.freeze,

    # 1EDF LATIN SMALL LETTER O WITH HORN AND HOOK ABOVE
    # ->   006F LATIN SMALL LETTER O
    "\u{1EDF}".freeze => 'o'.freeze,

    # 1EE0 LATIN CAPITAL LETTER O WITH HORN AND TILDE
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1EE0}".freeze => 'O'.freeze,

    # 1EE1 LATIN SMALL LETTER O WITH HORN AND TILDE
    # ->   006F LATIN SMALL LETTER O
    "\u{1EE1}".freeze => 'o'.freeze,

    # 1EE2 LATIN CAPITAL LETTER O WITH HORN AND DOT BELOW
    # ->   004F LATIN CAPITAL LETTER O
    "\u{1EE2}".freeze => 'O'.freeze,

    # 1EE3 LATIN SMALL LETTER O WITH HORN AND DOT BELOW
    # ->   006F LATIN SMALL LETTER O
    "\u{1EE3}".freeze => 'o'.freeze,

    # 1EE4 LATIN CAPITAL LETTER U WITH DOT BELOW
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1EE4}".freeze => 'U'.freeze,

    # 1EE5 LATIN SMALL LETTER U WITH DOT BELOW
    # ->   0075 LATIN SMALL LETTER U
    "\u{1EE5}".freeze => 'u'.freeze,

    # 1EE6 LATIN CAPITAL LETTER U WITH HOOK ABOVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1EE6}".freeze => 'U'.freeze,

    # 1EE7 LATIN SMALL LETTER U WITH HOOK ABOVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{1EE7}".freeze => 'u'.freeze,

    # 1EE8 LATIN CAPITAL LETTER U WITH HORN AND ACUTE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1EE8}".freeze => 'U'.freeze,

    # 1EE9 LATIN SMALL LETTER U WITH HORN AND ACUTE
    # ->   0075 LATIN SMALL LETTER U
    "\u{1EE9}".freeze => 'u'.freeze,

    # 1EEA LATIN CAPITAL LETTER U WITH HORN AND GRAVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1EEA}".freeze => 'U'.freeze,

    # 1EEB LATIN SMALL LETTER U WITH HORN AND GRAVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{1EEB}".freeze => 'u'.freeze,

    # 1EEC LATIN CAPITAL LETTER U WITH HORN AND HOOK ABOVE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1EEC}".freeze => 'U'.freeze,

    # 1EED LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE
    # ->   0075 LATIN SMALL LETTER U
    "\u{1EED}".freeze => 'u'.freeze,

    # 1EEE LATIN CAPITAL LETTER U WITH HORN AND TILDE
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1EEE}".freeze => 'U'.freeze,

    # 1EEF LATIN SMALL LETTER U WITH HORN AND TILDE
    # ->   0075 LATIN SMALL LETTER U
    "\u{1EEF}".freeze => 'u'.freeze,

    # 1EF0 LATIN CAPITAL LETTER U WITH HORN AND DOT BELOW
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{1EF0}".freeze => 'U'.freeze,

    # 1EF1 LATIN SMALL LETTER U WITH HORN AND DOT BELOW
    # ->   0075 LATIN SMALL LETTER U
    "\u{1EF1}".freeze => 'u'.freeze,

    # 1EF2 LATIN CAPITAL LETTER Y WITH GRAVE
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{1EF2}".freeze => 'Y'.freeze,

    # 1EF3 LATIN SMALL LETTER Y WITH GRAVE
    # ->   0079 LATIN SMALL LETTER Y
    "\u{1EF3}".freeze => 'y'.freeze,

    # 1EF4 LATIN CAPITAL LETTER Y WITH DOT BELOW
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{1EF4}".freeze => 'Y'.freeze,

    # 1EF5 LATIN SMALL LETTER Y WITH DOT BELOW
    # ->   0079 LATIN SMALL LETTER Y
    "\u{1EF5}".freeze => 'y'.freeze,

    # 1EF6 LATIN CAPITAL LETTER Y WITH HOOK ABOVE
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{1EF6}".freeze => 'Y'.freeze,

    # 1EF7 LATIN SMALL LETTER Y WITH HOOK ABOVE
    # ->   0079 LATIN SMALL LETTER Y
    "\u{1EF7}".freeze => 'y'.freeze,

    # 1EF8 LATIN CAPITAL LETTER Y WITH TILDE
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{1EF8}".freeze => 'Y'.freeze,

    # 1EF9 LATIN SMALL LETTER Y WITH TILDE
    # ->   0079 LATIN SMALL LETTER Y
    "\u{1EF9}".freeze => 'y'.freeze,

    # 1F00 GREEK SMALL LETTER ALPHA WITH PSILI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F00}".freeze => "\u{03B1}".freeze,

    # 1F01 GREEK SMALL LETTER ALPHA WITH DASIA
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F01}".freeze => "\u{03B1}".freeze,

    # 1F02 GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F02}".freeze => "\u{03B1}".freeze,

    # 1F03 GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F03}".freeze => "\u{03B1}".freeze,

    # 1F04 GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F04}".freeze => "\u{03B1}".freeze,

    # 1F05 GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F05}".freeze => "\u{03B1}".freeze,

    # 1F06 GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F06}".freeze => "\u{03B1}".freeze,

    # 1F07 GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F07}".freeze => "\u{03B1}".freeze,

    # 1F08 GREEK CAPITAL LETTER ALPHA WITH PSILI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F08}".freeze => "\u{0391}".freeze,

    # 1F09 GREEK CAPITAL LETTER ALPHA WITH DASIA
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F09}".freeze => "\u{0391}".freeze,

    # 1F0A GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F0A}".freeze => "\u{0391}".freeze,

    # 1F0B GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F0B}".freeze => "\u{0391}".freeze,

    # 1F0C GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F0C}".freeze => "\u{0391}".freeze,

    # 1F0D GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F0D}".freeze => "\u{0391}".freeze,

    # 1F0E GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F0E}".freeze => "\u{0391}".freeze,

    # 1F0F GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F0F}".freeze => "\u{0391}".freeze,

    # 1F10 GREEK SMALL LETTER EPSILON WITH PSILI
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F10}".freeze => "\u{03B5}".freeze,

    # 1F11 GREEK SMALL LETTER EPSILON WITH DASIA
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F11}".freeze => "\u{03B5}".freeze,

    # 1F12 GREEK SMALL LETTER EPSILON WITH PSILI AND VARIA
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F12}".freeze => "\u{03B5}".freeze,

    # 1F13 GREEK SMALL LETTER EPSILON WITH DASIA AND VARIA
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F13}".freeze => "\u{03B5}".freeze,

    # 1F14 GREEK SMALL LETTER EPSILON WITH PSILI AND OXIA
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F14}".freeze => "\u{03B5}".freeze,

    # 1F15 GREEK SMALL LETTER EPSILON WITH DASIA AND OXIA
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F15}".freeze => "\u{03B5}".freeze,

    # 1F18 GREEK CAPITAL LETTER EPSILON WITH PSILI
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1F18}".freeze => "\u{0395}".freeze,

    # 1F19 GREEK CAPITAL LETTER EPSILON WITH DASIA
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1F19}".freeze => "\u{0395}".freeze,

    # 1F1A GREEK CAPITAL LETTER EPSILON WITH PSILI AND VARIA
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1F1A}".freeze => "\u{0395}".freeze,

    # 1F1B GREEK CAPITAL LETTER EPSILON WITH DASIA AND VARIA
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1F1B}".freeze => "\u{0395}".freeze,

    # 1F1C GREEK CAPITAL LETTER EPSILON WITH PSILI AND OXIA
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1F1C}".freeze => "\u{0395}".freeze,

    # 1F1D GREEK CAPITAL LETTER EPSILON WITH DASIA AND OXIA
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1F1D}".freeze => "\u{0395}".freeze,

    # 1F20 GREEK SMALL LETTER ETA WITH PSILI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F20}".freeze => "\u{03B7}".freeze,

    # 1F21 GREEK SMALL LETTER ETA WITH DASIA
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F21}".freeze => "\u{03B7}".freeze,

    # 1F22 GREEK SMALL LETTER ETA WITH PSILI AND VARIA
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F22}".freeze => "\u{03B7}".freeze,

    # 1F23 GREEK SMALL LETTER ETA WITH DASIA AND VARIA
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F23}".freeze => "\u{03B7}".freeze,

    # 1F24 GREEK SMALL LETTER ETA WITH PSILI AND OXIA
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F24}".freeze => "\u{03B7}".freeze,

    # 1F25 GREEK SMALL LETTER ETA WITH DASIA AND OXIA
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F25}".freeze => "\u{03B7}".freeze,

    # 1F26 GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F26}".freeze => "\u{03B7}".freeze,

    # 1F27 GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F27}".freeze => "\u{03B7}".freeze,

    # 1F28 GREEK CAPITAL LETTER ETA WITH PSILI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F28}".freeze => "\u{0397}".freeze,

    # 1F29 GREEK CAPITAL LETTER ETA WITH DASIA
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F29}".freeze => "\u{0397}".freeze,

    # 1F2A GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F2A}".freeze => "\u{0397}".freeze,

    # 1F2B GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F2B}".freeze => "\u{0397}".freeze,

    # 1F2C GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F2C}".freeze => "\u{0397}".freeze,

    # 1F2D GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F2D}".freeze => "\u{0397}".freeze,

    # 1F2E GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F2E}".freeze => "\u{0397}".freeze,

    # 1F2F GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F2F}".freeze => "\u{0397}".freeze,

    # 1F30 GREEK SMALL LETTER IOTA WITH PSILI
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F30}".freeze => "\u{03B9}".freeze,

    # 1F31 GREEK SMALL LETTER IOTA WITH DASIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F31}".freeze => "\u{03B9}".freeze,

    # 1F32 GREEK SMALL LETTER IOTA WITH PSILI AND VARIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F32}".freeze => "\u{03B9}".freeze,

    # 1F33 GREEK SMALL LETTER IOTA WITH DASIA AND VARIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F33}".freeze => "\u{03B9}".freeze,

    # 1F34 GREEK SMALL LETTER IOTA WITH PSILI AND OXIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F34}".freeze => "\u{03B9}".freeze,

    # 1F35 GREEK SMALL LETTER IOTA WITH DASIA AND OXIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F35}".freeze => "\u{03B9}".freeze,

    # 1F36 GREEK SMALL LETTER IOTA WITH PSILI AND PERISPOMENI
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F36}".freeze => "\u{03B9}".freeze,

    # 1F37 GREEK SMALL LETTER IOTA WITH DASIA AND PERISPOMENI
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F37}".freeze => "\u{03B9}".freeze,

    # 1F38 GREEK CAPITAL LETTER IOTA WITH PSILI
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F38}".freeze => "\u{0399}".freeze,

    # 1F39 GREEK CAPITAL LETTER IOTA WITH DASIA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F39}".freeze => "\u{0399}".freeze,

    # 1F3A GREEK CAPITAL LETTER IOTA WITH PSILI AND VARIA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F3A}".freeze => "\u{0399}".freeze,

    # 1F3B GREEK CAPITAL LETTER IOTA WITH DASIA AND VARIA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F3B}".freeze => "\u{0399}".freeze,

    # 1F3C GREEK CAPITAL LETTER IOTA WITH PSILI AND OXIA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F3C}".freeze => "\u{0399}".freeze,

    # 1F3D GREEK CAPITAL LETTER IOTA WITH DASIA AND OXIA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F3D}".freeze => "\u{0399}".freeze,

    # 1F3E GREEK CAPITAL LETTER IOTA WITH PSILI AND PERISPOMENI
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F3E}".freeze => "\u{0399}".freeze,

    # 1F3F GREEK CAPITAL LETTER IOTA WITH DASIA AND PERISPOMENI
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1F3F}".freeze => "\u{0399}".freeze,

    # 1F40 GREEK SMALL LETTER OMICRON WITH PSILI
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F40}".freeze => "\u{03BF}".freeze,

    # 1F41 GREEK SMALL LETTER OMICRON WITH DASIA
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F41}".freeze => "\u{03BF}".freeze,

    # 1F42 GREEK SMALL LETTER OMICRON WITH PSILI AND VARIA
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F42}".freeze => "\u{03BF}".freeze,

    # 1F43 GREEK SMALL LETTER OMICRON WITH DASIA AND VARIA
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F43}".freeze => "\u{03BF}".freeze,

    # 1F44 GREEK SMALL LETTER OMICRON WITH PSILI AND OXIA
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F44}".freeze => "\u{03BF}".freeze,

    # 1F45 GREEK SMALL LETTER OMICRON WITH DASIA AND OXIA
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F45}".freeze => "\u{03BF}".freeze,

    # 1F48 GREEK CAPITAL LETTER OMICRON WITH PSILI
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1F48}".freeze => "\u{039F}".freeze,

    # 1F49 GREEK CAPITAL LETTER OMICRON WITH DASIA
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1F49}".freeze => "\u{039F}".freeze,

    # 1F4A GREEK CAPITAL LETTER OMICRON WITH PSILI AND VARIA
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1F4A}".freeze => "\u{039F}".freeze,

    # 1F4B GREEK CAPITAL LETTER OMICRON WITH DASIA AND VARIA
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1F4B}".freeze => "\u{039F}".freeze,

    # 1F4C GREEK CAPITAL LETTER OMICRON WITH PSILI AND OXIA
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1F4C}".freeze => "\u{039F}".freeze,

    # 1F4D GREEK CAPITAL LETTER OMICRON WITH DASIA AND OXIA
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1F4D}".freeze => "\u{039F}".freeze,

    # 1F50 GREEK SMALL LETTER UPSILON WITH PSILI
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F50}".freeze => "\u{03C5}".freeze,

    # 1F51 GREEK SMALL LETTER UPSILON WITH DASIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F51}".freeze => "\u{03C5}".freeze,

    # 1F52 GREEK SMALL LETTER UPSILON WITH PSILI AND VARIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F52}".freeze => "\u{03C5}".freeze,

    # 1F53 GREEK SMALL LETTER UPSILON WITH DASIA AND VARIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F53}".freeze => "\u{03C5}".freeze,

    # 1F54 GREEK SMALL LETTER UPSILON WITH PSILI AND OXIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F54}".freeze => "\u{03C5}".freeze,

    # 1F55 GREEK SMALL LETTER UPSILON WITH DASIA AND OXIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F55}".freeze => "\u{03C5}".freeze,

    # 1F56 GREEK SMALL LETTER UPSILON WITH PSILI AND PERISPOMENI
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F56}".freeze => "\u{03C5}".freeze,

    # 1F57 GREEK SMALL LETTER UPSILON WITH DASIA AND PERISPOMENI
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F57}".freeze => "\u{03C5}".freeze,

    # 1F59 GREEK CAPITAL LETTER UPSILON WITH DASIA
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1F59}".freeze => "\u{03A5}".freeze,

    # 1F5B GREEK CAPITAL LETTER UPSILON WITH DASIA AND VARIA
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1F5B}".freeze => "\u{03A5}".freeze,

    # 1F5D GREEK CAPITAL LETTER UPSILON WITH DASIA AND OXIA
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1F5D}".freeze => "\u{03A5}".freeze,

    # 1F5F GREEK CAPITAL LETTER UPSILON WITH DASIA AND PERISPOMENI
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1F5F}".freeze => "\u{03A5}".freeze,

    # 1F60 GREEK SMALL LETTER OMEGA WITH PSILI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F60}".freeze => "\u{03C9}".freeze,

    # 1F61 GREEK SMALL LETTER OMEGA WITH DASIA
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F61}".freeze => "\u{03C9}".freeze,

    # 1F62 GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F62}".freeze => "\u{03C9}".freeze,

    # 1F63 GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F63}".freeze => "\u{03C9}".freeze,

    # 1F64 GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F64}".freeze => "\u{03C9}".freeze,

    # 1F65 GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F65}".freeze => "\u{03C9}".freeze,

    # 1F66 GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F66}".freeze => "\u{03C9}".freeze,

    # 1F67 GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F67}".freeze => "\u{03C9}".freeze,

    # 1F68 GREEK CAPITAL LETTER OMEGA WITH PSILI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F68}".freeze => "\u{03A9}".freeze,

    # 1F69 GREEK CAPITAL LETTER OMEGA WITH DASIA
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F69}".freeze => "\u{03A9}".freeze,

    # 1F6A GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F6A}".freeze => "\u{03A9}".freeze,

    # 1F6B GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F6B}".freeze => "\u{03A9}".freeze,

    # 1F6C GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F6C}".freeze => "\u{03A9}".freeze,

    # 1F6D GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F6D}".freeze => "\u{03A9}".freeze,

    # 1F6E GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F6E}".freeze => "\u{03A9}".freeze,

    # 1F6F GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1F6F}".freeze => "\u{03A9}".freeze,

    # 1F70 GREEK SMALL LETTER ALPHA WITH VARIA
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F70}".freeze => "\u{03B1}".freeze,

    # 1F71 GREEK SMALL LETTER ALPHA WITH OXIA
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F71}".freeze => "\u{03B1}".freeze,

    # 1F72 GREEK SMALL LETTER EPSILON WITH VARIA
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F72}".freeze => "\u{03B5}".freeze,

    # 1F73 GREEK SMALL LETTER EPSILON WITH OXIA
    # ->   03B5 GREEK SMALL LETTER EPSILON
    "\u{1F73}".freeze => "\u{03B5}".freeze,

    # 1F74 GREEK SMALL LETTER ETA WITH VARIA
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F74}".freeze => "\u{03B7}".freeze,

    # 1F75 GREEK SMALL LETTER ETA WITH OXIA
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F75}".freeze => "\u{03B7}".freeze,

    # 1F76 GREEK SMALL LETTER IOTA WITH VARIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F76}".freeze => "\u{03B9}".freeze,

    # 1F77 GREEK SMALL LETTER IOTA WITH OXIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1F77}".freeze => "\u{03B9}".freeze,

    # 1F78 GREEK SMALL LETTER OMICRON WITH VARIA
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F78}".freeze => "\u{03BF}".freeze,

    # 1F79 GREEK SMALL LETTER OMICRON WITH OXIA
    # ->   03BF GREEK SMALL LETTER OMICRON
    "\u{1F79}".freeze => "\u{03BF}".freeze,

    # 1F7A GREEK SMALL LETTER UPSILON WITH VARIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F7A}".freeze => "\u{03C5}".freeze,

    # 1F7B GREEK SMALL LETTER UPSILON WITH OXIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1F7B}".freeze => "\u{03C5}".freeze,

    # 1F7C GREEK SMALL LETTER OMEGA WITH VARIA
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F7C}".freeze => "\u{03C9}".freeze,

    # 1F7D GREEK SMALL LETTER OMEGA WITH OXIA
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1F7D}".freeze => "\u{03C9}".freeze,

    # 1F80 GREEK SMALL LETTER ALPHA WITH PSILI AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F80}".freeze => "\u{03B1}".freeze,

    # 1F81 GREEK SMALL LETTER ALPHA WITH DASIA AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F81}".freeze => "\u{03B1}".freeze,

    # 1F82 GREEK SMALL LETTER ALPHA WITH PSILI AND VARIA AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F82}".freeze => "\u{03B1}".freeze,

    # 1F83 GREEK SMALL LETTER ALPHA WITH DASIA AND VARIA AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F83}".freeze => "\u{03B1}".freeze,

    # 1F84 GREEK SMALL LETTER ALPHA WITH PSILI AND OXIA AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F84}".freeze => "\u{03B1}".freeze,

    # 1F85 GREEK SMALL LETTER ALPHA WITH DASIA AND OXIA AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F85}".freeze => "\u{03B1}".freeze,

    # 1F86 GREEK SMALL LETTER ALPHA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F86}".freeze => "\u{03B1}".freeze,

    # 1F87 GREEK SMALL LETTER ALPHA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1F87}".freeze => "\u{03B1}".freeze,

    # 1F88 GREEK CAPITAL LETTER ALPHA WITH PSILI AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F88}".freeze => "\u{0391}".freeze,

    # 1F89 GREEK CAPITAL LETTER ALPHA WITH DASIA AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F89}".freeze => "\u{0391}".freeze,

    # 1F8A GREEK CAPITAL LETTER ALPHA WITH PSILI AND VARIA AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F8A}".freeze => "\u{0391}".freeze,

    # 1F8B GREEK CAPITAL LETTER ALPHA WITH DASIA AND VARIA AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F8B}".freeze => "\u{0391}".freeze,

    # 1F8C GREEK CAPITAL LETTER ALPHA WITH PSILI AND OXIA AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F8C}".freeze => "\u{0391}".freeze,

    # 1F8D GREEK CAPITAL LETTER ALPHA WITH DASIA AND OXIA AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F8D}".freeze => "\u{0391}".freeze,

    # 1F8E GREEK CAPITAL LETTER ALPHA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F8E}".freeze => "\u{0391}".freeze,

    # 1F8F GREEK CAPITAL LETTER ALPHA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1F8F}".freeze => "\u{0391}".freeze,

    # 1F90 GREEK SMALL LETTER ETA WITH PSILI AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F90}".freeze => "\u{03B7}".freeze,

    # 1F91 GREEK SMALL LETTER ETA WITH DASIA AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F91}".freeze => "\u{03B7}".freeze,

    # 1F92 GREEK SMALL LETTER ETA WITH PSILI AND VARIA AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F92}".freeze => "\u{03B7}".freeze,

    # 1F93 GREEK SMALL LETTER ETA WITH DASIA AND VARIA AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F93}".freeze => "\u{03B7}".freeze,

    # 1F94 GREEK SMALL LETTER ETA WITH PSILI AND OXIA AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F94}".freeze => "\u{03B7}".freeze,

    # 1F95 GREEK SMALL LETTER ETA WITH DASIA AND OXIA AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F95}".freeze => "\u{03B7}".freeze,

    # 1F96 GREEK SMALL LETTER ETA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F96}".freeze => "\u{03B7}".freeze,

    # 1F97 GREEK SMALL LETTER ETA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1F97}".freeze => "\u{03B7}".freeze,

    # 1F98 GREEK CAPITAL LETTER ETA WITH PSILI AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F98}".freeze => "\u{0397}".freeze,

    # 1F99 GREEK CAPITAL LETTER ETA WITH DASIA AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F99}".freeze => "\u{0397}".freeze,

    # 1F9A GREEK CAPITAL LETTER ETA WITH PSILI AND VARIA AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F9A}".freeze => "\u{0397}".freeze,

    # 1F9B GREEK CAPITAL LETTER ETA WITH DASIA AND VARIA AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F9B}".freeze => "\u{0397}".freeze,

    # 1F9C GREEK CAPITAL LETTER ETA WITH PSILI AND OXIA AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F9C}".freeze => "\u{0397}".freeze,

    # 1F9D GREEK CAPITAL LETTER ETA WITH DASIA AND OXIA AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F9D}".freeze => "\u{0397}".freeze,

    # 1F9E GREEK CAPITAL LETTER ETA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F9E}".freeze => "\u{0397}".freeze,

    # 1F9F GREEK CAPITAL LETTER ETA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1F9F}".freeze => "\u{0397}".freeze,

    # 1FA0 GREEK SMALL LETTER OMEGA WITH PSILI AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA0}".freeze => "\u{03C9}".freeze,

    # 1FA1 GREEK SMALL LETTER OMEGA WITH DASIA AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA1}".freeze => "\u{03C9}".freeze,

    # 1FA2 GREEK SMALL LETTER OMEGA WITH PSILI AND VARIA AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA2}".freeze => "\u{03C9}".freeze,

    # 1FA3 GREEK SMALL LETTER OMEGA WITH DASIA AND VARIA AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA3}".freeze => "\u{03C9}".freeze,

    # 1FA4 GREEK SMALL LETTER OMEGA WITH PSILI AND OXIA AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA4}".freeze => "\u{03C9}".freeze,

    # 1FA5 GREEK SMALL LETTER OMEGA WITH DASIA AND OXIA AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA5}".freeze => "\u{03C9}".freeze,

    # 1FA6 GREEK SMALL LETTER OMEGA WITH PSILI AND PERISPOMENI AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA6}".freeze => "\u{03C9}".freeze,

    # 1FA7 GREEK SMALL LETTER OMEGA WITH DASIA AND PERISPOMENI AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FA7}".freeze => "\u{03C9}".freeze,

    # 1FA8 GREEK CAPITAL LETTER OMEGA WITH PSILI AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FA8}".freeze => "\u{03A9}".freeze,

    # 1FA9 GREEK CAPITAL LETTER OMEGA WITH DASIA AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FA9}".freeze => "\u{03A9}".freeze,

    # 1FAA GREEK CAPITAL LETTER OMEGA WITH PSILI AND VARIA AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FAA}".freeze => "\u{03A9}".freeze,

    # 1FAB GREEK CAPITAL LETTER OMEGA WITH DASIA AND VARIA AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FAB}".freeze => "\u{03A9}".freeze,

    # 1FAC GREEK CAPITAL LETTER OMEGA WITH PSILI AND OXIA AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FAC}".freeze => "\u{03A9}".freeze,

    # 1FAD GREEK CAPITAL LETTER OMEGA WITH DASIA AND OXIA AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FAD}".freeze => "\u{03A9}".freeze,

    # 1FAE GREEK CAPITAL LETTER OMEGA WITH PSILI AND PERISPOMENI AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FAE}".freeze => "\u{03A9}".freeze,

    # 1FAF GREEK CAPITAL LETTER OMEGA WITH DASIA AND PERISPOMENI AND PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FAF}".freeze => "\u{03A9}".freeze,

    # 1FB0 GREEK SMALL LETTER ALPHA WITH VRACHY
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1FB0}".freeze => "\u{03B1}".freeze,

    # 1FB1 GREEK SMALL LETTER ALPHA WITH MACRON
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1FB1}".freeze => "\u{03B1}".freeze,

    # 1FB2 GREEK SMALL LETTER ALPHA WITH VARIA AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1FB2}".freeze => "\u{03B1}".freeze,

    # 1FB3 GREEK SMALL LETTER ALPHA WITH YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1FB3}".freeze => "\u{03B1}".freeze,

    # 1FB4 GREEK SMALL LETTER ALPHA WITH OXIA AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1FB4}".freeze => "\u{03B1}".freeze,

    # 1FB6 GREEK SMALL LETTER ALPHA WITH PERISPOMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1FB6}".freeze => "\u{03B1}".freeze,

    # 1FB7 GREEK SMALL LETTER ALPHA WITH PERISPOMENI AND YPOGEGRAMMENI
    # ->   03B1 GREEK SMALL LETTER ALPHA
    "\u{1FB7}".freeze => "\u{03B1}".freeze,

    # 1FB8 GREEK CAPITAL LETTER ALPHA WITH VRACHY
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1FB8}".freeze => "\u{0391}".freeze,

    # 1FB9 GREEK CAPITAL LETTER ALPHA WITH MACRON
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1FB9}".freeze => "\u{0391}".freeze,

    # 1FBA GREEK CAPITAL LETTER ALPHA WITH VARIA
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1FBA}".freeze => "\u{0391}".freeze,

    # 1FBB GREEK CAPITAL LETTER ALPHA WITH OXIA
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1FBB}".freeze => "\u{0391}".freeze,

    # 1FBC GREEK CAPITAL LETTER ALPHA WITH PROSGEGRAMMENI
    # ->   0391 GREEK CAPITAL LETTER ALPHA
    "\u{1FBC}".freeze => "\u{0391}".freeze,

    # 1FBD GREEK KORONIS
    # ->   0020 SPACE
    "\u{1FBD}".freeze => ' '.freeze,

    # 1FBE GREEK PROSGEGRAMMENI
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1FBE}".freeze => "\u{03B9}".freeze,

    # 1FBF GREEK PSILI
    # ->   0020 SPACE
    "\u{1FBF}".freeze => ' '.freeze,

    # 1FC0 GREEK PERISPOMENI
    # ->   0020 SPACE
    "\u{1FC0}".freeze => ' '.freeze,

    # 1FC1 GREEK DIALYTIKA AND PERISPOMENI
    # ->   0020 SPACE
    "\u{1FC1}".freeze => ' '.freeze,

    # 1FC2 GREEK SMALL LETTER ETA WITH VARIA AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1FC2}".freeze => "\u{03B7}".freeze,

    # 1FC3 GREEK SMALL LETTER ETA WITH YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1FC3}".freeze => "\u{03B7}".freeze,

    # 1FC4 GREEK SMALL LETTER ETA WITH OXIA AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1FC4}".freeze => "\u{03B7}".freeze,

    # 1FC6 GREEK SMALL LETTER ETA WITH PERISPOMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1FC6}".freeze => "\u{03B7}".freeze,

    # 1FC7 GREEK SMALL LETTER ETA WITH PERISPOMENI AND YPOGEGRAMMENI
    # ->   03B7 GREEK SMALL LETTER ETA
    "\u{1FC7}".freeze => "\u{03B7}".freeze,

    # 1FC8 GREEK CAPITAL LETTER EPSILON WITH VARIA
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1FC8}".freeze => "\u{0395}".freeze,

    # 1FC9 GREEK CAPITAL LETTER EPSILON WITH OXIA
    # ->   0395 GREEK CAPITAL LETTER EPSILON
    "\u{1FC9}".freeze => "\u{0395}".freeze,

    # 1FCA GREEK CAPITAL LETTER ETA WITH VARIA
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1FCA}".freeze => "\u{0397}".freeze,

    # 1FCB GREEK CAPITAL LETTER ETA WITH OXIA
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1FCB}".freeze => "\u{0397}".freeze,

    # 1FCC GREEK CAPITAL LETTER ETA WITH PROSGEGRAMMENI
    # ->   0397 GREEK CAPITAL LETTER ETA
    "\u{1FCC}".freeze => "\u{0397}".freeze,

    # 1FCD GREEK PSILI AND VARIA
    # ->   0020 SPACE
    "\u{1FCD}".freeze => ' '.freeze,

    # 1FCE GREEK PSILI AND OXIA
    # ->   0020 SPACE
    "\u{1FCE}".freeze => ' '.freeze,

    # 1FCF GREEK PSILI AND PERISPOMENI
    # ->   0020 SPACE
    "\u{1FCF}".freeze => ' '.freeze,

    # 1FD0 GREEK SMALL LETTER IOTA WITH VRACHY
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1FD0}".freeze => "\u{03B9}".freeze,

    # 1FD1 GREEK SMALL LETTER IOTA WITH MACRON
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1FD1}".freeze => "\u{03B9}".freeze,

    # 1FD2 GREEK SMALL LETTER IOTA WITH DIALYTIKA AND VARIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1FD2}".freeze => "\u{03B9}".freeze,

    # 1FD3 GREEK SMALL LETTER IOTA WITH DIALYTIKA AND OXIA
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1FD3}".freeze => "\u{03B9}".freeze,

    # 1FD6 GREEK SMALL LETTER IOTA WITH PERISPOMENI
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1FD6}".freeze => "\u{03B9}".freeze,

    # 1FD7 GREEK SMALL LETTER IOTA WITH DIALYTIKA AND PERISPOMENI
    # ->   03B9 GREEK SMALL LETTER IOTA
    "\u{1FD7}".freeze => "\u{03B9}".freeze,

    # 1FD8 GREEK CAPITAL LETTER IOTA WITH VRACHY
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1FD8}".freeze => "\u{0399}".freeze,

    # 1FD9 GREEK CAPITAL LETTER IOTA WITH MACRON
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1FD9}".freeze => "\u{0399}".freeze,

    # 1FDA GREEK CAPITAL LETTER IOTA WITH VARIA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1FDA}".freeze => "\u{0399}".freeze,

    # 1FDB GREEK CAPITAL LETTER IOTA WITH OXIA
    # ->   0399 GREEK CAPITAL LETTER IOTA
    "\u{1FDB}".freeze => "\u{0399}".freeze,

    # 1FDD GREEK DASIA AND VARIA
    # ->   0020 SPACE
    "\u{1FDD}".freeze => ' '.freeze,

    # 1FDE GREEK DASIA AND OXIA
    # ->   0020 SPACE
    "\u{1FDE}".freeze => ' '.freeze,

    # 1FDF GREEK DASIA AND PERISPOMENI
    # ->   0020 SPACE
    "\u{1FDF}".freeze => ' '.freeze,

    # 1FE0 GREEK SMALL LETTER UPSILON WITH VRACHY
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1FE0}".freeze => "\u{03C5}".freeze,

    # 1FE1 GREEK SMALL LETTER UPSILON WITH MACRON
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1FE1}".freeze => "\u{03C5}".freeze,

    # 1FE2 GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND VARIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1FE2}".freeze => "\u{03C5}".freeze,

    # 1FE3 GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND OXIA
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1FE3}".freeze => "\u{03C5}".freeze,

    # 1FE4 GREEK SMALL LETTER RHO WITH PSILI
    # ->   03C1 GREEK SMALL LETTER RHO
    "\u{1FE4}".freeze => "\u{03C1}".freeze,

    # 1FE5 GREEK SMALL LETTER RHO WITH DASIA
    # ->   03C1 GREEK SMALL LETTER RHO
    "\u{1FE5}".freeze => "\u{03C1}".freeze,

    # 1FE6 GREEK SMALL LETTER UPSILON WITH PERISPOMENI
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1FE6}".freeze => "\u{03C5}".freeze,

    # 1FE7 GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND PERISPOMENI
    # ->   03C5 GREEK SMALL LETTER UPSILON
    "\u{1FE7}".freeze => "\u{03C5}".freeze,

    # 1FE8 GREEK CAPITAL LETTER UPSILON WITH VRACHY
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1FE8}".freeze => "\u{03A5}".freeze,

    # 1FE9 GREEK CAPITAL LETTER UPSILON WITH MACRON
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1FE9}".freeze => "\u{03A5}".freeze,

    # 1FEA GREEK CAPITAL LETTER UPSILON WITH VARIA
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1FEA}".freeze => "\u{03A5}".freeze,

    # 1FEB GREEK CAPITAL LETTER UPSILON WITH OXIA
    # ->   03A5 GREEK CAPITAL LETTER UPSILON
    "\u{1FEB}".freeze => "\u{03A5}".freeze,

    # 1FEC GREEK CAPITAL LETTER RHO WITH DASIA
    # ->   03A1 GREEK CAPITAL LETTER RHO
    "\u{1FEC}".freeze => "\u{03A1}".freeze,

    # 1FED GREEK DIALYTIKA AND VARIA
    # ->   0020 SPACE
    "\u{1FED}".freeze => ' '.freeze,

    # 1FEE GREEK DIALYTIKA AND OXIA
    # ->   0020 SPACE
    "\u{1FEE}".freeze => ' '.freeze,

    # 1FEF GREEK VARIA
    # ->   0060 GRAVE ACCENT
    "\u{1FEF}".freeze => '`'.freeze,

    # 1FF2 GREEK SMALL LETTER OMEGA WITH VARIA AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FF2}".freeze => "\u{03C9}".freeze,

    # 1FF3 GREEK SMALL LETTER OMEGA WITH YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FF3}".freeze => "\u{03C9}".freeze,

    # 1FF4 GREEK SMALL LETTER OMEGA WITH OXIA AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FF4}".freeze => "\u{03C9}".freeze,

    # 1FF6 GREEK SMALL LETTER OMEGA WITH PERISPOMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FF6}".freeze => "\u{03C9}".freeze,

    # 1FF7 GREEK SMALL LETTER OMEGA WITH PERISPOMENI AND YPOGEGRAMMENI
    # ->   03C9 GREEK SMALL LETTER OMEGA
    "\u{1FF7}".freeze => "\u{03C9}".freeze,

    # 1FF8 GREEK CAPITAL LETTER OMICRON WITH VARIA
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1FF8}".freeze => "\u{039F}".freeze,

    # 1FF9 GREEK CAPITAL LETTER OMICRON WITH OXIA
    # ->   039F GREEK CAPITAL LETTER OMICRON
    "\u{1FF9}".freeze => "\u{039F}".freeze,

    # 1FFA GREEK CAPITAL LETTER OMEGA WITH VARIA
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FFA}".freeze => "\u{03A9}".freeze,

    # 1FFB GREEK CAPITAL LETTER OMEGA WITH OXIA
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FFB}".freeze => "\u{03A9}".freeze,

    # 1FFC GREEK CAPITAL LETTER OMEGA WITH PROSGEGRAMMENI
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{1FFC}".freeze => "\u{03A9}".freeze,

    # 1FFD GREEK OXIA
    # ->   0020 SPACE
    "\u{1FFD}".freeze => ' '.freeze,

    # 1FFE GREEK DASIA
    # ->   0020 SPACE
    "\u{1FFE}".freeze => ' '.freeze,

    # 2000 EN QUAD
    # ->   0020 SPACE
    "\u{2000}".freeze => ' '.freeze,

    # 2001 EM QUAD
    # ->   0020 SPACE
    "\u{2001}".freeze => ' '.freeze,

    # 2002 EN SPACE
    # ->   0020 SPACE
    "\u{2002}".freeze => ' '.freeze,

    # 2003 EM SPACE
    # ->   0020 SPACE
    "\u{2003}".freeze => ' '.freeze,

    # 2004 THREE-PER-EM SPACE
    # ->   0020 SPACE
    "\u{2004}".freeze => ' '.freeze,

    # 2005 FOUR-PER-EM SPACE
    # ->   0020 SPACE
    "\u{2005}".freeze => ' '.freeze,

    # 2006 SIX-PER-EM SPACE
    # ->   0020 SPACE
    "\u{2006}".freeze => ' '.freeze,

    # 2007 FIGURE SPACE
    # ->   0020 SPACE
    "\u{2007}".freeze => ' '.freeze,

    # 2008 PUNCTUATION SPACE
    # ->   0020 SPACE
    "\u{2008}".freeze => ' '.freeze,

    # 2009 THIN SPACE
    # ->   0020 SPACE
    "\u{2009}".freeze => ' '.freeze,

    # 200A HAIR SPACE
    # ->   0020 SPACE
    "\u{200A}".freeze => ' '.freeze,

    # 2011 NON-BREAKING HYPHEN
    # ->   2010 HYPHEN
    "\u{2011}".freeze => "\u{2010}".freeze,

    # 2017 DOUBLE LOW LINE
    # ->   0020 SPACE
    "\u{2017}".freeze => ' '.freeze,

    # 2024 ONE DOT LEADER
    # ->   002E FULL STOP
    "\u{2024}".freeze => '.'.freeze,

    # 2025 TWO DOT LEADER
    # ->   002E FULL STOP
    #    + 002E FULL STOP
    "\u{2025}".freeze => '..'.freeze,

    # 2026 HORIZONTAL ELLIPSIS
    # ->   002E FULL STOP
    #    + 002E FULL STOP
    #    + 002E FULL STOP
    "\u{2026}".freeze => '...'.freeze,

    # 202F NARROW NO-BREAK SPACE
    # ->   0020 SPACE
    "\u{202F}".freeze => ' '.freeze,

    # 2033 DOUBLE PRIME
    # ->   2032 PRIME
    #    + 2032 PRIME
    "\u{2033}".freeze => "\u{2032}\u{2032}".freeze,

    # 2034 TRIPLE PRIME
    # ->   2032 PRIME
    #    + 2032 PRIME
    #    + 2032 PRIME
    "\u{2034}".freeze => "\u{2032}\u{2032}\u{2032}".freeze,

    # 2036 REVERSED DOUBLE PRIME
    # ->   2035 REVERSED PRIME
    #    + 2035 REVERSED PRIME
    "\u{2036}".freeze => "\u{2035}\u{2035}".freeze,

    # 2037 REVERSED TRIPLE PRIME
    # ->   2035 REVERSED PRIME
    #    + 2035 REVERSED PRIME
    #    + 2035 REVERSED PRIME
    "\u{2037}".freeze => "\u{2035}\u{2035}\u{2035}".freeze,

    # 203C DOUBLE EXCLAMATION MARK
    # ->   0021 EXCLAMATION MARK
    #    + 0021 EXCLAMATION MARK
    "\u{203C}".freeze => '!!'.freeze,

    # 203E OVERLINE
    # ->   0020 SPACE
    "\u{203E}".freeze => ' '.freeze,

    # 2045 LEFT SQUARE BRACKET WITH QUILL
    # ->   005B LEFT SQUARE BRACKET
    "\u{2045}".freeze => '['.freeze,

    # 2046 RIGHT SQUARE BRACKET WITH QUILL
    # ->   005D RIGHT SQUARE BRACKET
    "\u{2046}".freeze => ']'.freeze,

    # 2047 DOUBLE QUESTION MARK
    # ->   003F QUESTION MARK
    #    + 003F QUESTION MARK
    "\u{2047}".freeze => '??'.freeze,

    # 2048 QUESTION EXCLAMATION MARK
    # ->   003F QUESTION MARK
    #    + 0021 EXCLAMATION MARK
    "\u{2048}".freeze => '?!'.freeze,

    # 2049 EXCLAMATION QUESTION MARK
    # ->   0021 EXCLAMATION MARK
    #    + 003F QUESTION MARK
    "\u{2049}".freeze => '!?'.freeze,

    # 2057 QUADRUPLE PRIME
    # ->   2032 PRIME
    #    + 2032 PRIME
    #    + 2032 PRIME
    #    + 2032 PRIME
    "\u{2057}".freeze => "\u{2032}\u{2032}\u{2032}\u{2032}".freeze,

    # 205F MEDIUM MATHEMATICAL SPACE
    # ->   0020 SPACE
    "\u{205F}".freeze => ' '.freeze,

    # 2070 SUPERSCRIPT ZERO
    # ->   0030 DIGIT ZERO
    "\u{2070}".freeze => '0'.freeze,

    # 2071 SUPERSCRIPT LATIN SMALL LETTER I
    # ->   0069 LATIN SMALL LETTER I
    "\u{2071}".freeze => 'i'.freeze,

    # 2074 SUPERSCRIPT FOUR
    # ->   0034 DIGIT FOUR
    "\u{2074}".freeze => '4'.freeze,

    # 2075 SUPERSCRIPT FIVE
    # ->   0035 DIGIT FIVE
    "\u{2075}".freeze => '5'.freeze,

    # 2076 SUPERSCRIPT SIX
    # ->   0036 DIGIT SIX
    "\u{2076}".freeze => '6'.freeze,

    # 2077 SUPERSCRIPT SEVEN
    # ->   0037 DIGIT SEVEN
    "\u{2077}".freeze => '7'.freeze,

    # 2078 SUPERSCRIPT EIGHT
    # ->   0038 DIGIT EIGHT
    "\u{2078}".freeze => '8'.freeze,

    # 2079 SUPERSCRIPT NINE
    # ->   0039 DIGIT NINE
    "\u{2079}".freeze => '9'.freeze,

    # 207A SUPERSCRIPT PLUS SIGN
    # ->   002B PLUS SIGN
    "\u{207A}".freeze => '+'.freeze,

    # 207B SUPERSCRIPT MINUS
    # ->   2212 MINUS SIGN
    "\u{207B}".freeze => "\u{2212}".freeze,

    # 207C SUPERSCRIPT EQUALS SIGN
    # ->   003D EQUALS SIGN
    "\u{207C}".freeze => '='.freeze,

    # 207D SUPERSCRIPT LEFT PARENTHESIS
    # ->   0028 LEFT PARENTHESIS
    "\u{207D}".freeze => '('.freeze,

    # 207E SUPERSCRIPT RIGHT PARENTHESIS
    # ->   0029 RIGHT PARENTHESIS
    "\u{207E}".freeze => ')'.freeze,

    # 207F SUPERSCRIPT LATIN SMALL LETTER N
    # ->   006E LATIN SMALL LETTER N
    "\u{207F}".freeze => 'n'.freeze,

    # 2080 SUBSCRIPT ZERO
    # ->   0030 DIGIT ZERO
    "\u{2080}".freeze => '0'.freeze,

    # 2081 SUBSCRIPT ONE
    # ->   0031 DIGIT ONE
    "\u{2081}".freeze => '1'.freeze,

    # 2082 SUBSCRIPT TWO
    # ->   0032 DIGIT TWO
    "\u{2082}".freeze => '2'.freeze,

    # 2083 SUBSCRIPT THREE
    # ->   0033 DIGIT THREE
    "\u{2083}".freeze => '3'.freeze,

    # 2084 SUBSCRIPT FOUR
    # ->   0034 DIGIT FOUR
    "\u{2084}".freeze => '4'.freeze,

    # 2085 SUBSCRIPT FIVE
    # ->   0035 DIGIT FIVE
    "\u{2085}".freeze => '5'.freeze,

    # 2086 SUBSCRIPT SIX
    # ->   0036 DIGIT SIX
    "\u{2086}".freeze => '6'.freeze,

    # 2087 SUBSCRIPT SEVEN
    # ->   0037 DIGIT SEVEN
    "\u{2087}".freeze => '7'.freeze,

    # 2088 SUBSCRIPT EIGHT
    # ->   0038 DIGIT EIGHT
    "\u{2088}".freeze => '8'.freeze,

    # 2089 SUBSCRIPT NINE
    # ->   0039 DIGIT NINE
    "\u{2089}".freeze => '9'.freeze,

    # 208A SUBSCRIPT PLUS SIGN
    # ->   002B PLUS SIGN
    "\u{208A}".freeze => '+'.freeze,

    # 208B SUBSCRIPT MINUS
    # ->   2212 MINUS SIGN
    "\u{208B}".freeze => "\u{2212}".freeze,

    # 208C SUBSCRIPT EQUALS SIGN
    # ->   003D EQUALS SIGN
    "\u{208C}".freeze => '='.freeze,

    # 208D SUBSCRIPT LEFT PARENTHESIS
    # ->   0028 LEFT PARENTHESIS
    "\u{208D}".freeze => '('.freeze,

    # 208E SUBSCRIPT RIGHT PARENTHESIS
    # ->   0029 RIGHT PARENTHESIS
    "\u{208E}".freeze => ')'.freeze,

    # 20A8 RUPEE SIGN
    # ->   0052 LATIN CAPITAL LETTER R
    #    + 0073 LATIN SMALL LETTER S
    "\u{20A8}".freeze => 'Rs'.freeze,

    # 2100 ACCOUNT OF
    # ->   0061 LATIN SMALL LETTER A
    #    + 002F SOLIDUS
    #    + 0063 LATIN SMALL LETTER C
    "\u{2100}".freeze => 'a/c'.freeze,

    # 2101 ADDRESSED TO THE SUBJECT
    # ->   0061 LATIN SMALL LETTER A
    #    + 002F SOLIDUS
    #    + 0073 LATIN SMALL LETTER S
    "\u{2101}".freeze => 'a/s'.freeze,

    # 2102 DOUBLE-STRUCK CAPITAL C
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{2102}".freeze => 'C'.freeze,

    # 2103 DEGREE CELSIUS
    # ->   00B0 DEGREE SIGN
    #    + 0043 LATIN CAPITAL LETTER C
    "\u{2103}".freeze => "\u{B0C}".freeze,

    # 2105 CARE OF
    # ->   0063 LATIN SMALL LETTER C
    #    + 002F SOLIDUS
    #    + 006F LATIN SMALL LETTER O
    "\u{2105}".freeze => 'c/o'.freeze,

    # 2106 CADA UNA
    # ->   0063 LATIN SMALL LETTER C
    #    + 002F SOLIDUS
    #    + 0075 LATIN SMALL LETTER U
    "\u{2106}".freeze => 'c/u'.freeze,

    # 2107 EULER CONSTANT
    # ->   0190 LATIN CAPITAL LETTER OPEN E
    "\u{2107}".freeze => "\u{0190}".freeze,

    # 2109 DEGREE FAHRENHEIT
    # ->   00B0 DEGREE SIGN
    #    + 0046 LATIN CAPITAL LETTER F
    "\u{2109}".freeze => "\u{B0F}".freeze,

    # 210A SCRIPT SMALL G
    # ->   0067 LATIN SMALL LETTER G
    "\u{210A}".freeze => 'g'.freeze,

    # 210B SCRIPT CAPITAL H
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{210B}".freeze => 'H'.freeze,

    # 210C BLACK-LETTER CAPITAL H
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{210C}".freeze => 'H'.freeze,

    # 210D DOUBLE-STRUCK CAPITAL H
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{210D}".freeze => 'H'.freeze,

    # 210E PLANCK CONSTANT
    # ->   0068 LATIN SMALL LETTER H
    "\u{210E}".freeze => 'h'.freeze,

    # 210F PLANCK CONSTANT OVER TWO PI
    # ->   0068 LATIN SMALL LETTER H
    "\u{210F}".freeze => 'h'.freeze,

    # 2110 SCRIPT CAPITAL I
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{2110}".freeze => 'I'.freeze,

    # 2111 BLACK-LETTER CAPITAL I
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{2111}".freeze => 'I'.freeze,

    # 2112 SCRIPT CAPITAL L
    # ->   004C LATIN CAPITAL LETTER L
    "\u{2112}".freeze => 'L'.freeze,

    # 2113 SCRIPT SMALL L
    # ->   006C LATIN SMALL LETTER L
    "\u{2113}".freeze => 'l'.freeze,

    # 2115 DOUBLE-STRUCK CAPITAL N
    # ->   004E LATIN CAPITAL LETTER N
    "\u{2115}".freeze => 'N'.freeze,

    # 2116 NUMERO SIGN
    # ->   004E LATIN CAPITAL LETTER N
    #    + 006F LATIN SMALL LETTER O
    "\u{2116}".freeze => 'No'.freeze,

    # 2119 DOUBLE-STRUCK CAPITAL P
    # ->   0050 LATIN CAPITAL LETTER P
    "\u{2119}".freeze => 'P'.freeze,

    # 211A DOUBLE-STRUCK CAPITAL Q
    # ->   0051 LATIN CAPITAL LETTER Q
    "\u{211A}".freeze => 'Q'.freeze,

    # 211B SCRIPT CAPITAL R
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{211B}".freeze => 'R'.freeze,

    # 211C BLACK-LETTER CAPITAL R
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{211C}".freeze => 'R'.freeze,

    # 211D DOUBLE-STRUCK CAPITAL R
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{211D}".freeze => 'R'.freeze,

    # 2120 SERVICE MARK
    # ->   0053 LATIN CAPITAL LETTER S
    #    + 004D LATIN CAPITAL LETTER M
    "\u{2120}".freeze => 'SM'.freeze,

    # 2121 TELEPHONE SIGN
    # ->   0054 LATIN CAPITAL LETTER T
    #    + 0045 LATIN CAPITAL LETTER E
    #    + 004C LATIN CAPITAL LETTER L
    "\u{2121}".freeze => 'TEL'.freeze,

    # 2122 TRADE MARK SIGN
    # ->   0054 LATIN CAPITAL LETTER T
    #    + 004D LATIN CAPITAL LETTER M
    "\u{2122}".freeze => 'TM'.freeze,

    # 2124 DOUBLE-STRUCK CAPITAL Z
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{2124}".freeze => 'Z'.freeze,

    # 2126 OHM SIGN
    # ->   03A9 GREEK CAPITAL LETTER OMEGA
    "\u{2126}".freeze => "\u{03A9}".freeze,

    # 2128 BLACK-LETTER CAPITAL Z
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{2128}".freeze => 'Z'.freeze,

    # 212A KELVIN SIGN
    # ->   004B LATIN CAPITAL LETTER K
    "\u{212A}".freeze => 'K'.freeze,

    # 212B ANGSTROM SIGN
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{212B}".freeze => 'A'.freeze,

    # 212C SCRIPT CAPITAL B
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{212C}".freeze => 'B'.freeze,

    # 212D BLACK-LETTER CAPITAL C
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{212D}".freeze => 'C'.freeze,

    # 212F SCRIPT SMALL E
    # ->   0065 LATIN SMALL LETTER E
    "\u{212F}".freeze => 'e'.freeze,

    # 2130 SCRIPT CAPITAL E
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{2130}".freeze => 'E'.freeze,

    # 2131 SCRIPT CAPITAL F
    # ->   0046 LATIN CAPITAL LETTER F
    "\u{2131}".freeze => 'F'.freeze,

    # 2133 SCRIPT CAPITAL M
    # ->   004D LATIN CAPITAL LETTER M
    "\u{2133}".freeze => 'M'.freeze,

    # 2134 SCRIPT SMALL O
    # ->   006F LATIN SMALL LETTER O
    "\u{2134}".freeze => 'o'.freeze,

    # 2135 ALEF SYMBOL
    # ->   05D0 HEBREW LETTER ALEF
    "\u{2135}".freeze => "\u{05D0}".freeze,

    # 2136 BET SYMBOL
    # ->   05D1 HEBREW LETTER BET
    "\u{2136}".freeze => "\u{05D1}".freeze,

    # 2137 GIMEL SYMBOL
    # ->   05D2 HEBREW LETTER GIMEL
    "\u{2137}".freeze => "\u{05D2}".freeze,

    # 2138 DALET SYMBOL
    # ->   05D3 HEBREW LETTER DALET
    "\u{2138}".freeze => "\u{05D3}".freeze,

    # 2139 INFORMATION SOURCE
    # ->   0069 LATIN SMALL LETTER I
    "\u{2139}".freeze => 'i'.freeze,

    # 213B FACSIMILE SIGN
    # ->   0046 LATIN CAPITAL LETTER F
    #    + 0041 LATIN CAPITAL LETTER A
    #    + 0058 LATIN CAPITAL LETTER X
    "\u{213B}".freeze => 'FAX'.freeze,

    # 213D DOUBLE-STRUCK SMALL GAMMA
    # ->   03B3 GREEK SMALL LETTER GAMMA
    "\u{213D}".freeze => "\u{03B3}".freeze,

    # 213E DOUBLE-STRUCK CAPITAL GAMMA
    # ->   0393 GREEK CAPITAL LETTER GAMMA
    "\u{213E}".freeze => "\u{0393}".freeze,

    # 213F DOUBLE-STRUCK CAPITAL PI
    # ->   03A0 GREEK CAPITAL LETTER PI
    "\u{213F}".freeze => "\u{03A0}".freeze,

    # 2140 DOUBLE-STRUCK N-ARY SUMMATION
    # ->   2211 N-ARY SUMMATION
    "\u{2140}".freeze => "\u{2211}".freeze,

    # 2145 DOUBLE-STRUCK ITALIC CAPITAL D
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{2145}".freeze => 'D'.freeze,

    # 2146 DOUBLE-STRUCK ITALIC SMALL D
    # ->   0064 LATIN SMALL LETTER D
    "\u{2146}".freeze => 'd'.freeze,

    # 2147 DOUBLE-STRUCK ITALIC SMALL E
    # ->   0065 LATIN SMALL LETTER E
    "\u{2147}".freeze => 'e'.freeze,

    # 2148 DOUBLE-STRUCK ITALIC SMALL I
    # ->   0069 LATIN SMALL LETTER I
    "\u{2148}".freeze => 'i'.freeze,

    # 2149 DOUBLE-STRUCK ITALIC SMALL J
    # ->   006A LATIN SMALL LETTER J
    "\u{2149}".freeze => 'j'.freeze,

    # 2153 VULGAR FRACTION ONE THIRD
    # ->   0031 DIGIT ONE
    #    + 2044 FRACTION SLASH
    #    + 0033 DIGIT THREE
    "\u{2153}".freeze => "1\u{2044}3".freeze,

    # 2154 VULGAR FRACTION TWO THIRDS
    # ->   0032 DIGIT TWO
    #    + 2044 FRACTION SLASH
    #    + 0033 DIGIT THREE
    "\u{2154}".freeze => "2\u{2044}3".freeze,

    # 2155 VULGAR FRACTION ONE FIFTH
    # ->   0031 DIGIT ONE
    #    + 2044 FRACTION SLASH
    #    + 0035 DIGIT FIVE
    "\u{2155}".freeze => "1\u{2044}5".freeze,

    # 2156 VULGAR FRACTION TWO FIFTHS
    # ->   0032 DIGIT TWO
    #    + 2044 FRACTION SLASH
    #    + 0035 DIGIT FIVE
    "\u{2156}".freeze => "2\u{2044}5".freeze,

    # 2157 VULGAR FRACTION THREE FIFTHS
    # ->   0033 DIGIT THREE
    #    + 2044 FRACTION SLASH
    #    + 0035 DIGIT FIVE
    "\u{2157}".freeze => "3\u{2044}5".freeze,

    # 2158 VULGAR FRACTION FOUR FIFTHS
    # ->   0034 DIGIT FOUR
    #    + 2044 FRACTION SLASH
    #    + 0035 DIGIT FIVE
    "\u{2158}".freeze => "4\u{2044}5".freeze,

    # 2159 VULGAR FRACTION ONE SIXTH
    # ->   0031 DIGIT ONE
    #    + 2044 FRACTION SLASH
    #    + 0036 DIGIT SIX
    "\u{2159}".freeze => "1\u{2044}6".freeze,

    # 215A VULGAR FRACTION FIVE SIXTHS
    # ->   0035 DIGIT FIVE
    #    + 2044 FRACTION SLASH
    #    + 0036 DIGIT SIX
    "\u{215A}".freeze => "5\u{2044}6".freeze,

    # 215B VULGAR FRACTION ONE EIGHTH
    # ->   0031 DIGIT ONE
    #    + 2044 FRACTION SLASH
    #    + 0038 DIGIT EIGHT
    "\u{215B}".freeze => "1\u{2044}8".freeze,

    # 215C VULGAR FRACTION THREE EIGHTHS
    # ->   0033 DIGIT THREE
    #    + 2044 FRACTION SLASH
    #    + 0038 DIGIT EIGHT
    "\u{215C}".freeze => "3\u{2044}8".freeze,

    # 215D VULGAR FRACTION FIVE EIGHTHS
    # ->   0035 DIGIT FIVE
    #    + 2044 FRACTION SLASH
    #    + 0038 DIGIT EIGHT
    "\u{215D}".freeze => "5\u{2044}8".freeze,

    # 215E VULGAR FRACTION SEVEN EIGHTHS
    # ->   0037 DIGIT SEVEN
    #    + 2044 FRACTION SLASH
    #    + 0038 DIGIT EIGHT
    "\u{215E}".freeze => "7\u{2044}8".freeze,

    # 215F FRACTION NUMERATOR ONE
    # ->   0031 DIGIT ONE
    #    + 2044 FRACTION SLASH
    "\u{215F}".freeze => "1\u{2044}".freeze,

    # 2160 ROMAN NUMERAL ONE
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{2160}".freeze => 'I'.freeze,

    # 2161 ROMAN NUMERAL TWO
    # ->   0049 LATIN CAPITAL LETTER I
    #    + 0049 LATIN CAPITAL LETTER I
    "\u{2161}".freeze => 'II'.freeze,

    # 2162 ROMAN NUMERAL THREE
    # ->   0049 LATIN CAPITAL LETTER I
    #    + 0049 LATIN CAPITAL LETTER I
    #    + 0049 LATIN CAPITAL LETTER I
    "\u{2162}".freeze => 'III'.freeze,

    # 2163 ROMAN NUMERAL FOUR
    # ->   0049 LATIN CAPITAL LETTER I
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{2163}".freeze => 'IV'.freeze,

    # 2164 ROMAN NUMERAL FIVE
    # ->   0056 LATIN CAPITAL LETTER V
    "\u{2164}".freeze => 'V'.freeze,

    # 2165 ROMAN NUMERAL SIX
    # ->   0056 LATIN CAPITAL LETTER V
    #    + 0049 LATIN CAPITAL LETTER I
    "\u{2165}".freeze => 'VI'.freeze,

    # 2166 ROMAN NUMERAL SEVEN
    # ->   0056 LATIN CAPITAL LETTER V
    #    + 0049 LATIN CAPITAL LETTER I
    #    + 0049 LATIN CAPITAL LETTER I
    "\u{2166}".freeze => 'VII'.freeze,

    # 2167 ROMAN NUMERAL EIGHT
    # ->   0056 LATIN CAPITAL LETTER V
    #    + 0049 LATIN CAPITAL LETTER I
    #    + 0049 LATIN CAPITAL LETTER I
    #    + 0049 LATIN CAPITAL LETTER I
    "\u{2167}".freeze => 'VIII'.freeze,

    # 2168 ROMAN NUMERAL NINE
    # ->   0049 LATIN CAPITAL LETTER I
    #    + 0058 LATIN CAPITAL LETTER X
    "\u{2168}".freeze => 'IX'.freeze,

    # 2169 ROMAN NUMERAL TEN
    # ->   0058 LATIN CAPITAL LETTER X
    "\u{2169}".freeze => 'X'.freeze,

    # 216A ROMAN NUMERAL ELEVEN
    # ->   0058 LATIN CAPITAL LETTER X
    #    + 0049 LATIN CAPITAL LETTER I
    "\u{216A}".freeze => 'XI'.freeze,

    # 216B ROMAN NUMERAL TWELVE
    # ->   0058 LATIN CAPITAL LETTER X
    #    + 0049 LATIN CAPITAL LETTER I
    #    + 0049 LATIN CAPITAL LETTER I
    "\u{216B}".freeze => 'XII'.freeze,

    # 216C ROMAN NUMERAL FIFTY
    # ->   004C LATIN CAPITAL LETTER L
    "\u{216C}".freeze => 'L'.freeze,

    # 216D ROMAN NUMERAL ONE HUNDRED
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{216D}".freeze => 'C'.freeze,

    # 216E ROMAN NUMERAL FIVE HUNDRED
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{216E}".freeze => 'D'.freeze,

    # 216F ROMAN NUMERAL ONE THOUSAND
    # ->   004D LATIN CAPITAL LETTER M
    "\u{216F}".freeze => 'M'.freeze,

    # 2170 SMALL ROMAN NUMERAL ONE
    # ->   0069 LATIN SMALL LETTER I
    "\u{2170}".freeze => 'i'.freeze,

    # 2171 SMALL ROMAN NUMERAL TWO
    # ->   0069 LATIN SMALL LETTER I
    #    + 0069 LATIN SMALL LETTER I
    "\u{2171}".freeze => 'ii'.freeze,

    # 2172 SMALL ROMAN NUMERAL THREE
    # ->   0069 LATIN SMALL LETTER I
    #    + 0069 LATIN SMALL LETTER I
    #    + 0069 LATIN SMALL LETTER I
    "\u{2172}".freeze => 'iii'.freeze,

    # 2173 SMALL ROMAN NUMERAL FOUR
    # ->   0069 LATIN SMALL LETTER I
    #    + 0076 LATIN SMALL LETTER V
    "\u{2173}".freeze => 'iv'.freeze,

    # 2174 SMALL ROMAN NUMERAL FIVE
    # ->   0076 LATIN SMALL LETTER V
    "\u{2174}".freeze => 'v'.freeze,

    # 2175 SMALL ROMAN NUMERAL SIX
    # ->   0076 LATIN SMALL LETTER V
    #    + 0069 LATIN SMALL LETTER I
    "\u{2175}".freeze => 'vi'.freeze,

    # 2176 SMALL ROMAN NUMERAL SEVEN
    # ->   0076 LATIN SMALL LETTER V
    #    + 0069 LATIN SMALL LETTER I
    #    + 0069 LATIN SMALL LETTER I
    "\u{2176}".freeze => 'vii'.freeze,

    # 2177 SMALL ROMAN NUMERAL EIGHT
    # ->   0076 LATIN SMALL LETTER V
    #    + 0069 LATIN SMALL LETTER I
    #    + 0069 LATIN SMALL LETTER I
    #    + 0069 LATIN SMALL LETTER I
    "\u{2177}".freeze => 'viii'.freeze,

    # 2178 SMALL ROMAN NUMERAL NINE
    # ->   0069 LATIN SMALL LETTER I
    #    + 0078 LATIN SMALL LETTER X
    "\u{2178}".freeze => 'ix'.freeze,

    # 2179 SMALL ROMAN NUMERAL TEN
    # ->   0078 LATIN SMALL LETTER X
    "\u{2179}".freeze => 'x'.freeze,

    # 217A SMALL ROMAN NUMERAL ELEVEN
    # ->   0078 LATIN SMALL LETTER X
    #    + 0069 LATIN SMALL LETTER I
    "\u{217A}".freeze => 'xi'.freeze,

    # 217B SMALL ROMAN NUMERAL TWELVE
    # ->   0078 LATIN SMALL LETTER X
    #    + 0069 LATIN SMALL LETTER I
    #    + 0069 LATIN SMALL LETTER I
    "\u{217B}".freeze => 'xii'.freeze,

    # 217C SMALL ROMAN NUMERAL FIFTY
    # ->   006C LATIN SMALL LETTER L
    "\u{217C}".freeze => 'l'.freeze,

    # 217D SMALL ROMAN NUMERAL ONE HUNDRED
    # ->   0063 LATIN SMALL LETTER C
    "\u{217D}".freeze => 'c'.freeze,

    # 217E SMALL ROMAN NUMERAL FIVE HUNDRED
    # ->   0064 LATIN SMALL LETTER D
    "\u{217E}".freeze => 'd'.freeze,

    # 217F SMALL ROMAN NUMERAL ONE THOUSAND
    # ->   006D LATIN SMALL LETTER M
    "\u{217F}".freeze => 'm'.freeze,

    # 219A LEFTWARDS ARROW WITH STROKE
    # ->   2190 LEFTWARDS ARROW
    "\u{219A}".freeze => "\u{2190}".freeze,

    # 219B RIGHTWARDS ARROW WITH STROKE
    # ->   2192 RIGHTWARDS ARROW
    "\u{219B}".freeze => "\u{2192}".freeze,

    # 21A2 LEFTWARDS ARROW WITH TAIL
    # ->   2190 LEFTWARDS ARROW
    "\u{21A2}".freeze => "\u{2190}".freeze,

    # 21A3 RIGHTWARDS ARROW WITH TAIL
    # ->   2192 RIGHTWARDS ARROW
    "\u{21A3}".freeze => "\u{2192}".freeze,

    # 21A8 UP DOWN ARROW WITH BASE
    # ->   2195 UP DOWN ARROW
    "\u{21A8}".freeze => "\u{2195}".freeze,

    # 21A9 LEFTWARDS ARROW WITH HOOK
    # ->   2190 LEFTWARDS ARROW
    "\u{21A9}".freeze => "\u{2190}".freeze,

    # 21AA RIGHTWARDS ARROW WITH HOOK
    # ->   2192 RIGHTWARDS ARROW
    "\u{21AA}".freeze => "\u{2192}".freeze,

    # 21AB LEFTWARDS ARROW WITH LOOP
    # ->   2190 LEFTWARDS ARROW
    "\u{21AB}".freeze => "\u{2190}".freeze,

    # 21AC RIGHTWARDS ARROW WITH LOOP
    # ->   2192 RIGHTWARDS ARROW
    "\u{21AC}".freeze => "\u{2192}".freeze,

    # 21AE LEFT RIGHT ARROW WITH STROKE
    # ->   2194 LEFT RIGHT ARROW
    "\u{21AE}".freeze => "\u{2194}".freeze,

    # 21B0 UPWARDS ARROW WITH TIP LEFTWARDS
    # ->   2191 UPWARDS ARROW
    "\u{21B0}".freeze => "\u{2191}".freeze,

    # 21B1 UPWARDS ARROW WITH TIP RIGHTWARDS
    # ->   2191 UPWARDS ARROW
    "\u{21B1}".freeze => "\u{2191}".freeze,

    # 21B2 DOWNWARDS ARROW WITH TIP LEFTWARDS
    # ->   2193 DOWNWARDS ARROW
    "\u{21B2}".freeze => "\u{2193}".freeze,

    # 21B3 DOWNWARDS ARROW WITH TIP RIGHTWARDS
    # ->   2193 DOWNWARDS ARROW
    "\u{21B3}".freeze => "\u{2193}".freeze,

    # 21B4 RIGHTWARDS ARROW WITH CORNER DOWNWARDS
    # ->   2192 RIGHTWARDS ARROW
    "\u{21B4}".freeze => "\u{2192}".freeze,

    # 21B5 DOWNWARDS ARROW WITH CORNER LEFTWARDS
    # ->   2193 DOWNWARDS ARROW
    "\u{21B5}".freeze => "\u{2193}".freeze,

    # 21CD LEFTWARDS DOUBLE ARROW WITH STROKE
    # ->   21D0 LEFTWARDS DOUBLE ARROW
    "\u{21CD}".freeze => "\u{21D0}".freeze,

    # 21CE LEFT RIGHT DOUBLE ARROW WITH STROKE
    # ->   21D4 LEFT RIGHT DOUBLE ARROW
    "\u{21CE}".freeze => "\u{21D4}".freeze,

    # 21CF RIGHTWARDS DOUBLE ARROW WITH STROKE
    # ->   21D2 RIGHTWARDS DOUBLE ARROW
    "\u{21CF}".freeze => "\u{21D2}".freeze,

    # 21DE UPWARDS ARROW WITH DOUBLE STROKE
    # ->   2191 UPWARDS ARROW
    "\u{21DE}".freeze => "\u{2191}".freeze,

    # 21DF DOWNWARDS ARROW WITH DOUBLE STROKE
    # ->   2193 DOWNWARDS ARROW
    "\u{21DF}".freeze => "\u{2193}".freeze,

    # 21EC UPWARDS WHITE ARROW ON PEDESTAL WITH HORIZONTAL BAR
    # ->   21EB UPWARDS WHITE ARROW ON PEDESTAL
    "\u{21EC}".freeze => "\u{21EB}".freeze,

    # 21ED UPWARDS WHITE ARROW ON PEDESTAL WITH VERTICAL BAR
    # ->   21EB UPWARDS WHITE ARROW ON PEDESTAL
    "\u{21ED}".freeze => "\u{21EB}".freeze,

    # 21F7 LEFTWARDS ARROW WITH VERTICAL STROKE
    # ->   2190 LEFTWARDS ARROW
    "\u{21F7}".freeze => "\u{2190}".freeze,

    # 21F8 RIGHTWARDS ARROW WITH VERTICAL STROKE
    # ->   2192 RIGHTWARDS ARROW
    "\u{21F8}".freeze => "\u{2192}".freeze,

    # 21F9 LEFT RIGHT ARROW WITH VERTICAL STROKE
    # ->   2194 LEFT RIGHT ARROW
    "\u{21F9}".freeze => "\u{2194}".freeze,

    # 21FA LEFTWARDS ARROW WITH DOUBLE VERTICAL STROKE
    # ->   2190 LEFTWARDS ARROW
    "\u{21FA}".freeze => "\u{2190}".freeze,

    # 21FB RIGHTWARDS ARROW WITH DOUBLE VERTICAL STROKE
    # ->   2192 RIGHTWARDS ARROW
    "\u{21FB}".freeze => "\u{2192}".freeze,

    # 21FC LEFT RIGHT ARROW WITH DOUBLE VERTICAL STROKE
    # ->   2194 LEFT RIGHT ARROW
    "\u{21FC}".freeze => "\u{2194}".freeze,

    # 2204 THERE DOES NOT EXIST
    # ->   2203 THERE EXISTS
    "\u{2204}".freeze => "\u{2203}".freeze,

    # 2209 NOT AN ELEMENT OF
    # ->   2208 ELEMENT OF
    "\u{2209}".freeze => "\u{2208}".freeze,

    # 220C DOES NOT CONTAIN AS MEMBER
    # ->   220B CONTAINS AS MEMBER
    "\u{220C}".freeze => "\u{220B}".freeze,

    # 2224 DOES NOT DIVIDE
    # ->   2223 DIVIDES
    "\u{2224}".freeze => "\u{2223}".freeze,

    # 2226 NOT PARALLEL TO
    # ->   2225 PARALLEL TO
    "\u{2226}".freeze => "\u{2225}".freeze,

    # 222C DOUBLE INTEGRAL
    # ->   222B INTEGRAL
    #    + 222B INTEGRAL
    "\u{222C}".freeze => "\u{222B}\u{222B}".freeze,

    # 222D TRIPLE INTEGRAL
    # ->   222B INTEGRAL
    #    + 222B INTEGRAL
    #    + 222B INTEGRAL
    "\u{222D}".freeze => "\u{222B}\u{222B}\u{222B}".freeze,

    # 222F SURFACE INTEGRAL
    # ->   222E CONTOUR INTEGRAL
    #    + 222E CONTOUR INTEGRAL
    "\u{222F}".freeze => "\u{222E}\u{222E}".freeze,

    # 2230 VOLUME INTEGRAL
    # ->   222E CONTOUR INTEGRAL
    #    + 222E CONTOUR INTEGRAL
    #    + 222E CONTOUR INTEGRAL
    "\u{2230}".freeze => "\u{222E}\u{222E}\u{222E}".freeze,

    # 2241 NOT TILDE
    # ->   223C TILDE OPERATOR
    "\u{2241}".freeze => "\u{223C}".freeze,

    # 2244 NOT ASYMPTOTICALLY EQUAL TO
    # ->   2243 ASYMPTOTICALLY EQUAL TO
    "\u{2244}".freeze => "\u{2243}".freeze,

    # 2247 NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO
    # ->   2245 APPROXIMATELY EQUAL TO
    "\u{2247}".freeze => "\u{2245}".freeze,

    # 2249 NOT ALMOST EQUAL TO
    # ->   2248 ALMOST EQUAL TO
    "\u{2249}".freeze => "\u{2248}".freeze,

    # 2260 NOT EQUAL TO
    # ->   003D EQUALS SIGN
    "\u{2260}".freeze => '='.freeze,

    # 2262 NOT IDENTICAL TO
    # ->   2261 IDENTICAL TO
    "\u{2262}".freeze => "\u{2261}".freeze,

    # 226D NOT EQUIVALENT TO
    # ->   224D EQUIVALENT TO
    "\u{226D}".freeze => "\u{224D}".freeze,

    # 226E NOT LESS-THAN
    # ->   003C LESS-THAN SIGN
    "\u{226E}".freeze => '<'.freeze,

    # 226F NOT GREATER-THAN
    # ->   003E GREATER-THAN SIGN
    "\u{226F}".freeze => '>'.freeze,

    # 2270 NEITHER LESS-THAN NOR EQUAL TO
    # ->   2264 LESS-THAN OR EQUAL TO
    "\u{2270}".freeze => "\u{2264}".freeze,

    # 2271 NEITHER GREATER-THAN NOR EQUAL TO
    # ->   2265 GREATER-THAN OR EQUAL TO
    "\u{2271}".freeze => "\u{2265}".freeze,

    # 2274 NEITHER LESS-THAN NOR EQUIVALENT TO
    # ->   2272 LESS-THAN OR EQUIVALENT TO
    "\u{2274}".freeze => "\u{2272}".freeze,

    # 2275 NEITHER GREATER-THAN NOR EQUIVALENT TO
    # ->   2273 GREATER-THAN OR EQUIVALENT TO
    "\u{2275}".freeze => "\u{2273}".freeze,

    # 2278 NEITHER LESS-THAN NOR GREATER-THAN
    # ->   2276 LESS-THAN OR GREATER-THAN
    "\u{2278}".freeze => "\u{2276}".freeze,

    # 2279 NEITHER GREATER-THAN NOR LESS-THAN
    # ->   2277 GREATER-THAN OR LESS-THAN
    "\u{2279}".freeze => "\u{2277}".freeze,

    # 2280 DOES NOT PRECEDE
    # ->   227A PRECEDES
    "\u{2280}".freeze => "\u{227A}".freeze,

    # 2281 DOES NOT SUCCEED
    # ->   227B SUCCEEDS
    "\u{2281}".freeze => "\u{227B}".freeze,

    # 2284 NOT A SUBSET OF
    # ->   2282 SUBSET OF
    "\u{2284}".freeze => "\u{2282}".freeze,

    # 2285 NOT A SUPERSET OF
    # ->   2283 SUPERSET OF
    "\u{2285}".freeze => "\u{2283}".freeze,

    # 2288 NEITHER A SUBSET OF NOR EQUAL TO
    # ->   2286 SUBSET OF OR EQUAL TO
    "\u{2288}".freeze => "\u{2286}".freeze,

    # 2289 NEITHER A SUPERSET OF NOR EQUAL TO
    # ->   2287 SUPERSET OF OR EQUAL TO
    "\u{2289}".freeze => "\u{2287}".freeze,

    # 228A SUBSET OF WITH NOT EQUAL TO
    # ->   2282 SUBSET OF
    "\u{228A}".freeze => "\u{2282}".freeze,

    # 228B SUPERSET OF WITH NOT EQUAL TO
    # ->   2283 SUPERSET OF
    "\u{228B}".freeze => "\u{2283}".freeze,

    # 22AC DOES NOT PROVE
    # ->   22A2 RIGHT TACK
    "\u{22AC}".freeze => "\u{22A2}".freeze,

    # 22AD NOT TRUE
    # ->   22A8 TRUE
    "\u{22AD}".freeze => "\u{22A8}".freeze,

    # 22AE DOES NOT FORCE
    # ->   22A9 FORCES
    "\u{22AE}".freeze => "\u{22A9}".freeze,

    # 22AF NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
    # ->   22AB DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
    "\u{22AF}".freeze => "\u{22AB}".freeze,

    # 22BE RIGHT ANGLE WITH ARC
    # ->   221F RIGHT ANGLE
    "\u{22BE}".freeze => "\u{221F}".freeze,

    # 22E0 DOES NOT PRECEDE OR EQUAL
    # ->   227C PRECEDES OR EQUAL TO
    "\u{22E0}".freeze => "\u{227C}".freeze,

    # 22E1 DOES NOT SUCCEED OR EQUAL
    # ->   227D SUCCEEDS OR EQUAL TO
    "\u{22E1}".freeze => "\u{227D}".freeze,

    # 22E2 NOT SQUARE IMAGE OF OR EQUAL TO
    # ->   2291 SQUARE IMAGE OF OR EQUAL TO
    "\u{22E2}".freeze => "\u{2291}".freeze,

    # 22E3 NOT SQUARE ORIGINAL OF OR EQUAL TO
    # ->   2292 SQUARE ORIGINAL OF OR EQUAL TO
    "\u{22E3}".freeze => "\u{2292}".freeze,

    # 22EA NOT NORMAL SUBGROUP OF
    # ->   22B2 NORMAL SUBGROUP OF
    "\u{22EA}".freeze => "\u{22B2}".freeze,

    # 22EB DOES NOT CONTAIN AS NORMAL SUBGROUP
    # ->   22B3 CONTAINS AS NORMAL SUBGROUP
    "\u{22EB}".freeze => "\u{22B3}".freeze,

    # 22EC NOT NORMAL SUBGROUP OF OR EQUAL TO
    # ->   22B4 NORMAL SUBGROUP OF OR EQUAL TO
    "\u{22EC}".freeze => "\u{22B4}".freeze,

    # 22ED DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL
    # ->   22B5 CONTAINS AS NORMAL SUBGROUP OR EQUAL TO
    "\u{22ED}".freeze => "\u{22B5}".freeze,

    # 22F2 ELEMENT OF WITH LONG HORIZONTAL STROKE
    # ->   2208 ELEMENT OF
    "\u{22F2}".freeze => "\u{2208}".freeze,

    # 22F3 ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    # ->   2208 ELEMENT OF
    "\u{22F3}".freeze => "\u{2208}".freeze,

    # 22F4 SMALL ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    # ->   220A SMALL ELEMENT OF
    "\u{22F4}".freeze => "\u{220A}".freeze,

    # 22F5 ELEMENT OF WITH DOT ABOVE
    # ->   2208 ELEMENT OF
    "\u{22F5}".freeze => "\u{2208}".freeze,

    # 22F6 ELEMENT OF WITH OVERBAR
    # ->   2208 ELEMENT OF
    "\u{22F6}".freeze => "\u{2208}".freeze,

    # 22F7 SMALL ELEMENT OF WITH OVERBAR
    # ->   220A SMALL ELEMENT OF
    "\u{22F7}".freeze => "\u{220A}".freeze,

    # 22F8 ELEMENT OF WITH UNDERBAR
    # ->   2208 ELEMENT OF
    "\u{22F8}".freeze => "\u{2208}".freeze,

    # 22F9 ELEMENT OF WITH TWO HORIZONTAL STROKES
    # ->   2208 ELEMENT OF
    "\u{22F9}".freeze => "\u{2208}".freeze,

    # 2329 LEFT-POINTING ANGLE BRACKET
    # ->   3008 LEFT ANGLE BRACKET
    "\u{2329}".freeze => "\u{3008}".freeze,

    # 232A RIGHT-POINTING ANGLE BRACKET
    # ->   3009 RIGHT ANGLE BRACKET
    "\u{232A}".freeze => "\u{3009}".freeze,

    # 237C RIGHT ANGLE WITH DOWNWARDS ZIGZAG ARROW
    # ->   221F RIGHT ANGLE
    "\u{237C}".freeze => "\u{221F}".freeze,

    # 237F VERTICAL LINE WITH MIDDLE DOT
    # ->   007C VERTICAL LINE
    "\u{237F}".freeze => '|'.freeze,

    # 2385 WHITE SQUARE WITH CENTRE VERTICAL LINE
    # ->   25A1 WHITE SQUARE
    "\u{2385}".freeze => "\u{25A1}".freeze,

    # 23C1 DENTISTRY SYMBOL LIGHT DOWN AND HORIZONTAL WITH CIRCLE
    # ->   23C9 DENTISTRY SYMBOL LIGHT DOWN AND HORIZONTAL
    "\u{23C1}".freeze => "\u{23C9}".freeze,

    # 23C2 DENTISTRY SYMBOL LIGHT UP AND HORIZONTAL WITH CIRCLE
    # ->   23CA DENTISTRY SYMBOL LIGHT UP AND HORIZONTAL
    "\u{23C2}".freeze => "\u{23CA}".freeze,

    # 23C4 DENTISTRY SYMBOL LIGHT DOWN AND HORIZONTAL WITH TRIANGLE
    # ->   23C9 DENTISTRY SYMBOL LIGHT DOWN AND HORIZONTAL
    "\u{23C4}".freeze => "\u{23C9}".freeze,

    # 23C5 DENTISTRY SYMBOL LIGHT UP AND HORIZONTAL WITH TRIANGLE
    # ->   23CA DENTISTRY SYMBOL LIGHT UP AND HORIZONTAL
    "\u{23C5}".freeze => "\u{23CA}".freeze,

    # 23C7 DENTISTRY SYMBOL LIGHT DOWN AND HORIZONTAL WITH WAVE
    # ->   23C9 DENTISTRY SYMBOL LIGHT DOWN AND HORIZONTAL
    "\u{23C7}".freeze => "\u{23C9}".freeze,

    # 23C8 DENTISTRY SYMBOL LIGHT UP AND HORIZONTAL WITH WAVE
    # ->   23CA DENTISTRY SYMBOL LIGHT UP AND HORIZONTAL
    "\u{23C8}".freeze => "\u{23CA}".freeze,

    # 2460 CIRCLED DIGIT ONE
    # ->   0031 DIGIT ONE
    "\u{2460}".freeze => '1'.freeze,

    # 2461 CIRCLED DIGIT TWO
    # ->   0032 DIGIT TWO
    "\u{2461}".freeze => '2'.freeze,

    # 2462 CIRCLED DIGIT THREE
    # ->   0033 DIGIT THREE
    "\u{2462}".freeze => '3'.freeze,

    # 2463 CIRCLED DIGIT FOUR
    # ->   0034 DIGIT FOUR
    "\u{2463}".freeze => '4'.freeze,

    # 2464 CIRCLED DIGIT FIVE
    # ->   0035 DIGIT FIVE
    "\u{2464}".freeze => '5'.freeze,

    # 2465 CIRCLED DIGIT SIX
    # ->   0036 DIGIT SIX
    "\u{2465}".freeze => '6'.freeze,

    # 2466 CIRCLED DIGIT SEVEN
    # ->   0037 DIGIT SEVEN
    "\u{2466}".freeze => '7'.freeze,

    # 2467 CIRCLED DIGIT EIGHT
    # ->   0038 DIGIT EIGHT
    "\u{2467}".freeze => '8'.freeze,

    # 2468 CIRCLED DIGIT NINE
    # ->   0039 DIGIT NINE
    "\u{2468}".freeze => '9'.freeze,

    # 2469 CIRCLED NUMBER TEN
    # ->   0031 DIGIT ONE
    #    + 0030 DIGIT ZERO
    "\u{2469}".freeze => '10'.freeze,

    # 246A CIRCLED NUMBER ELEVEN
    # ->   0031 DIGIT ONE
    #    + 0031 DIGIT ONE
    "\u{246A}".freeze => '11'.freeze,

    # 246B CIRCLED NUMBER TWELVE
    # ->   0031 DIGIT ONE
    #    + 0032 DIGIT TWO
    "\u{246B}".freeze => '12'.freeze,

    # 246C CIRCLED NUMBER THIRTEEN
    # ->   0031 DIGIT ONE
    #    + 0033 DIGIT THREE
    "\u{246C}".freeze => '13'.freeze,

    # 246D CIRCLED NUMBER FOURTEEN
    # ->   0031 DIGIT ONE
    #    + 0034 DIGIT FOUR
    "\u{246D}".freeze => '14'.freeze,

    # 246E CIRCLED NUMBER FIFTEEN
    # ->   0031 DIGIT ONE
    #    + 0035 DIGIT FIVE
    "\u{246E}".freeze => '15'.freeze,

    # 246F CIRCLED NUMBER SIXTEEN
    # ->   0031 DIGIT ONE
    #    + 0036 DIGIT SIX
    "\u{246F}".freeze => '16'.freeze,

    # 2470 CIRCLED NUMBER SEVENTEEN
    # ->   0031 DIGIT ONE
    #    + 0037 DIGIT SEVEN
    "\u{2470}".freeze => '17'.freeze,

    # 2471 CIRCLED NUMBER EIGHTEEN
    # ->   0031 DIGIT ONE
    #    + 0038 DIGIT EIGHT
    "\u{2471}".freeze => '18'.freeze,

    # 2472 CIRCLED NUMBER NINETEEN
    # ->   0031 DIGIT ONE
    #    + 0039 DIGIT NINE
    "\u{2472}".freeze => '19'.freeze,

    # 2473 CIRCLED NUMBER TWENTY
    # ->   0032 DIGIT TWO
    #    + 0030 DIGIT ZERO
    "\u{2473}".freeze => '20'.freeze,

    # 2474 PARENTHESIZED DIGIT ONE
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0029 RIGHT PARENTHESIS
    "\u{2474}".freeze => '(1)'.freeze,

    # 2475 PARENTHESIZED DIGIT TWO
    # ->   0028 LEFT PARENTHESIS
    #    + 0032 DIGIT TWO
    #    + 0029 RIGHT PARENTHESIS
    "\u{2475}".freeze => '(2)'.freeze,

    # 2476 PARENTHESIZED DIGIT THREE
    # ->   0028 LEFT PARENTHESIS
    #    + 0033 DIGIT THREE
    #    + 0029 RIGHT PARENTHESIS
    "\u{2476}".freeze => '(3)'.freeze,

    # 2477 PARENTHESIZED DIGIT FOUR
    # ->   0028 LEFT PARENTHESIS
    #    + 0034 DIGIT FOUR
    #    + 0029 RIGHT PARENTHESIS
    "\u{2477}".freeze => '(4)'.freeze,

    # 2478 PARENTHESIZED DIGIT FIVE
    # ->   0028 LEFT PARENTHESIS
    #    + 0035 DIGIT FIVE
    #    + 0029 RIGHT PARENTHESIS
    "\u{2478}".freeze => '(5)'.freeze,

    # 2479 PARENTHESIZED DIGIT SIX
    # ->   0028 LEFT PARENTHESIS
    #    + 0036 DIGIT SIX
    #    + 0029 RIGHT PARENTHESIS
    "\u{2479}".freeze => '(6)'.freeze,

    # 247A PARENTHESIZED DIGIT SEVEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0037 DIGIT SEVEN
    #    + 0029 RIGHT PARENTHESIS
    "\u{247A}".freeze => '(7)'.freeze,

    # 247B PARENTHESIZED DIGIT EIGHT
    # ->   0028 LEFT PARENTHESIS
    #    + 0038 DIGIT EIGHT
    #    + 0029 RIGHT PARENTHESIS
    "\u{247B}".freeze => '(8)'.freeze,

    # 247C PARENTHESIZED DIGIT NINE
    # ->   0028 LEFT PARENTHESIS
    #    + 0039 DIGIT NINE
    #    + 0029 RIGHT PARENTHESIS
    "\u{247C}".freeze => '(9)'.freeze,

    # 247D PARENTHESIZED NUMBER TEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0030 DIGIT ZERO
    #    + 0029 RIGHT PARENTHESIS
    "\u{247D}".freeze => '(10)'.freeze,

    # 247E PARENTHESIZED NUMBER ELEVEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0031 DIGIT ONE
    #    + 0029 RIGHT PARENTHESIS
    "\u{247E}".freeze => '(11)'.freeze,

    # 247F PARENTHESIZED NUMBER TWELVE
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0032 DIGIT TWO
    #    + 0029 RIGHT PARENTHESIS
    "\u{247F}".freeze => '(12)'.freeze,

    # 2480 PARENTHESIZED NUMBER THIRTEEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0033 DIGIT THREE
    #    + 0029 RIGHT PARENTHESIS
    "\u{2480}".freeze => '(13)'.freeze,

    # 2481 PARENTHESIZED NUMBER FOURTEEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0034 DIGIT FOUR
    #    + 0029 RIGHT PARENTHESIS
    "\u{2481}".freeze => '(14)'.freeze,

    # 2482 PARENTHESIZED NUMBER FIFTEEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0035 DIGIT FIVE
    #    + 0029 RIGHT PARENTHESIS
    "\u{2482}".freeze => '(15)'.freeze,

    # 2483 PARENTHESIZED NUMBER SIXTEEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0036 DIGIT SIX
    #    + 0029 RIGHT PARENTHESIS
    "\u{2483}".freeze => '(16)'.freeze,

    # 2484 PARENTHESIZED NUMBER SEVENTEEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0037 DIGIT SEVEN
    #    + 0029 RIGHT PARENTHESIS
    "\u{2484}".freeze => '(17)'.freeze,

    # 2485 PARENTHESIZED NUMBER EIGHTEEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0038 DIGIT EIGHT
    #    + 0029 RIGHT PARENTHESIS
    "\u{2485}".freeze => '(18)'.freeze,

    # 2486 PARENTHESIZED NUMBER NINETEEN
    # ->   0028 LEFT PARENTHESIS
    #    + 0031 DIGIT ONE
    #    + 0039 DIGIT NINE
    #    + 0029 RIGHT PARENTHESIS
    "\u{2486}".freeze => '(19)'.freeze,

    # 2487 PARENTHESIZED NUMBER TWENTY
    # ->   0028 LEFT PARENTHESIS
    #    + 0032 DIGIT TWO
    #    + 0030 DIGIT ZERO
    #    + 0029 RIGHT PARENTHESIS
    "\u{2487}".freeze => '(20)'.freeze,

    # 2488 DIGIT ONE FULL STOP
    # ->   0031 DIGIT ONE
    #    + 002E FULL STOP
    "\u{2488}".freeze => '1.'.freeze,

    # 2489 DIGIT TWO FULL STOP
    # ->   0032 DIGIT TWO
    #    + 002E FULL STOP
    "\u{2489}".freeze => '2.'.freeze,

    # 248A DIGIT THREE FULL STOP
    # ->   0033 DIGIT THREE
    #    + 002E FULL STOP
    "\u{248A}".freeze => '3.'.freeze,

    # 248B DIGIT FOUR FULL STOP
    # ->   0034 DIGIT FOUR
    #    + 002E FULL STOP
    "\u{248B}".freeze => '4.'.freeze,

    # 248C DIGIT FIVE FULL STOP
    # ->   0035 DIGIT FIVE
    #    + 002E FULL STOP
    "\u{248C}".freeze => '5.'.freeze,

    # 248D DIGIT SIX FULL STOP
    # ->   0036 DIGIT SIX
    #    + 002E FULL STOP
    "\u{248D}".freeze => '6.'.freeze,

    # 248E DIGIT SEVEN FULL STOP
    # ->   0037 DIGIT SEVEN
    #    + 002E FULL STOP
    "\u{248E}".freeze => '7.'.freeze,

    # 248F DIGIT EIGHT FULL STOP
    # ->   0038 DIGIT EIGHT
    #    + 002E FULL STOP
    "\u{248F}".freeze => '8.'.freeze,

    # 2490 DIGIT NINE FULL STOP
    # ->   0039 DIGIT NINE
    #    + 002E FULL STOP
    "\u{2490}".freeze => '9.'.freeze,

    # 2491 NUMBER TEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0030 DIGIT ZERO
    #    + 002E FULL STOP
    "\u{2491}".freeze => '10.'.freeze,

    # 2492 NUMBER ELEVEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0031 DIGIT ONE
    #    + 002E FULL STOP
    "\u{2492}".freeze => '11.'.freeze,

    # 2493 NUMBER TWELVE FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0032 DIGIT TWO
    #    + 002E FULL STOP
    "\u{2493}".freeze => '12.'.freeze,

    # 2494 NUMBER THIRTEEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0033 DIGIT THREE
    #    + 002E FULL STOP
    "\u{2494}".freeze => '13.'.freeze,

    # 2495 NUMBER FOURTEEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0034 DIGIT FOUR
    #    + 002E FULL STOP
    "\u{2495}".freeze => '14.'.freeze,

    # 2496 NUMBER FIFTEEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0035 DIGIT FIVE
    #    + 002E FULL STOP
    "\u{2496}".freeze => '15.'.freeze,

    # 2497 NUMBER SIXTEEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0036 DIGIT SIX
    #    + 002E FULL STOP
    "\u{2497}".freeze => '16.'.freeze,

    # 2498 NUMBER SEVENTEEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0037 DIGIT SEVEN
    #    + 002E FULL STOP
    "\u{2498}".freeze => '17.'.freeze,

    # 2499 NUMBER EIGHTEEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0038 DIGIT EIGHT
    #    + 002E FULL STOP
    "\u{2499}".freeze => '18.'.freeze,

    # 249A NUMBER NINETEEN FULL STOP
    # ->   0031 DIGIT ONE
    #    + 0039 DIGIT NINE
    #    + 002E FULL STOP
    "\u{249A}".freeze => '19.'.freeze,

    # 249B NUMBER TWENTY FULL STOP
    # ->   0032 DIGIT TWO
    #    + 0030 DIGIT ZERO
    #    + 002E FULL STOP
    "\u{249B}".freeze => '20.'.freeze,

    # 249C PARENTHESIZED LATIN SMALL LETTER A
    # ->   0028 LEFT PARENTHESIS
    #    + 0061 LATIN SMALL LETTER A
    #    + 0029 RIGHT PARENTHESIS
    "\u{249C}".freeze => '(a)'.freeze,

    # 249D PARENTHESIZED LATIN SMALL LETTER B
    # ->   0028 LEFT PARENTHESIS
    #    + 0062 LATIN SMALL LETTER B
    #    + 0029 RIGHT PARENTHESIS
    "\u{249D}".freeze => '(b)'.freeze,

    # 249E PARENTHESIZED LATIN SMALL LETTER C
    # ->   0028 LEFT PARENTHESIS
    #    + 0063 LATIN SMALL LETTER C
    #    + 0029 RIGHT PARENTHESIS
    "\u{249E}".freeze => '(c)'.freeze,

    # 249F PARENTHESIZED LATIN SMALL LETTER D
    # ->   0028 LEFT PARENTHESIS
    #    + 0064 LATIN SMALL LETTER D
    #    + 0029 RIGHT PARENTHESIS
    "\u{249F}".freeze => '(d)'.freeze,

    # 24A0 PARENTHESIZED LATIN SMALL LETTER E
    # ->   0028 LEFT PARENTHESIS
    #    + 0065 LATIN SMALL LETTER E
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A0}".freeze => '(e)'.freeze,

    # 24A1 PARENTHESIZED LATIN SMALL LETTER F
    # ->   0028 LEFT PARENTHESIS
    #    + 0066 LATIN SMALL LETTER F
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A1}".freeze => '(f)'.freeze,

    # 24A2 PARENTHESIZED LATIN SMALL LETTER G
    # ->   0028 LEFT PARENTHESIS
    #    + 0067 LATIN SMALL LETTER G
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A2}".freeze => '(g)'.freeze,

    # 24A3 PARENTHESIZED LATIN SMALL LETTER H
    # ->   0028 LEFT PARENTHESIS
    #    + 0068 LATIN SMALL LETTER H
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A3}".freeze => '(h)'.freeze,

    # 24A4 PARENTHESIZED LATIN SMALL LETTER I
    # ->   0028 LEFT PARENTHESIS
    #    + 0069 LATIN SMALL LETTER I
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A4}".freeze => '(i)'.freeze,

    # 24A5 PARENTHESIZED LATIN SMALL LETTER J
    # ->   0028 LEFT PARENTHESIS
    #    + 006A LATIN SMALL LETTER J
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A5}".freeze => '(j)'.freeze,

    # 24A6 PARENTHESIZED LATIN SMALL LETTER K
    # ->   0028 LEFT PARENTHESIS
    #    + 006B LATIN SMALL LETTER K
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A6}".freeze => '(k)'.freeze,

    # 24A7 PARENTHESIZED LATIN SMALL LETTER L
    # ->   0028 LEFT PARENTHESIS
    #    + 006C LATIN SMALL LETTER L
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A7}".freeze => '(l)'.freeze,

    # 24A8 PARENTHESIZED LATIN SMALL LETTER M
    # ->   0028 LEFT PARENTHESIS
    #    + 006D LATIN SMALL LETTER M
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A8}".freeze => '(m)'.freeze,

    # 24A9 PARENTHESIZED LATIN SMALL LETTER N
    # ->   0028 LEFT PARENTHESIS
    #    + 006E LATIN SMALL LETTER N
    #    + 0029 RIGHT PARENTHESIS
    "\u{24A9}".freeze => '(n)'.freeze,

    # 24AA PARENTHESIZED LATIN SMALL LETTER O
    # ->   0028 LEFT PARENTHESIS
    #    + 006F LATIN SMALL LETTER O
    #    + 0029 RIGHT PARENTHESIS
    "\u{24AA}".freeze => '(o)'.freeze,

    # 24AB PARENTHESIZED LATIN SMALL LETTER P
    # ->   0028 LEFT PARENTHESIS
    #    + 0070 LATIN SMALL LETTER P
    #    + 0029 RIGHT PARENTHESIS
    "\u{24AB}".freeze => '(p)'.freeze,

    # 24AC PARENTHESIZED LATIN SMALL LETTER Q
    # ->   0028 LEFT PARENTHESIS
    #    + 0071 LATIN SMALL LETTER Q
    #    + 0029 RIGHT PARENTHESIS
    "\u{24AC}".freeze => '(q)'.freeze,

    # 24AD PARENTHESIZED LATIN SMALL LETTER R
    # ->   0028 LEFT PARENTHESIS
    #    + 0072 LATIN SMALL LETTER R
    #    + 0029 RIGHT PARENTHESIS
    "\u{24AD}".freeze => '(r)'.freeze,

    # 24AE PARENTHESIZED LATIN SMALL LETTER S
    # ->   0028 LEFT PARENTHESIS
    #    + 0073 LATIN SMALL LETTER S
    #    + 0029 RIGHT PARENTHESIS
    "\u{24AE}".freeze => '(s)'.freeze,

    # 24AF PARENTHESIZED LATIN SMALL LETTER T
    # ->   0028 LEFT PARENTHESIS
    #    + 0074 LATIN SMALL LETTER T
    #    + 0029 RIGHT PARENTHESIS
    "\u{24AF}".freeze => '(t)'.freeze,

    # 24B0 PARENTHESIZED LATIN SMALL LETTER U
    # ->   0028 LEFT PARENTHESIS
    #    + 0075 LATIN SMALL LETTER U
    #    + 0029 RIGHT PARENTHESIS
    "\u{24B0}".freeze => '(u)'.freeze,

    # 24B1 PARENTHESIZED LATIN SMALL LETTER V
    # ->   0028 LEFT PARENTHESIS
    #    + 0076 LATIN SMALL LETTER V
    #    + 0029 RIGHT PARENTHESIS
    "\u{24B1}".freeze => '(v)'.freeze,

    # 24B2 PARENTHESIZED LATIN SMALL LETTER W
    # ->   0028 LEFT PARENTHESIS
    #    + 0077 LATIN SMALL LETTER W
    #    + 0029 RIGHT PARENTHESIS
    "\u{24B2}".freeze => '(w)'.freeze,

    # 24B3 PARENTHESIZED LATIN SMALL LETTER X
    # ->   0028 LEFT PARENTHESIS
    #    + 0078 LATIN SMALL LETTER X
    #    + 0029 RIGHT PARENTHESIS
    "\u{24B3}".freeze => '(x)'.freeze,

    # 24B4 PARENTHESIZED LATIN SMALL LETTER Y
    # ->   0028 LEFT PARENTHESIS
    #    + 0079 LATIN SMALL LETTER Y
    #    + 0029 RIGHT PARENTHESIS
    "\u{24B4}".freeze => '(y)'.freeze,

    # 24B5 PARENTHESIZED LATIN SMALL LETTER Z
    # ->   0028 LEFT PARENTHESIS
    #    + 007A LATIN SMALL LETTER Z
    #    + 0029 RIGHT PARENTHESIS
    "\u{24B5}".freeze => '(z)'.freeze,

    # 24B6 CIRCLED LATIN CAPITAL LETTER A
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{24B6}".freeze => 'A'.freeze,

    # 24B7 CIRCLED LATIN CAPITAL LETTER B
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{24B7}".freeze => 'B'.freeze,

    # 24B8 CIRCLED LATIN CAPITAL LETTER C
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{24B8}".freeze => 'C'.freeze,

    # 24B9 CIRCLED LATIN CAPITAL LETTER D
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{24B9}".freeze => 'D'.freeze,

    # 24BA CIRCLED LATIN CAPITAL LETTER E
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{24BA}".freeze => 'E'.freeze,

    # 24BB CIRCLED LATIN CAPITAL LETTER F
    # ->   0046 LATIN CAPITAL LETTER F
    "\u{24BB}".freeze => 'F'.freeze,

    # 24BC CIRCLED LATIN CAPITAL LETTER G
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{24BC}".freeze => 'G'.freeze,

    # 24BD CIRCLED LATIN CAPITAL LETTER H
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{24BD}".freeze => 'H'.freeze,

    # 24BE CIRCLED LATIN CAPITAL LETTER I
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{24BE}".freeze => 'I'.freeze,

    # 24BF CIRCLED LATIN CAPITAL LETTER J
    # ->   004A LATIN CAPITAL LETTER J
    "\u{24BF}".freeze => 'J'.freeze,

    # 24C0 CIRCLED LATIN CAPITAL LETTER K
    # ->   004B LATIN CAPITAL LETTER K
    "\u{24C0}".freeze => 'K'.freeze,

    # 24C1 CIRCLED LATIN CAPITAL LETTER L
    # ->   004C LATIN CAPITAL LETTER L
    "\u{24C1}".freeze => 'L'.freeze,

    # 24C2 CIRCLED LATIN CAPITAL LETTER M
    # ->   004D LATIN CAPITAL LETTER M
    "\u{24C2}".freeze => 'M'.freeze,

    # 24C3 CIRCLED LATIN CAPITAL LETTER N
    # ->   004E LATIN CAPITAL LETTER N
    "\u{24C3}".freeze => 'N'.freeze,

    # 24C4 CIRCLED LATIN CAPITAL LETTER O
    # ->   004F LATIN CAPITAL LETTER O
    "\u{24C4}".freeze => 'O'.freeze,

    # 24C5 CIRCLED LATIN CAPITAL LETTER P
    # ->   0050 LATIN CAPITAL LETTER P
    "\u{24C5}".freeze => 'P'.freeze,

    # 24C6 CIRCLED LATIN CAPITAL LETTER Q
    # ->   0051 LATIN CAPITAL LETTER Q
    "\u{24C6}".freeze => 'Q'.freeze,

    # 24C7 CIRCLED LATIN CAPITAL LETTER R
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{24C7}".freeze => 'R'.freeze,

    # 24C8 CIRCLED LATIN CAPITAL LETTER S
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{24C8}".freeze => 'S'.freeze,

    # 24C9 CIRCLED LATIN CAPITAL LETTER T
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{24C9}".freeze => 'T'.freeze,

    # 24CA CIRCLED LATIN CAPITAL LETTER U
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{24CA}".freeze => 'U'.freeze,

    # 24CB CIRCLED LATIN CAPITAL LETTER V
    # ->   0056 LATIN CAPITAL LETTER V
    "\u{24CB}".freeze => 'V'.freeze,

    # 24CC CIRCLED LATIN CAPITAL LETTER W
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{24CC}".freeze => 'W'.freeze,

    # 24CD CIRCLED LATIN CAPITAL LETTER X
    # ->   0058 LATIN CAPITAL LETTER X
    "\u{24CD}".freeze => 'X'.freeze,

    # 24CE CIRCLED LATIN CAPITAL LETTER Y
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{24CE}".freeze => 'Y'.freeze,

    # 24CF CIRCLED LATIN CAPITAL LETTER Z
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{24CF}".freeze => 'Z'.freeze,

    # 24D0 CIRCLED LATIN SMALL LETTER A
    # ->   0061 LATIN SMALL LETTER A
    "\u{24D0}".freeze => 'a'.freeze,

    # 24D1 CIRCLED LATIN SMALL LETTER B
    # ->   0062 LATIN SMALL LETTER B
    "\u{24D1}".freeze => 'b'.freeze,

    # 24D2 CIRCLED LATIN SMALL LETTER C
    # ->   0063 LATIN SMALL LETTER C
    "\u{24D2}".freeze => 'c'.freeze,

    # 24D3 CIRCLED LATIN SMALL LETTER D
    # ->   0064 LATIN SMALL LETTER D
    "\u{24D3}".freeze => 'd'.freeze,

    # 24D4 CIRCLED LATIN SMALL LETTER E
    # ->   0065 LATIN SMALL LETTER E
    "\u{24D4}".freeze => 'e'.freeze,

    # 24D5 CIRCLED LATIN SMALL LETTER F
    # ->   0066 LATIN SMALL LETTER F
    "\u{24D5}".freeze => 'f'.freeze,

    # 24D6 CIRCLED LATIN SMALL LETTER G
    # ->   0067 LATIN SMALL LETTER G
    "\u{24D6}".freeze => 'g'.freeze,

    # 24D7 CIRCLED LATIN SMALL LETTER H
    # ->   0068 LATIN SMALL LETTER H
    "\u{24D7}".freeze => 'h'.freeze,

    # 24D8 CIRCLED LATIN SMALL LETTER I
    # ->   0069 LATIN SMALL LETTER I
    "\u{24D8}".freeze => 'i'.freeze,

    # 24D9 CIRCLED LATIN SMALL LETTER J
    # ->   006A LATIN SMALL LETTER J
    "\u{24D9}".freeze => 'j'.freeze,

    # 24DA CIRCLED LATIN SMALL LETTER K
    # ->   006B LATIN SMALL LETTER K
    "\u{24DA}".freeze => 'k'.freeze,

    # 24DB CIRCLED LATIN SMALL LETTER L
    # ->   006C LATIN SMALL LETTER L
    "\u{24DB}".freeze => 'l'.freeze,

    # 24DC CIRCLED LATIN SMALL LETTER M
    # ->   006D LATIN SMALL LETTER M
    "\u{24DC}".freeze => 'm'.freeze,

    # 24DD CIRCLED LATIN SMALL LETTER N
    # ->   006E LATIN SMALL LETTER N
    "\u{24DD}".freeze => 'n'.freeze,

    # 24DE CIRCLED LATIN SMALL LETTER O
    # ->   006F LATIN SMALL LETTER O
    "\u{24DE}".freeze => 'o'.freeze,

    # 24DF CIRCLED LATIN SMALL LETTER P
    # ->   0070 LATIN SMALL LETTER P
    "\u{24DF}".freeze => 'p'.freeze,

    # 24E0 CIRCLED LATIN SMALL LETTER Q
    # ->   0071 LATIN SMALL LETTER Q
    "\u{24E0}".freeze => 'q'.freeze,

    # 24E1 CIRCLED LATIN SMALL LETTER R
    # ->   0072 LATIN SMALL LETTER R
    "\u{24E1}".freeze => 'r'.freeze,

    # 24E2 CIRCLED LATIN SMALL LETTER S
    # ->   0073 LATIN SMALL LETTER S
    "\u{24E2}".freeze => 's'.freeze,

    # 24E3 CIRCLED LATIN SMALL LETTER T
    # ->   0074 LATIN SMALL LETTER T
    "\u{24E3}".freeze => 't'.freeze,

    # 24E4 CIRCLED LATIN SMALL LETTER U
    # ->   0075 LATIN SMALL LETTER U
    "\u{24E4}".freeze => 'u'.freeze,

    # 24E5 CIRCLED LATIN SMALL LETTER V
    # ->   0076 LATIN SMALL LETTER V
    "\u{24E5}".freeze => 'v'.freeze,

    # 24E6 CIRCLED LATIN SMALL LETTER W
    # ->   0077 LATIN SMALL LETTER W
    "\u{24E6}".freeze => 'w'.freeze,

    # 24E7 CIRCLED LATIN SMALL LETTER X
    # ->   0078 LATIN SMALL LETTER X
    "\u{24E7}".freeze => 'x'.freeze,

    # 24E8 CIRCLED LATIN SMALL LETTER Y
    # ->   0079 LATIN SMALL LETTER Y
    "\u{24E8}".freeze => 'y'.freeze,

    # 24E9 CIRCLED LATIN SMALL LETTER Z
    # ->   007A LATIN SMALL LETTER Z
    "\u{24E9}".freeze => 'z'.freeze,

    # 24EA CIRCLED DIGIT ZERO
    # ->   0030 DIGIT ZERO
    "\u{24EA}".freeze => '0'.freeze,

    # 25A2 WHITE SQUARE WITH ROUNDED CORNERS
    # ->   25A1 WHITE SQUARE
    "\u{25A2}".freeze => "\u{25A1}".freeze,

    # 25EB WHITE SQUARE WITH VERTICAL BISECTING LINE
    # ->   25A1 WHITE SQUARE
    "\u{25EB}".freeze => "\u{25A1}".freeze,

    # 25EC WHITE UP-POINTING TRIANGLE WITH DOT
    # ->   25B3 WHITE UP-POINTING TRIANGLE
    "\u{25EC}".freeze => "\u{25B3}".freeze,

    # 25F0 WHITE SQUARE WITH UPPER LEFT QUADRANT
    # ->   25A1 WHITE SQUARE
    "\u{25F0}".freeze => "\u{25A1}".freeze,

    # 25F1 WHITE SQUARE WITH LOWER LEFT QUADRANT
    # ->   25A1 WHITE SQUARE
    "\u{25F1}".freeze => "\u{25A1}".freeze,

    # 25F2 WHITE SQUARE WITH LOWER RIGHT QUADRANT
    # ->   25A1 WHITE SQUARE
    "\u{25F2}".freeze => "\u{25A1}".freeze,

    # 25F3 WHITE SQUARE WITH UPPER RIGHT QUADRANT
    # ->   25A1 WHITE SQUARE
    "\u{25F3}".freeze => "\u{25A1}".freeze,

    # 25F4 WHITE CIRCLE WITH UPPER LEFT QUADRANT
    # ->   25CB WHITE CIRCLE
    "\u{25F4}".freeze => "\u{25CB}".freeze,

    # 25F5 WHITE CIRCLE WITH LOWER LEFT QUADRANT
    # ->   25CB WHITE CIRCLE
    "\u{25F5}".freeze => "\u{25CB}".freeze,

    # 25F6 WHITE CIRCLE WITH LOWER RIGHT QUADRANT
    # ->   25CB WHITE CIRCLE
    "\u{25F6}".freeze => "\u{25CB}".freeze,

    # 25F7 WHITE CIRCLE WITH UPPER RIGHT QUADRANT
    # ->   25CB WHITE CIRCLE
    "\u{25F7}".freeze => "\u{25CB}".freeze,

    # 2611 BALLOT BOX WITH CHECK
    # ->   2610 BALLOT BOX
    "\u{2611}".freeze => "\u{2610}".freeze,

    # 2612 BALLOT BOX WITH X
    # ->   2610 BALLOT BOX
    "\u{2612}".freeze => "\u{2610}".freeze,

    # 2614 UMBRELLA WITH RAIN DROPS
    # ->   2602 UMBRELLA
    "\u{2614}".freeze => "\u{2602}".freeze,

    # 2686 WHITE CIRCLE WITH DOT RIGHT
    # ->   25CB WHITE CIRCLE
    "\u{2686}".freeze => "\u{25CB}".freeze,

    # 2687 WHITE CIRCLE WITH TWO DOTS
    # ->   25CB WHITE CIRCLE
    "\u{2687}".freeze => "\u{25CB}".freeze,

    # 2688 BLACK CIRCLE WITH WHITE DOT RIGHT
    # ->   25CF BLACK CIRCLE
    "\u{2688}".freeze => "\u{25CF}".freeze,

    # 2689 BLACK CIRCLE WITH TWO WHITE DOTS
    # ->   25CF BLACK CIRCLE
    "\u{2689}".freeze => "\u{25CF}".freeze,

    # 27D0 WHITE DIAMOND WITH CENTRED DOT
    # ->   25C7 WHITE DIAMOND
    "\u{27D0}".freeze => "\u{25C7}".freeze,

    # 27DF UP TACK WITH CIRCLE ABOVE
    # ->   22A5 UP TACK
    "\u{27DF}".freeze => "\u{22A5}".freeze,

    # 27E2 WHITE CONCAVE-SIDED DIAMOND WITH LEFTWARDS TICK
    # ->   27E1 WHITE CONCAVE-SIDED DIAMOND
    "\u{27E2}".freeze => "\u{27E1}".freeze,

    # 27E3 WHITE CONCAVE-SIDED DIAMOND WITH RIGHTWARDS TICK
    # ->   27E1 WHITE CONCAVE-SIDED DIAMOND
    "\u{27E3}".freeze => "\u{27E1}".freeze,

    # 27E4 WHITE SQUARE WITH LEFTWARDS TICK
    # ->   25A1 WHITE SQUARE
    "\u{27E4}".freeze => "\u{25A1}".freeze,

    # 27E5 WHITE SQUARE WITH RIGHTWARDS TICK
    # ->   25A1 WHITE SQUARE
    "\u{27E5}".freeze => "\u{25A1}".freeze,

    # 2902 LEFTWARDS DOUBLE ARROW WITH VERTICAL STROKE
    # ->   21D0 LEFTWARDS DOUBLE ARROW
    "\u{2902}".freeze => "\u{21D0}".freeze,

    # 2903 RIGHTWARDS DOUBLE ARROW WITH VERTICAL STROKE
    # ->   21D2 RIGHTWARDS DOUBLE ARROW
    "\u{2903}".freeze => "\u{21D2}".freeze,

    # 2904 LEFT RIGHT DOUBLE ARROW WITH VERTICAL STROKE
    # ->   21D4 LEFT RIGHT DOUBLE ARROW
    "\u{2904}".freeze => "\u{21D4}".freeze,

    # 2908 DOWNWARDS ARROW WITH HORIZONTAL STROKE
    # ->   2193 DOWNWARDS ARROW
    "\u{2908}".freeze => "\u{2193}".freeze,

    # 2909 UPWARDS ARROW WITH HORIZONTAL STROKE
    # ->   2191 UPWARDS ARROW
    "\u{2909}".freeze => "\u{2191}".freeze,

    # 2911 RIGHTWARDS ARROW WITH DOTTED STEM
    # ->   2192 RIGHTWARDS ARROW
    "\u{2911}".freeze => "\u{2192}".freeze,

    # 2914 RIGHTWARDS ARROW WITH TAIL WITH VERTICAL STROKE
    # ->   2192 RIGHTWARDS ARROW
    "\u{2914}".freeze => "\u{2192}".freeze,

    # 2915 RIGHTWARDS ARROW WITH TAIL WITH DOUBLE VERTICAL STROKE
    # ->   2192 RIGHTWARDS ARROW
    "\u{2915}".freeze => "\u{2192}".freeze,

    # 2923 NORTH WEST ARROW WITH HOOK
    # ->   2196 NORTH WEST ARROW
    "\u{2923}".freeze => "\u{2196}".freeze,

    # 2924 NORTH EAST ARROW WITH HOOK
    # ->   2197 NORTH EAST ARROW
    "\u{2924}".freeze => "\u{2197}".freeze,

    # 2925 SOUTH EAST ARROW WITH HOOK
    # ->   2198 SOUTH EAST ARROW
    "\u{2925}".freeze => "\u{2198}".freeze,

    # 2926 SOUTH WEST ARROW WITH HOOK
    # ->   2199 SOUTH WEST ARROW
    "\u{2926}".freeze => "\u{2199}".freeze,

    # 293D TOP ARC ANTICLOCKWISE ARROW WITH PLUS
    # ->   293A TOP ARC ANTICLOCKWISE ARROW
    "\u{293D}".freeze => "\u{293A}".freeze,

    # 2945 RIGHTWARDS ARROW WITH PLUS BELOW
    # ->   2192 RIGHTWARDS ARROW
    "\u{2945}".freeze => "\u{2192}".freeze,

    # 2946 LEFTWARDS ARROW WITH PLUS BELOW
    # ->   2190 LEFTWARDS ARROW
    "\u{2946}".freeze => "\u{2190}".freeze,

    # 298B LEFT SQUARE BRACKET WITH UNDERBAR
    # ->   005B LEFT SQUARE BRACKET
    "\u{298B}".freeze => '['.freeze,

    # 298C RIGHT SQUARE BRACKET WITH UNDERBAR
    # ->   005D RIGHT SQUARE BRACKET
    "\u{298C}".freeze => ']'.freeze,

    # 298D LEFT SQUARE BRACKET WITH TICK IN TOP CORNER
    # ->   005B LEFT SQUARE BRACKET
    "\u{298D}".freeze => '['.freeze,

    # 298E RIGHT SQUARE BRACKET WITH TICK IN BOTTOM CORNER
    # ->   005D RIGHT SQUARE BRACKET
    "\u{298E}".freeze => ']'.freeze,

    # 298F LEFT SQUARE BRACKET WITH TICK IN BOTTOM CORNER
    # ->   005B LEFT SQUARE BRACKET
    "\u{298F}".freeze => '['.freeze,

    # 2990 RIGHT SQUARE BRACKET WITH TICK IN TOP CORNER
    # ->   005D RIGHT SQUARE BRACKET
    "\u{2990}".freeze => ']'.freeze,

    # 2991 LEFT ANGLE BRACKET WITH DOT
    # ->   3008 LEFT ANGLE BRACKET
    "\u{2991}".freeze => "\u{3008}".freeze,

    # 2992 RIGHT ANGLE BRACKET WITH DOT
    # ->   3009 RIGHT ANGLE BRACKET
    "\u{2992}".freeze => "\u{3009}".freeze,

    # 299E ANGLE WITH S INSIDE
    # ->   2220 ANGLE
    "\u{299E}".freeze => "\u{2220}".freeze,

    # 29A4 ANGLE WITH UNDERBAR
    # ->   2220 ANGLE
    "\u{29A4}".freeze => "\u{2220}".freeze,

    # 29A5 REVERSED ANGLE WITH UNDERBAR
    # ->   29A3 REVERSED ANGLE
    "\u{29A5}".freeze => "\u{29A3}".freeze,

    # 29A8 MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING UP AND RIGHT
    # ->   2221 MEASURED ANGLE
    "\u{29A8}".freeze => "\u{2221}".freeze,

    # 29A9 MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING UP AND LEFT
    # ->   2221 MEASURED ANGLE
    "\u{29A9}".freeze => "\u{2221}".freeze,

    # 29AA MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING DOWN AND RIGHT
    # ->   2221 MEASURED ANGLE
    "\u{29AA}".freeze => "\u{2221}".freeze,

    # 29AB MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING DOWN AND LEFT
    # ->   2221 MEASURED ANGLE
    "\u{29AB}".freeze => "\u{2221}".freeze,

    # 29AC MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING RIGHT AND UP
    # ->   2221 MEASURED ANGLE
    "\u{29AC}".freeze => "\u{2221}".freeze,

    # 29AD MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING LEFT AND UP
    # ->   2221 MEASURED ANGLE
    "\u{29AD}".freeze => "\u{2221}".freeze,

    # 29AE MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING RIGHT AND DOWN
    # ->   2221 MEASURED ANGLE
    "\u{29AE}".freeze => "\u{2221}".freeze,

    # 29AF MEASURED ANGLE WITH OPEN ARM ENDING IN ARROW POINTING LEFT AND DOWN
    # ->   2221 MEASURED ANGLE
    "\u{29AF}".freeze => "\u{2221}".freeze,

    # 29B1 EMPTY SET WITH OVERBAR
    # ->   2205 EMPTY SET
    "\u{29B1}".freeze => "\u{2205}".freeze,

    # 29B2 EMPTY SET WITH SMALL CIRCLE ABOVE
    # ->   2205 EMPTY SET
    "\u{29B2}".freeze => "\u{2205}".freeze,

    # 29B3 EMPTY SET WITH RIGHT ARROW ABOVE
    # ->   2205 EMPTY SET
    "\u{29B3}".freeze => "\u{2205}".freeze,

    # 29B4 EMPTY SET WITH LEFT ARROW ABOVE
    # ->   2205 EMPTY SET
    "\u{29B4}".freeze => "\u{2205}".freeze,

    # 29D1 BOWTIE WITH LEFT HALF BLACK
    # ->   22C8 BOWTIE
    "\u{29D1}".freeze => "\u{22C8}".freeze,

    # 29D2 BOWTIE WITH RIGHT HALF BLACK
    # ->   22C8 BOWTIE
    "\u{29D2}".freeze => "\u{22C8}".freeze,

    # 29E4 EQUALS SIGN AND SLANTED PARALLEL WITH TILDE ABOVE
    # ->   29E3 EQUALS SIGN AND SLANTED PARALLEL
    "\u{29E4}".freeze => "\u{29E3}".freeze,

    # 29EA BLACK DIAMOND WITH DOWN ARROW
    # ->   25C6 BLACK DIAMOND
    "\u{29EA}".freeze => "\u{25C6}".freeze,

    # 29EC WHITE CIRCLE WITH DOWN ARROW
    # ->   25CB WHITE CIRCLE
    "\u{29EC}".freeze => "\u{25CB}".freeze,

    # 29ED BLACK CIRCLE WITH DOWN ARROW
    # ->   25CF BLACK CIRCLE
    "\u{29ED}".freeze => "\u{25CF}".freeze,

    # 29F6 SOLIDUS WITH OVERBAR
    # ->   002F SOLIDUS
    "\u{29F6}".freeze => '/'.freeze,

    # 29F7 REVERSE SOLIDUS WITH HORIZONTAL STROKE
    # ->   005C REVERSE SOLIDUS
    "\u{29F7}".freeze => "\\".freeze,

    # 2A0C QUADRUPLE INTEGRAL OPERATOR
    # ->   222B INTEGRAL
    #    + 222B INTEGRAL
    #    + 222B INTEGRAL
    #    + 222B INTEGRAL
    "\u{2A0C}".freeze => "\u{222B}\u{222B}\u{222B}\u{222B}".freeze,

    # 2A0E INTEGRAL WITH DOUBLE STROKE
    # ->   222B INTEGRAL
    "\u{2A0E}".freeze => "\u{222B}".freeze,

    # 2A17 INTEGRAL WITH LEFTWARDS ARROW WITH HOOK
    # ->   222B INTEGRAL
    "\u{2A17}".freeze => "\u{222B}".freeze,

    # 2A18 INTEGRAL WITH TIMES SIGN
    # ->   222B INTEGRAL
    "\u{2A18}".freeze => "\u{222B}".freeze,

    # 2A19 INTEGRAL WITH INTERSECTION
    # ->   222B INTEGRAL
    "\u{2A19}".freeze => "\u{222B}".freeze,

    # 2A1A INTEGRAL WITH UNION
    # ->   222B INTEGRAL
    "\u{2A1A}".freeze => "\u{222B}".freeze,

    # 2A1B INTEGRAL WITH OVERBAR
    # ->   222B INTEGRAL
    "\u{2A1B}".freeze => "\u{222B}".freeze,

    # 2A1C INTEGRAL WITH UNDERBAR
    # ->   222B INTEGRAL
    "\u{2A1C}".freeze => "\u{222B}".freeze,

    # 2A22 PLUS SIGN WITH SMALL CIRCLE ABOVE
    # ->   002B PLUS SIGN
    "\u{2A22}".freeze => '+'.freeze,

    # 2A23 PLUS SIGN WITH CIRCUMFLEX ACCENT ABOVE
    # ->   002B PLUS SIGN
    "\u{2A23}".freeze => '+'.freeze,

    # 2A24 PLUS SIGN WITH TILDE ABOVE
    # ->   002B PLUS SIGN
    "\u{2A24}".freeze => '+'.freeze,

    # 2A25 PLUS SIGN WITH DOT BELOW
    # ->   002B PLUS SIGN
    "\u{2A25}".freeze => '+'.freeze,

    # 2A26 PLUS SIGN WITH TILDE BELOW
    # ->   002B PLUS SIGN
    "\u{2A26}".freeze => '+'.freeze,

    # 2A27 PLUS SIGN WITH SUBSCRIPT TWO
    # ->   002B PLUS SIGN
    "\u{2A27}".freeze => '+'.freeze,

    # 2A28 PLUS SIGN WITH BLACK TRIANGLE
    # ->   002B PLUS SIGN
    "\u{2A28}".freeze => '+'.freeze,

    # 2A29 MINUS SIGN WITH COMMA ABOVE
    # ->   2212 MINUS SIGN
    "\u{2A29}".freeze => "\u{2212}".freeze,

    # 2A2A MINUS SIGN WITH DOT BELOW
    # ->   2212 MINUS SIGN
    "\u{2A2A}".freeze => "\u{2212}".freeze,

    # 2A2B MINUS SIGN WITH FALLING DOTS
    # ->   2212 MINUS SIGN
    "\u{2A2B}".freeze => "\u{2212}".freeze,

    # 2A2C MINUS SIGN WITH RISING DOTS
    # ->   2212 MINUS SIGN
    "\u{2A2C}".freeze => "\u{2212}".freeze,

    # 2A30 MULTIPLICATION SIGN WITH DOT ABOVE
    # ->   00D7 MULTIPLICATION SIGN
    "\u{2A30}".freeze => "\u{D7}".freeze,

    # 2A31 MULTIPLICATION SIGN WITH UNDERBAR
    # ->   00D7 MULTIPLICATION SIGN
    "\u{2A31}".freeze => "\u{D7}".freeze,

    # 2A40 INTERSECTION WITH DOT
    # ->   2229 INTERSECTION
    "\u{2A40}".freeze => "\u{2229}".freeze,

    # 2A41 UNION WITH MINUS SIGN
    # ->   222A UNION
    "\u{2A41}".freeze => "\u{222A}".freeze,

    # 2A42 UNION WITH OVERBAR
    # ->   222A UNION
    "\u{2A42}".freeze => "\u{222A}".freeze,

    # 2A43 INTERSECTION WITH OVERBAR
    # ->   2229 INTERSECTION
    "\u{2A43}".freeze => "\u{2229}".freeze,

    # 2A44 INTERSECTION WITH LOGICAL AND
    # ->   2229 INTERSECTION
    "\u{2A44}".freeze => "\u{2229}".freeze,

    # 2A45 UNION WITH LOGICAL OR
    # ->   222A UNION
    "\u{2A45}".freeze => "\u{222A}".freeze,

    # 2A51 LOGICAL AND WITH DOT ABOVE
    # ->   2227 LOGICAL AND
    "\u{2A51}".freeze => "\u{2227}".freeze,

    # 2A52 LOGICAL OR WITH DOT ABOVE
    # ->   2228 LOGICAL OR
    "\u{2A52}".freeze => "\u{2228}".freeze,

    # 2A5A LOGICAL AND WITH MIDDLE STEM
    # ->   2227 LOGICAL AND
    "\u{2A5A}".freeze => "\u{2227}".freeze,

    # 2A5B LOGICAL OR WITH MIDDLE STEM
    # ->   2228 LOGICAL OR
    "\u{2A5B}".freeze => "\u{2228}".freeze,

    # 2A5C LOGICAL AND WITH HORIZONTAL DASH
    # ->   2227 LOGICAL AND
    "\u{2A5C}".freeze => "\u{2227}".freeze,

    # 2A5D LOGICAL OR WITH HORIZONTAL DASH
    # ->   2228 LOGICAL OR
    "\u{2A5D}".freeze => "\u{2228}".freeze,

    # 2A5E LOGICAL AND WITH DOUBLE OVERBAR
    # ->   2227 LOGICAL AND
    "\u{2A5E}".freeze => "\u{2227}".freeze,

    # 2A5F LOGICAL AND WITH UNDERBAR
    # ->   2227 LOGICAL AND
    "\u{2A5F}".freeze => "\u{2227}".freeze,

    # 2A60 LOGICAL AND WITH DOUBLE UNDERBAR
    # ->   2227 LOGICAL AND
    "\u{2A60}".freeze => "\u{2227}".freeze,

    # 2A62 LOGICAL OR WITH DOUBLE OVERBAR
    # ->   2228 LOGICAL OR
    "\u{2A62}".freeze => "\u{2228}".freeze,

    # 2A63 LOGICAL OR WITH DOUBLE UNDERBAR
    # ->   2228 LOGICAL OR
    "\u{2A63}".freeze => "\u{2228}".freeze,

    # 2A66 EQUALS SIGN WITH DOT BELOW
    # ->   003D EQUALS SIGN
    "\u{2A66}".freeze => '='.freeze,

    # 2A6A TILDE OPERATOR WITH DOT ABOVE
    # ->   223C TILDE OPERATOR
    "\u{2A6A}".freeze => "\u{223C}".freeze,

    # 2A6B TILDE OPERATOR WITH RISING DOTS
    # ->   223C TILDE OPERATOR
    "\u{2A6B}".freeze => "\u{223C}".freeze,

    # 2A6F ALMOST EQUAL TO WITH CIRCUMFLEX ACCENT
    # ->   2248 ALMOST EQUAL TO
    "\u{2A6F}".freeze => "\u{2248}".freeze,

    # 2A74 DOUBLE COLON EQUAL
    # ->   003A COLON
    #    + 003A COLON
    #    + 003D EQUALS SIGN
    "\u{2A74}".freeze => '::='.freeze,

    # 2A75 TWO CONSECUTIVE EQUALS SIGNS
    # ->   003D EQUALS SIGN
    #    + 003D EQUALS SIGN
    "\u{2A75}".freeze => '=='.freeze,

    # 2A76 THREE CONSECUTIVE EQUALS SIGNS
    # ->   003D EQUALS SIGN
    #    + 003D EQUALS SIGN
    #    + 003D EQUALS SIGN
    "\u{2A76}".freeze => '==='.freeze,

    # 2A77 EQUALS SIGN WITH TWO DOTS ABOVE AND TWO DOTS BELOW
    # ->   003D EQUALS SIGN
    "\u{2A77}".freeze => '='.freeze,

    # 2A7F LESS-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
    # ->   2A7D LESS-THAN OR SLANTED EQUAL TO
    "\u{2A7F}".freeze => "\u{2A7D}".freeze,

    # 2A80 GREATER-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
    # ->   2A7E GREATER-THAN OR SLANTED EQUAL TO
    "\u{2A80}".freeze => "\u{2A7E}".freeze,

    # 2A81 LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
    # ->   2A7D LESS-THAN OR SLANTED EQUAL TO
    "\u{2A81}".freeze => "\u{2A7D}".freeze,

    # 2A82 GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
    # ->   2A7E GREATER-THAN OR SLANTED EQUAL TO
    "\u{2A82}".freeze => "\u{2A7E}".freeze,

    # 2A83 LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE RIGHT
    # ->   2A7D LESS-THAN OR SLANTED EQUAL TO
    "\u{2A83}".freeze => "\u{2A7D}".freeze,

    # 2A84 GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE LEFT
    # ->   2A7E GREATER-THAN OR SLANTED EQUAL TO
    "\u{2A84}".freeze => "\u{2A7E}".freeze,

    # 2A97 SLANTED EQUAL TO OR LESS-THAN WITH DOT INSIDE
    # ->   2A95 SLANTED EQUAL TO OR LESS-THAN
    "\u{2A97}".freeze => "\u{2A95}".freeze,

    # 2A98 SLANTED EQUAL TO OR GREATER-THAN WITH DOT INSIDE
    # ->   2A96 SLANTED EQUAL TO OR GREATER-THAN
    "\u{2A98}".freeze => "\u{2A96}".freeze,

    # 2AA3 DOUBLE NESTED LESS-THAN WITH UNDERBAR
    # ->   2AA1 DOUBLE NESTED LESS-THAN
    "\u{2AA3}".freeze => "\u{2AA1}".freeze,

    # 2AAE EQUALS SIGN WITH BUMPY ABOVE
    # ->   003D EQUALS SIGN
    "\u{2AAE}".freeze => '='.freeze,

    # 2AC3 SUBSET OF OR EQUAL TO WITH DOT ABOVE
    # ->   2286 SUBSET OF OR EQUAL TO
    "\u{2AC3}".freeze => "\u{2286}".freeze,

    # 2AC4 SUPERSET OF OR EQUAL TO WITH DOT ABOVE
    # ->   2287 SUPERSET OF OR EQUAL TO
    "\u{2AC4}".freeze => "\u{2287}".freeze,

    # 2ADA PITCHFORK WITH TEE TOP
    # ->   22D4 PITCHFORK
    "\u{2ADA}".freeze => "\u{22D4}".freeze,

    # 2ADC FORKING
    # ->   2ADD NONFORKING
    "\u{2ADC}".freeze => "\u{2ADD}".freeze,

    # 2AE7 SHORT DOWN TACK WITH OVERBAR
    # ->   2ADF SHORT DOWN TACK
    "\u{2AE7}".freeze => "\u{2ADF}".freeze,

    # 2AE8 SHORT UP TACK WITH UNDERBAR
    # ->   2AE0 SHORT UP TACK
    "\u{2AE8}".freeze => "\u{2AE0}".freeze,

    # 2AEE DOES NOT DIVIDE WITH REVERSED NEGATION SLASH
    # ->   2223 DIVIDES
    "\u{2AEE}".freeze => "\u{2223}".freeze,

    # 2AEF VERTICAL LINE WITH CIRCLE ABOVE
    # ->   007C VERTICAL LINE
    "\u{2AEF}".freeze => '|'.freeze,

    # 2AF0 VERTICAL LINE WITH CIRCLE BELOW
    # ->   007C VERTICAL LINE
    "\u{2AF0}".freeze => '|'.freeze,

    # 2AF1 DOWN TACK WITH CIRCLE BELOW
    # ->   22A4 DOWN TACK
    "\u{2AF1}".freeze => "\u{22A4}".freeze,

    # 2E9F CJK RADICAL MOTHER
    # ->   6BCD CJK UNIFIED IDEOGRAPH 6BCD
    "\u{2E9F}".freeze => "\u{6BCD}".freeze,

    # 2EF3 CJK RADICAL C-SIMPLIFIED TURTLE
    # ->   9F9F CJK UNIFIED IDEOGRAPH 9F9F
    "\u{2EF3}".freeze => "\u{9F9F}".freeze,

    # 2F00 KANGXI RADICAL ONE
    # ->   4E00 CJK UNIFIED IDEOGRAPH 4E00
    "\u{2F00}".freeze => "\u{4E00}".freeze,

    # 2F01 KANGXI RADICAL LINE
    # ->   4E28 CJK UNIFIED IDEOGRAPH 4E28
    "\u{2F01}".freeze => "\u{4E28}".freeze,

    # 2F02 KANGXI RADICAL DOT
    # ->   4E36 CJK UNIFIED IDEOGRAPH 4E36
    "\u{2F02}".freeze => "\u{4E36}".freeze,

    # 2F03 KANGXI RADICAL SLASH
    # ->   4E3F CJK UNIFIED IDEOGRAPH 4E3F
    "\u{2F03}".freeze => "\u{4E3F}".freeze,

    # 2F04 KANGXI RADICAL SECOND
    # ->   4E59 CJK UNIFIED IDEOGRAPH 4E59
    "\u{2F04}".freeze => "\u{4E59}".freeze,

    # 2F05 KANGXI RADICAL HOOK
    # ->   4E85 CJK UNIFIED IDEOGRAPH 4E85
    "\u{2F05}".freeze => "\u{4E85}".freeze,

    # 2F06 KANGXI RADICAL TWO
    # ->   4E8C CJK UNIFIED IDEOGRAPH 4E8C
    "\u{2F06}".freeze => "\u{4E8C}".freeze,

    # 2F07 KANGXI RADICAL LID
    # ->   4EA0 CJK UNIFIED IDEOGRAPH 4EA0
    "\u{2F07}".freeze => "\u{4EA0}".freeze,

    # 2F08 KANGXI RADICAL MAN
    # ->   4EBA CJK UNIFIED IDEOGRAPH 4EBA
    "\u{2F08}".freeze => "\u{4EBA}".freeze,

    # 2F09 KANGXI RADICAL LEGS
    # ->   513F CJK UNIFIED IDEOGRAPH 513F
    "\u{2F09}".freeze => "\u{513F}".freeze,

    # 2F0A KANGXI RADICAL ENTER
    # ->   5165 CJK UNIFIED IDEOGRAPH 5165
    "\u{2F0A}".freeze => "\u{5165}".freeze,

    # 2F0B KANGXI RADICAL EIGHT
    # ->   516B CJK UNIFIED IDEOGRAPH 516B
    "\u{2F0B}".freeze => "\u{516B}".freeze,

    # 2F0C KANGXI RADICAL DOWN BOX
    # ->   5182 CJK UNIFIED IDEOGRAPH 5182
    "\u{2F0C}".freeze => "\u{5182}".freeze,

    # 2F0D KANGXI RADICAL COVER
    # ->   5196 CJK UNIFIED IDEOGRAPH 5196
    "\u{2F0D}".freeze => "\u{5196}".freeze,

    # 2F0E KANGXI RADICAL ICE
    # ->   51AB CJK UNIFIED IDEOGRAPH 51AB
    "\u{2F0E}".freeze => "\u{51AB}".freeze,

    # 2F0F KANGXI RADICAL TABLE
    # ->   51E0 CJK UNIFIED IDEOGRAPH 51E0
    "\u{2F0F}".freeze => "\u{51E0}".freeze,

    # 2F10 KANGXI RADICAL OPEN BOX
    # ->   51F5 CJK UNIFIED IDEOGRAPH 51F5
    "\u{2F10}".freeze => "\u{51F5}".freeze,

    # 2F11 KANGXI RADICAL KNIFE
    # ->   5200 CJK UNIFIED IDEOGRAPH 5200
    "\u{2F11}".freeze => "\u{5200}".freeze,

    # 2F12 KANGXI RADICAL POWER
    # ->   529B CJK UNIFIED IDEOGRAPH 529B
    "\u{2F12}".freeze => "\u{529B}".freeze,

    # 2F13 KANGXI RADICAL WRAP
    # ->   52F9 CJK UNIFIED IDEOGRAPH 52F9
    "\u{2F13}".freeze => "\u{52F9}".freeze,

    # 2F14 KANGXI RADICAL SPOON
    # ->   5315 CJK UNIFIED IDEOGRAPH 5315
    "\u{2F14}".freeze => "\u{5315}".freeze,

    # 2F15 KANGXI RADICAL RIGHT OPEN BOX
    # ->   531A CJK UNIFIED IDEOGRAPH 531A
    "\u{2F15}".freeze => "\u{531A}".freeze,

    # 2F16 KANGXI RADICAL HIDING ENCLOSURE
    # ->   5338 CJK UNIFIED IDEOGRAPH 5338
    "\u{2F16}".freeze => "\u{5338}".freeze,

    # 2F17 KANGXI RADICAL TEN
    # ->   5341 CJK UNIFIED IDEOGRAPH 5341
    "\u{2F17}".freeze => "\u{5341}".freeze,

    # 2F18 KANGXI RADICAL DIVINATION
    # ->   535C CJK UNIFIED IDEOGRAPH 535C
    "\u{2F18}".freeze => "\u{535C}".freeze,

    # 2F19 KANGXI RADICAL SEAL
    # ->   5369 CJK UNIFIED IDEOGRAPH 5369
    "\u{2F19}".freeze => "\u{5369}".freeze,

    # 2F1A KANGXI RADICAL CLIFF
    # ->   5382 CJK UNIFIED IDEOGRAPH 5382
    "\u{2F1A}".freeze => "\u{5382}".freeze,

    # 2F1B KANGXI RADICAL PRIVATE
    # ->   53B6 CJK UNIFIED IDEOGRAPH 53B6
    "\u{2F1B}".freeze => "\u{53B6}".freeze,

    # 2F1C KANGXI RADICAL AGAIN
    # ->   53C8 CJK UNIFIED IDEOGRAPH 53C8
    "\u{2F1C}".freeze => "\u{53C8}".freeze,

    # 2F1D KANGXI RADICAL MOUTH
    # ->   53E3 CJK UNIFIED IDEOGRAPH 53E3
    "\u{2F1D}".freeze => "\u{53E3}".freeze,

    # 2F1E KANGXI RADICAL ENCLOSURE
    # ->   56D7 CJK UNIFIED IDEOGRAPH 56D7
    "\u{2F1E}".freeze => "\u{56D7}".freeze,

    # 2F1F KANGXI RADICAL EARTH
    # ->   571F CJK UNIFIED IDEOGRAPH 571F
    "\u{2F1F}".freeze => "\u{571F}".freeze,

    # 2F20 KANGXI RADICAL SCHOLAR
    # ->   58EB CJK UNIFIED IDEOGRAPH 58EB
    "\u{2F20}".freeze => "\u{58EB}".freeze,

    # 2F21 KANGXI RADICAL GO
    # ->   5902 CJK UNIFIED IDEOGRAPH 5902
    "\u{2F21}".freeze => "\u{5902}".freeze,

    # 2F22 KANGXI RADICAL GO SLOWLY
    # ->   590A CJK UNIFIED IDEOGRAPH 590A
    "\u{2F22}".freeze => "\u{590A}".freeze,

    # 2F23 KANGXI RADICAL EVENING
    # ->   5915 CJK UNIFIED IDEOGRAPH 5915
    "\u{2F23}".freeze => "\u{5915}".freeze,

    # 2F24 KANGXI RADICAL BIG
    # ->   5927 CJK UNIFIED IDEOGRAPH 5927
    "\u{2F24}".freeze => "\u{5927}".freeze,

    # 2F25 KANGXI RADICAL WOMAN
    # ->   5973 CJK UNIFIED IDEOGRAPH 5973
    "\u{2F25}".freeze => "\u{5973}".freeze,

    # 2F26 KANGXI RADICAL CHILD
    # ->   5B50 CJK UNIFIED IDEOGRAPH 5B50
    "\u{2F26}".freeze => "\u{5B50}".freeze,

    # 2F27 KANGXI RADICAL ROOF
    # ->   5B80 CJK UNIFIED IDEOGRAPH 5B80
    "\u{2F27}".freeze => "\u{5B80}".freeze,

    # 2F28 KANGXI RADICAL INCH
    # ->   5BF8 CJK UNIFIED IDEOGRAPH 5BF8
    "\u{2F28}".freeze => "\u{5BF8}".freeze,

    # 2F29 KANGXI RADICAL SMALL
    # ->   5C0F CJK UNIFIED IDEOGRAPH 5C0F
    "\u{2F29}".freeze => "\u{5C0F}".freeze,

    # 2F2A KANGXI RADICAL LAME
    # ->   5C22 CJK UNIFIED IDEOGRAPH 5C22
    "\u{2F2A}".freeze => "\u{5C22}".freeze,

    # 2F2B KANGXI RADICAL CORPSE
    # ->   5C38 CJK UNIFIED IDEOGRAPH 5C38
    "\u{2F2B}".freeze => "\u{5C38}".freeze,

    # 2F2C KANGXI RADICAL SPROUT
    # ->   5C6E CJK UNIFIED IDEOGRAPH 5C6E
    "\u{2F2C}".freeze => "\u{5C6E}".freeze,

    # 2F2D KANGXI RADICAL MOUNTAIN
    # ->   5C71 CJK UNIFIED IDEOGRAPH 5C71
    "\u{2F2D}".freeze => "\u{5C71}".freeze,

    # 2F2E KANGXI RADICAL RIVER
    # ->   5DDB CJK UNIFIED IDEOGRAPH 5DDB
    "\u{2F2E}".freeze => "\u{5DDB}".freeze,

    # 2F2F KANGXI RADICAL WORK
    # ->   5DE5 CJK UNIFIED IDEOGRAPH 5DE5
    "\u{2F2F}".freeze => "\u{5DE5}".freeze,

    # 2F30 KANGXI RADICAL ONESELF
    # ->   5DF1 CJK UNIFIED IDEOGRAPH 5DF1
    "\u{2F30}".freeze => "\u{5DF1}".freeze,

    # 2F31 KANGXI RADICAL TURBAN
    # ->   5DFE CJK UNIFIED IDEOGRAPH 5DFE
    "\u{2F31}".freeze => "\u{5DFE}".freeze,

    # 2F32 KANGXI RADICAL DRY
    # ->   5E72 CJK UNIFIED IDEOGRAPH 5E72
    "\u{2F32}".freeze => "\u{5E72}".freeze,

    # 2F33 KANGXI RADICAL SHORT THREAD
    # ->   5E7A CJK UNIFIED IDEOGRAPH 5E7A
    "\u{2F33}".freeze => "\u{5E7A}".freeze,

    # 2F34 KANGXI RADICAL DOTTED CLIFF
    # ->   5E7F CJK UNIFIED IDEOGRAPH 5E7F
    "\u{2F34}".freeze => "\u{5E7F}".freeze,

    # 2F35 KANGXI RADICAL LONG STRIDE
    # ->   5EF4 CJK UNIFIED IDEOGRAPH 5EF4
    "\u{2F35}".freeze => "\u{5EF4}".freeze,

    # 2F36 KANGXI RADICAL TWO HANDS
    # ->   5EFE CJK UNIFIED IDEOGRAPH 5EFE
    "\u{2F36}".freeze => "\u{5EFE}".freeze,

    # 2F37 KANGXI RADICAL SHOOT
    # ->   5F0B CJK UNIFIED IDEOGRAPH 5F0B
    "\u{2F37}".freeze => "\u{5F0B}".freeze,

    # 2F38 KANGXI RADICAL BOW
    # ->   5F13 CJK UNIFIED IDEOGRAPH 5F13
    "\u{2F38}".freeze => "\u{5F13}".freeze,

    # 2F39 KANGXI RADICAL SNOUT
    # ->   5F50 CJK UNIFIED IDEOGRAPH 5F50
    "\u{2F39}".freeze => "\u{5F50}".freeze,

    # 2F3A KANGXI RADICAL BRISTLE
    # ->   5F61 CJK UNIFIED IDEOGRAPH 5F61
    "\u{2F3A}".freeze => "\u{5F61}".freeze,

    # 2F3B KANGXI RADICAL STEP
    # ->   5F73 CJK UNIFIED IDEOGRAPH 5F73
    "\u{2F3B}".freeze => "\u{5F73}".freeze,

    # 2F3C KANGXI RADICAL HEART
    # ->   5FC3 CJK UNIFIED IDEOGRAPH 5FC3
    "\u{2F3C}".freeze => "\u{5FC3}".freeze,

    # 2F3D KANGXI RADICAL HALBERD
    # ->   6208 CJK UNIFIED IDEOGRAPH 6208
    "\u{2F3D}".freeze => "\u{6208}".freeze,

    # 2F3E KANGXI RADICAL DOOR
    # ->   6236 CJK UNIFIED IDEOGRAPH 6236
    "\u{2F3E}".freeze => "\u{6236}".freeze,

    # 2F3F KANGXI RADICAL HAND
    # ->   624B CJK UNIFIED IDEOGRAPH 624B
    "\u{2F3F}".freeze => "\u{624B}".freeze,

    # 2F40 KANGXI RADICAL BRANCH
    # ->   652F CJK UNIFIED IDEOGRAPH 652F
    "\u{2F40}".freeze => "\u{652F}".freeze,

    # 2F41 KANGXI RADICAL RAP
    # ->   6534 CJK UNIFIED IDEOGRAPH 6534
    "\u{2F41}".freeze => "\u{6534}".freeze,

    # 2F42 KANGXI RADICAL SCRIPT
    # ->   6587 CJK UNIFIED IDEOGRAPH 6587
    "\u{2F42}".freeze => "\u{6587}".freeze,

    # 2F43 KANGXI RADICAL DIPPER
    # ->   6597 CJK UNIFIED IDEOGRAPH 6597
    "\u{2F43}".freeze => "\u{6597}".freeze,

    # 2F44 KANGXI RADICAL AXE
    # ->   65A4 CJK UNIFIED IDEOGRAPH 65A4
    "\u{2F44}".freeze => "\u{65A4}".freeze,

    # 2F45 KANGXI RADICAL SQUARE
    # ->   65B9 CJK UNIFIED IDEOGRAPH 65B9
    "\u{2F45}".freeze => "\u{65B9}".freeze,

    # 2F46 KANGXI RADICAL NOT
    # ->   65E0 CJK UNIFIED IDEOGRAPH 65E0
    "\u{2F46}".freeze => "\u{65E0}".freeze,

    # 2F47 KANGXI RADICAL SUN
    # ->   65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{2F47}".freeze => "\u{65E5}".freeze,

    # 2F48 KANGXI RADICAL SAY
    # ->   66F0 CJK UNIFIED IDEOGRAPH 66F0
    "\u{2F48}".freeze => "\u{66F0}".freeze,

    # 2F49 KANGXI RADICAL MOON
    # ->   6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{2F49}".freeze => "\u{6708}".freeze,

    # 2F4A KANGXI RADICAL TREE
    # ->   6728 CJK UNIFIED IDEOGRAPH 6728
    "\u{2F4A}".freeze => "\u{6728}".freeze,

    # 2F4B KANGXI RADICAL LACK
    # ->   6B20 CJK UNIFIED IDEOGRAPH 6B20
    "\u{2F4B}".freeze => "\u{6B20}".freeze,

    # 2F4C KANGXI RADICAL STOP
    # ->   6B62 CJK UNIFIED IDEOGRAPH 6B62
    "\u{2F4C}".freeze => "\u{6B62}".freeze,

    # 2F4D KANGXI RADICAL DEATH
    # ->   6B79 CJK UNIFIED IDEOGRAPH 6B79
    "\u{2F4D}".freeze => "\u{6B79}".freeze,

    # 2F4E KANGXI RADICAL WEAPON
    # ->   6BB3 CJK UNIFIED IDEOGRAPH 6BB3
    "\u{2F4E}".freeze => "\u{6BB3}".freeze,

    # 2F4F KANGXI RADICAL DO NOT
    # ->   6BCB CJK UNIFIED IDEOGRAPH 6BCB
    "\u{2F4F}".freeze => "\u{6BCB}".freeze,

    # 2F50 KANGXI RADICAL COMPARE
    # ->   6BD4 CJK UNIFIED IDEOGRAPH 6BD4
    "\u{2F50}".freeze => "\u{6BD4}".freeze,

    # 2F51 KANGXI RADICAL FUR
    # ->   6BDB CJK UNIFIED IDEOGRAPH 6BDB
    "\u{2F51}".freeze => "\u{6BDB}".freeze,

    # 2F52 KANGXI RADICAL CLAN
    # ->   6C0F CJK UNIFIED IDEOGRAPH 6C0F
    "\u{2F52}".freeze => "\u{6C0F}".freeze,

    # 2F53 KANGXI RADICAL STEAM
    # ->   6C14 CJK UNIFIED IDEOGRAPH 6C14
    "\u{2F53}".freeze => "\u{6C14}".freeze,

    # 2F54 KANGXI RADICAL WATER
    # ->   6C34 CJK UNIFIED IDEOGRAPH 6C34
    "\u{2F54}".freeze => "\u{6C34}".freeze,

    # 2F55 KANGXI RADICAL FIRE
    # ->   706B CJK UNIFIED IDEOGRAPH 706B
    "\u{2F55}".freeze => "\u{706B}".freeze,

    # 2F56 KANGXI RADICAL CLAW
    # ->   722A CJK UNIFIED IDEOGRAPH 722A
    "\u{2F56}".freeze => "\u{722A}".freeze,

    # 2F57 KANGXI RADICAL FATHER
    # ->   7236 CJK UNIFIED IDEOGRAPH 7236
    "\u{2F57}".freeze => "\u{7236}".freeze,

    # 2F58 KANGXI RADICAL DOUBLE X
    # ->   723B CJK UNIFIED IDEOGRAPH 723B
    "\u{2F58}".freeze => "\u{723B}".freeze,

    # 2F59 KANGXI RADICAL HALF TREE TRUNK
    # ->   723F CJK UNIFIED IDEOGRAPH 723F
    "\u{2F59}".freeze => "\u{723F}".freeze,

    # 2F5A KANGXI RADICAL SLICE
    # ->   7247 CJK UNIFIED IDEOGRAPH 7247
    "\u{2F5A}".freeze => "\u{7247}".freeze,

    # 2F5B KANGXI RADICAL FANG
    # ->   7259 CJK UNIFIED IDEOGRAPH 7259
    "\u{2F5B}".freeze => "\u{7259}".freeze,

    # 2F5C KANGXI RADICAL COW
    # ->   725B CJK UNIFIED IDEOGRAPH 725B
    "\u{2F5C}".freeze => "\u{725B}".freeze,

    # 2F5D KANGXI RADICAL DOG
    # ->   72AC CJK UNIFIED IDEOGRAPH 72AC
    "\u{2F5D}".freeze => "\u{72AC}".freeze,

    # 2F5E KANGXI RADICAL PROFOUND
    # ->   7384 CJK UNIFIED IDEOGRAPH 7384
    "\u{2F5E}".freeze => "\u{7384}".freeze,

    # 2F5F KANGXI RADICAL JADE
    # ->   7389 CJK UNIFIED IDEOGRAPH 7389
    "\u{2F5F}".freeze => "\u{7389}".freeze,

    # 2F60 KANGXI RADICAL MELON
    # ->   74DC CJK UNIFIED IDEOGRAPH 74DC
    "\u{2F60}".freeze => "\u{74DC}".freeze,

    # 2F61 KANGXI RADICAL TILE
    # ->   74E6 CJK UNIFIED IDEOGRAPH 74E6
    "\u{2F61}".freeze => "\u{74E6}".freeze,

    # 2F62 KANGXI RADICAL SWEET
    # ->   7518 CJK UNIFIED IDEOGRAPH 7518
    "\u{2F62}".freeze => "\u{7518}".freeze,

    # 2F63 KANGXI RADICAL LIFE
    # ->   751F CJK UNIFIED IDEOGRAPH 751F
    "\u{2F63}".freeze => "\u{751F}".freeze,

    # 2F64 KANGXI RADICAL USE
    # ->   7528 CJK UNIFIED IDEOGRAPH 7528
    "\u{2F64}".freeze => "\u{7528}".freeze,

    # 2F65 KANGXI RADICAL FIELD
    # ->   7530 CJK UNIFIED IDEOGRAPH 7530
    "\u{2F65}".freeze => "\u{7530}".freeze,

    # 2F66 KANGXI RADICAL BOLT OF CLOTH
    # ->   758B CJK UNIFIED IDEOGRAPH 758B
    "\u{2F66}".freeze => "\u{758B}".freeze,

    # 2F67 KANGXI RADICAL SICKNESS
    # ->   7592 CJK UNIFIED IDEOGRAPH 7592
    "\u{2F67}".freeze => "\u{7592}".freeze,

    # 2F68 KANGXI RADICAL DOTTED TENT
    # ->   7676 CJK UNIFIED IDEOGRAPH 7676
    "\u{2F68}".freeze => "\u{7676}".freeze,

    # 2F69 KANGXI RADICAL WHITE
    # ->   767D CJK UNIFIED IDEOGRAPH 767D
    "\u{2F69}".freeze => "\u{767D}".freeze,

    # 2F6A KANGXI RADICAL SKIN
    # ->   76AE CJK UNIFIED IDEOGRAPH 76AE
    "\u{2F6A}".freeze => "\u{76AE}".freeze,

    # 2F6B KANGXI RADICAL DISH
    # ->   76BF CJK UNIFIED IDEOGRAPH 76BF
    "\u{2F6B}".freeze => "\u{76BF}".freeze,

    # 2F6C KANGXI RADICAL EYE
    # ->   76EE CJK UNIFIED IDEOGRAPH 76EE
    "\u{2F6C}".freeze => "\u{76EE}".freeze,

    # 2F6D KANGXI RADICAL SPEAR
    # ->   77DB CJK UNIFIED IDEOGRAPH 77DB
    "\u{2F6D}".freeze => "\u{77DB}".freeze,

    # 2F6E KANGXI RADICAL ARROW
    # ->   77E2 CJK UNIFIED IDEOGRAPH 77E2
    "\u{2F6E}".freeze => "\u{77E2}".freeze,

    # 2F6F KANGXI RADICAL STONE
    # ->   77F3 CJK UNIFIED IDEOGRAPH 77F3
    "\u{2F6F}".freeze => "\u{77F3}".freeze,

    # 2F70 KANGXI RADICAL SPIRIT
    # ->   793A CJK UNIFIED IDEOGRAPH 793A
    "\u{2F70}".freeze => "\u{793A}".freeze,

    # 2F71 KANGXI RADICAL TRACK
    # ->   79B8 CJK UNIFIED IDEOGRAPH 79B8
    "\u{2F71}".freeze => "\u{79B8}".freeze,

    # 2F72 KANGXI RADICAL GRAIN
    # ->   79BE CJK UNIFIED IDEOGRAPH 79BE
    "\u{2F72}".freeze => "\u{79BE}".freeze,

    # 2F73 KANGXI RADICAL CAVE
    # ->   7A74 CJK UNIFIED IDEOGRAPH 7A74
    "\u{2F73}".freeze => "\u{7A74}".freeze,

    # 2F74 KANGXI RADICAL STAND
    # ->   7ACB CJK UNIFIED IDEOGRAPH 7ACB
    "\u{2F74}".freeze => "\u{7ACB}".freeze,

    # 2F75 KANGXI RADICAL BAMBOO
    # ->   7AF9 CJK UNIFIED IDEOGRAPH 7AF9
    "\u{2F75}".freeze => "\u{7AF9}".freeze,

    # 2F76 KANGXI RADICAL RICE
    # ->   7C73 CJK UNIFIED IDEOGRAPH 7C73
    "\u{2F76}".freeze => "\u{7C73}".freeze,

    # 2F77 KANGXI RADICAL SILK
    # ->   7CF8 CJK UNIFIED IDEOGRAPH 7CF8
    "\u{2F77}".freeze => "\u{7CF8}".freeze,

    # 2F78 KANGXI RADICAL JAR
    # ->   7F36 CJK UNIFIED IDEOGRAPH 7F36
    "\u{2F78}".freeze => "\u{7F36}".freeze,

    # 2F79 KANGXI RADICAL NET
    # ->   7F51 CJK UNIFIED IDEOGRAPH 7F51
    "\u{2F79}".freeze => "\u{7F51}".freeze,

    # 2F7A KANGXI RADICAL SHEEP
    # ->   7F8A CJK UNIFIED IDEOGRAPH 7F8A
    "\u{2F7A}".freeze => "\u{7F8A}".freeze,

    # 2F7B KANGXI RADICAL FEATHER
    # ->   7FBD CJK UNIFIED IDEOGRAPH 7FBD
    "\u{2F7B}".freeze => "\u{7FBD}".freeze,

    # 2F7C KANGXI RADICAL OLD
    # ->   8001 CJK UNIFIED IDEOGRAPH 8001
    "\u{2F7C}".freeze => "\u{8001}".freeze,

    # 2F7D KANGXI RADICAL AND
    # ->   800C CJK UNIFIED IDEOGRAPH 800C
    "\u{2F7D}".freeze => "\u{800C}".freeze,

    # 2F7E KANGXI RADICAL PLOW
    # ->   8012 CJK UNIFIED IDEOGRAPH 8012
    "\u{2F7E}".freeze => "\u{8012}".freeze,

    # 2F7F KANGXI RADICAL EAR
    # ->   8033 CJK UNIFIED IDEOGRAPH 8033
    "\u{2F7F}".freeze => "\u{8033}".freeze,

    # 2F80 KANGXI RADICAL BRUSH
    # ->   807F CJK UNIFIED IDEOGRAPH 807F
    "\u{2F80}".freeze => "\u{807F}".freeze,

    # 2F81 KANGXI RADICAL MEAT
    # ->   8089 CJK UNIFIED IDEOGRAPH 8089
    "\u{2F81}".freeze => "\u{8089}".freeze,

    # 2F82 KANGXI RADICAL MINISTER
    # ->   81E3 CJK UNIFIED IDEOGRAPH 81E3
    "\u{2F82}".freeze => "\u{81E3}".freeze,

    # 2F83 KANGXI RADICAL SELF
    # ->   81EA CJK UNIFIED IDEOGRAPH 81EA
    "\u{2F83}".freeze => "\u{81EA}".freeze,

    # 2F84 KANGXI RADICAL ARRIVE
    # ->   81F3 CJK UNIFIED IDEOGRAPH 81F3
    "\u{2F84}".freeze => "\u{81F3}".freeze,

    # 2F85 KANGXI RADICAL MORTAR
    # ->   81FC CJK UNIFIED IDEOGRAPH 81FC
    "\u{2F85}".freeze => "\u{81FC}".freeze,

    # 2F86 KANGXI RADICAL TONGUE
    # ->   820C CJK UNIFIED IDEOGRAPH 820C
    "\u{2F86}".freeze => "\u{820C}".freeze,

    # 2F87 KANGXI RADICAL OPPOSE
    # ->   821B CJK UNIFIED IDEOGRAPH 821B
    "\u{2F87}".freeze => "\u{821B}".freeze,

    # 2F88 KANGXI RADICAL BOAT
    # ->   821F CJK UNIFIED IDEOGRAPH 821F
    "\u{2F88}".freeze => "\u{821F}".freeze,

    # 2F89 KANGXI RADICAL STOPPING
    # ->   826E CJK UNIFIED IDEOGRAPH 826E
    "\u{2F89}".freeze => "\u{826E}".freeze,

    # 2F8A KANGXI RADICAL COLOR
    # ->   8272 CJK UNIFIED IDEOGRAPH 8272
    "\u{2F8A}".freeze => "\u{8272}".freeze,

    # 2F8B KANGXI RADICAL GRASS
    # ->   8278 CJK UNIFIED IDEOGRAPH 8278
    "\u{2F8B}".freeze => "\u{8278}".freeze,

    # 2F8C KANGXI RADICAL TIGER
    # ->   864D CJK UNIFIED IDEOGRAPH 864D
    "\u{2F8C}".freeze => "\u{864D}".freeze,

    # 2F8D KANGXI RADICAL INSECT
    # ->   866B CJK UNIFIED IDEOGRAPH 866B
    "\u{2F8D}".freeze => "\u{866B}".freeze,

    # 2F8E KANGXI RADICAL BLOOD
    # ->   8840 CJK UNIFIED IDEOGRAPH 8840
    "\u{2F8E}".freeze => "\u{8840}".freeze,

    # 2F8F KANGXI RADICAL WALK ENCLOSURE
    # ->   884C CJK UNIFIED IDEOGRAPH 884C
    "\u{2F8F}".freeze => "\u{884C}".freeze,

    # 2F90 KANGXI RADICAL CLOTHES
    # ->   8863 CJK UNIFIED IDEOGRAPH 8863
    "\u{2F90}".freeze => "\u{8863}".freeze,

    # 2F91 KANGXI RADICAL WEST
    # ->   897E CJK UNIFIED IDEOGRAPH 897E
    "\u{2F91}".freeze => "\u{897E}".freeze,

    # 2F92 KANGXI RADICAL SEE
    # ->   898B CJK UNIFIED IDEOGRAPH 898B
    "\u{2F92}".freeze => "\u{898B}".freeze,

    # 2F93 KANGXI RADICAL HORN
    # ->   89D2 CJK UNIFIED IDEOGRAPH 89D2
    "\u{2F93}".freeze => "\u{89D2}".freeze,

    # 2F94 KANGXI RADICAL SPEECH
    # ->   8A00 CJK UNIFIED IDEOGRAPH 8A00
    "\u{2F94}".freeze => "\u{8A00}".freeze,

    # 2F95 KANGXI RADICAL VALLEY
    # ->   8C37 CJK UNIFIED IDEOGRAPH 8C37
    "\u{2F95}".freeze => "\u{8C37}".freeze,

    # 2F96 KANGXI RADICAL BEAN
    # ->   8C46 CJK UNIFIED IDEOGRAPH 8C46
    "\u{2F96}".freeze => "\u{8C46}".freeze,

    # 2F97 KANGXI RADICAL PIG
    # ->   8C55 CJK UNIFIED IDEOGRAPH 8C55
    "\u{2F97}".freeze => "\u{8C55}".freeze,

    # 2F98 KANGXI RADICAL BADGER
    # ->   8C78 CJK UNIFIED IDEOGRAPH 8C78
    "\u{2F98}".freeze => "\u{8C78}".freeze,

    # 2F99 KANGXI RADICAL SHELL
    # ->   8C9D CJK UNIFIED IDEOGRAPH 8C9D
    "\u{2F99}".freeze => "\u{8C9D}".freeze,

    # 2F9A KANGXI RADICAL RED
    # ->   8D64 CJK UNIFIED IDEOGRAPH 8D64
    "\u{2F9A}".freeze => "\u{8D64}".freeze,

    # 2F9B KANGXI RADICAL RUN
    # ->   8D70 CJK UNIFIED IDEOGRAPH 8D70
    "\u{2F9B}".freeze => "\u{8D70}".freeze,

    # 2F9C KANGXI RADICAL FOOT
    # ->   8DB3 CJK UNIFIED IDEOGRAPH 8DB3
    "\u{2F9C}".freeze => "\u{8DB3}".freeze,

    # 2F9D KANGXI RADICAL BODY
    # ->   8EAB CJK UNIFIED IDEOGRAPH 8EAB
    "\u{2F9D}".freeze => "\u{8EAB}".freeze,

    # 2F9E KANGXI RADICAL CART
    # ->   8ECA CJK UNIFIED IDEOGRAPH 8ECA
    "\u{2F9E}".freeze => "\u{8ECA}".freeze,

    # 2F9F KANGXI RADICAL BITTER
    # ->   8F9B CJK UNIFIED IDEOGRAPH 8F9B
    "\u{2F9F}".freeze => "\u{8F9B}".freeze,

    # 2FA0 KANGXI RADICAL MORNING
    # ->   8FB0 CJK UNIFIED IDEOGRAPH 8FB0
    "\u{2FA0}".freeze => "\u{8FB0}".freeze,

    # 2FA1 KANGXI RADICAL WALK
    # ->   8FB5 CJK UNIFIED IDEOGRAPH 8FB5
    "\u{2FA1}".freeze => "\u{8FB5}".freeze,

    # 2FA2 KANGXI RADICAL CITY
    # ->   9091 CJK UNIFIED IDEOGRAPH 9091
    "\u{2FA2}".freeze => "\u{9091}".freeze,

    # 2FA3 KANGXI RADICAL WINE
    # ->   9149 CJK UNIFIED IDEOGRAPH 9149
    "\u{2FA3}".freeze => "\u{9149}".freeze,

    # 2FA4 KANGXI RADICAL DISTINGUISH
    # ->   91C6 CJK UNIFIED IDEOGRAPH 91C6
    "\u{2FA4}".freeze => "\u{91C6}".freeze,

    # 2FA5 KANGXI RADICAL VILLAGE
    # ->   91CC CJK UNIFIED IDEOGRAPH 91CC
    "\u{2FA5}".freeze => "\u{91CC}".freeze,

    # 2FA6 KANGXI RADICAL GOLD
    # ->   91D1 CJK UNIFIED IDEOGRAPH 91D1
    "\u{2FA6}".freeze => "\u{91D1}".freeze,

    # 2FA7 KANGXI RADICAL LONG
    # ->   9577 CJK UNIFIED IDEOGRAPH 9577
    "\u{2FA7}".freeze => "\u{9577}".freeze,

    # 2FA8 KANGXI RADICAL GATE
    # ->   9580 CJK UNIFIED IDEOGRAPH 9580
    "\u{2FA8}".freeze => "\u{9580}".freeze,

    # 2FA9 KANGXI RADICAL MOUND
    # ->   961C CJK UNIFIED IDEOGRAPH 961C
    "\u{2FA9}".freeze => "\u{961C}".freeze,

    # 2FAA KANGXI RADICAL SLAVE
    # ->   96B6 CJK UNIFIED IDEOGRAPH 96B6
    "\u{2FAA}".freeze => "\u{96B6}".freeze,

    # 2FAB KANGXI RADICAL SHORT TAILED BIRD
    # ->   96B9 CJK UNIFIED IDEOGRAPH 96B9
    "\u{2FAB}".freeze => "\u{96B9}".freeze,

    # 2FAC KANGXI RADICAL RAIN
    # ->   96E8 CJK UNIFIED IDEOGRAPH 96E8
    "\u{2FAC}".freeze => "\u{96E8}".freeze,

    # 2FAD KANGXI RADICAL BLUE
    # ->   9751 CJK UNIFIED IDEOGRAPH 9751
    "\u{2FAD}".freeze => "\u{9751}".freeze,

    # 2FAE KANGXI RADICAL WRONG
    # ->   975E CJK UNIFIED IDEOGRAPH 975E
    "\u{2FAE}".freeze => "\u{975E}".freeze,

    # 2FAF KANGXI RADICAL FACE
    # ->   9762 CJK UNIFIED IDEOGRAPH 9762
    "\u{2FAF}".freeze => "\u{9762}".freeze,

    # 2FB0 KANGXI RADICAL LEATHER
    # ->   9769 CJK UNIFIED IDEOGRAPH 9769
    "\u{2FB0}".freeze => "\u{9769}".freeze,

    # 2FB1 KANGXI RADICAL TANNED LEATHER
    # ->   97CB CJK UNIFIED IDEOGRAPH 97CB
    "\u{2FB1}".freeze => "\u{97CB}".freeze,

    # 2FB2 KANGXI RADICAL LEEK
    # ->   97ED CJK UNIFIED IDEOGRAPH 97ED
    "\u{2FB2}".freeze => "\u{97ED}".freeze,

    # 2FB3 KANGXI RADICAL SOUND
    # ->   97F3 CJK UNIFIED IDEOGRAPH 97F3
    "\u{2FB3}".freeze => "\u{97F3}".freeze,

    # 2FB4 KANGXI RADICAL LEAF
    # ->   9801 CJK UNIFIED IDEOGRAPH 9801
    "\u{2FB4}".freeze => "\u{9801}".freeze,

    # 2FB5 KANGXI RADICAL WIND
    # ->   98A8 CJK UNIFIED IDEOGRAPH 98A8
    "\u{2FB5}".freeze => "\u{98A8}".freeze,

    # 2FB6 KANGXI RADICAL FLY
    # ->   98DB CJK UNIFIED IDEOGRAPH 98DB
    "\u{2FB6}".freeze => "\u{98DB}".freeze,

    # 2FB7 KANGXI RADICAL EAT
    # ->   98DF CJK UNIFIED IDEOGRAPH 98DF
    "\u{2FB7}".freeze => "\u{98DF}".freeze,

    # 2FB8 KANGXI RADICAL HEAD
    # ->   9996 CJK UNIFIED IDEOGRAPH 9996
    "\u{2FB8}".freeze => "\u{9996}".freeze,

    # 2FB9 KANGXI RADICAL FRAGRANT
    # ->   9999 CJK UNIFIED IDEOGRAPH 9999
    "\u{2FB9}".freeze => "\u{9999}".freeze,

    # 2FBA KANGXI RADICAL HORSE
    # ->   99AC CJK UNIFIED IDEOGRAPH 99AC
    "\u{2FBA}".freeze => "\u{99AC}".freeze,

    # 2FBB KANGXI RADICAL BONE
    # ->   9AA8 CJK UNIFIED IDEOGRAPH 9AA8
    "\u{2FBB}".freeze => "\u{9AA8}".freeze,

    # 2FBC KANGXI RADICAL TALL
    # ->   9AD8 CJK UNIFIED IDEOGRAPH 9AD8
    "\u{2FBC}".freeze => "\u{9AD8}".freeze,

    # 2FBD KANGXI RADICAL HAIR
    # ->   9ADF CJK UNIFIED IDEOGRAPH 9ADF
    "\u{2FBD}".freeze => "\u{9ADF}".freeze,

    # 2FBE KANGXI RADICAL FIGHT
    # ->   9B25 CJK UNIFIED IDEOGRAPH 9B25
    "\u{2FBE}".freeze => "\u{9B25}".freeze,

    # 2FBF KANGXI RADICAL SACRIFICIAL WINE
    # ->   9B2F CJK UNIFIED IDEOGRAPH 9B2F
    "\u{2FBF}".freeze => "\u{9B2F}".freeze,

    # 2FC0 KANGXI RADICAL CAULDRON
    # ->   9B32 CJK UNIFIED IDEOGRAPH 9B32
    "\u{2FC0}".freeze => "\u{9B32}".freeze,

    # 2FC1 KANGXI RADICAL GHOST
    # ->   9B3C CJK UNIFIED IDEOGRAPH 9B3C
    "\u{2FC1}".freeze => "\u{9B3C}".freeze,

    # 2FC2 KANGXI RADICAL FISH
    # ->   9B5A CJK UNIFIED IDEOGRAPH 9B5A
    "\u{2FC2}".freeze => "\u{9B5A}".freeze,

    # 2FC3 KANGXI RADICAL BIRD
    # ->   9CE5 CJK UNIFIED IDEOGRAPH 9CE5
    "\u{2FC3}".freeze => "\u{9CE5}".freeze,

    # 2FC4 KANGXI RADICAL SALT
    # ->   9E75 CJK UNIFIED IDEOGRAPH 9E75
    "\u{2FC4}".freeze => "\u{9E75}".freeze,

    # 2FC5 KANGXI RADICAL DEER
    # ->   9E7F CJK UNIFIED IDEOGRAPH 9E7F
    "\u{2FC5}".freeze => "\u{9E7F}".freeze,

    # 2FC6 KANGXI RADICAL WHEAT
    # ->   9EA5 CJK UNIFIED IDEOGRAPH 9EA5
    "\u{2FC6}".freeze => "\u{9EA5}".freeze,

    # 2FC7 KANGXI RADICAL HEMP
    # ->   9EBB CJK UNIFIED IDEOGRAPH 9EBB
    "\u{2FC7}".freeze => "\u{9EBB}".freeze,

    # 2FC8 KANGXI RADICAL YELLOW
    # ->   9EC3 CJK UNIFIED IDEOGRAPH 9EC3
    "\u{2FC8}".freeze => "\u{9EC3}".freeze,

    # 2FC9 KANGXI RADICAL MILLET
    # ->   9ECD CJK UNIFIED IDEOGRAPH 9ECD
    "\u{2FC9}".freeze => "\u{9ECD}".freeze,

    # 2FCA KANGXI RADICAL BLACK
    # ->   9ED1 CJK UNIFIED IDEOGRAPH 9ED1
    "\u{2FCA}".freeze => "\u{9ED1}".freeze,

    # 2FCB KANGXI RADICAL EMBROIDERY
    # ->   9EF9 CJK UNIFIED IDEOGRAPH 9EF9
    "\u{2FCB}".freeze => "\u{9EF9}".freeze,

    # 2FCC KANGXI RADICAL FROG
    # ->   9EFD CJK UNIFIED IDEOGRAPH 9EFD
    "\u{2FCC}".freeze => "\u{9EFD}".freeze,

    # 2FCD KANGXI RADICAL TRIPOD
    # ->   9F0E CJK UNIFIED IDEOGRAPH 9F0E
    "\u{2FCD}".freeze => "\u{9F0E}".freeze,

    # 2FCE KANGXI RADICAL DRUM
    # ->   9F13 CJK UNIFIED IDEOGRAPH 9F13
    "\u{2FCE}".freeze => "\u{9F13}".freeze,

    # 2FCF KANGXI RADICAL RAT
    # ->   9F20 CJK UNIFIED IDEOGRAPH 9F20
    "\u{2FCF}".freeze => "\u{9F20}".freeze,

    # 2FD0 KANGXI RADICAL NOSE
    # ->   9F3B CJK UNIFIED IDEOGRAPH 9F3B
    "\u{2FD0}".freeze => "\u{9F3B}".freeze,

    # 2FD1 KANGXI RADICAL EVEN
    # ->   9F4A CJK UNIFIED IDEOGRAPH 9F4A
    "\u{2FD1}".freeze => "\u{9F4A}".freeze,

    # 2FD2 KANGXI RADICAL TOOTH
    # ->   9F52 CJK UNIFIED IDEOGRAPH 9F52
    "\u{2FD2}".freeze => "\u{9F52}".freeze,

    # 2FD3 KANGXI RADICAL DRAGON
    # ->   9F8D CJK UNIFIED IDEOGRAPH 9F8D
    "\u{2FD3}".freeze => "\u{9F8D}".freeze,

    # 2FD4 KANGXI RADICAL TURTLE
    # ->   9F9C CJK UNIFIED IDEOGRAPH 9F9C
    "\u{2FD4}".freeze => "\u{9F9C}".freeze,

    # 2FD5 KANGXI RADICAL FLUTE
    # ->   9FA0 CJK UNIFIED IDEOGRAPH 9FA0
    "\u{2FD5}".freeze => "\u{9FA0}".freeze,

    # 3000 IDEOGRAPHIC SPACE
    # ->   0020 SPACE
    "\u{3000}".freeze => ' '.freeze,

    # 3036 CIRCLED POSTAL MARK
    # ->   3012 POSTAL MARK
    "\u{3036}".freeze => "\u{3012}".freeze,

    # 3038 HANGZHOU NUMERAL TEN
    # ->   5341 CJK UNIFIED IDEOGRAPH 5341
    "\u{3038}".freeze => "\u{5341}".freeze,

    # 3039 HANGZHOU NUMERAL TWENTY
    # ->   5344 CJK UNIFIED IDEOGRAPH 5344
    "\u{3039}".freeze => "\u{5344}".freeze,

    # 303A HANGZHOU NUMERAL THIRTY
    # ->   5345 CJK UNIFIED IDEOGRAPH 5345
    "\u{303A}".freeze => "\u{5345}".freeze,

    # 304C HIRAGANA LETTER GA
    # ->   304B HIRAGANA LETTER KA
    "\u{304C}".freeze => "\u{304B}".freeze,

    # 304E HIRAGANA LETTER GI
    # ->   304D HIRAGANA LETTER KI
    "\u{304E}".freeze => "\u{304D}".freeze,

    # 3050 HIRAGANA LETTER GU
    # ->   304F HIRAGANA LETTER KU
    "\u{3050}".freeze => "\u{304F}".freeze,

    # 3052 HIRAGANA LETTER GE
    # ->   3051 HIRAGANA LETTER KE
    "\u{3052}".freeze => "\u{3051}".freeze,

    # 3054 HIRAGANA LETTER GO
    # ->   3053 HIRAGANA LETTER KO
    "\u{3054}".freeze => "\u{3053}".freeze,

    # 3056 HIRAGANA LETTER ZA
    # ->   3055 HIRAGANA LETTER SA
    "\u{3056}".freeze => "\u{3055}".freeze,

    # 3058 HIRAGANA LETTER ZI
    # ->   3057 HIRAGANA LETTER SI
    "\u{3058}".freeze => "\u{3057}".freeze,

    # 305A HIRAGANA LETTER ZU
    # ->   3059 HIRAGANA LETTER SU
    "\u{305A}".freeze => "\u{3059}".freeze,

    # 305C HIRAGANA LETTER ZE
    # ->   305B HIRAGANA LETTER SE
    "\u{305C}".freeze => "\u{305B}".freeze,

    # 305E HIRAGANA LETTER ZO
    # ->   305D HIRAGANA LETTER SO
    "\u{305E}".freeze => "\u{305D}".freeze,

    # 3060 HIRAGANA LETTER DA
    # ->   305F HIRAGANA LETTER TA
    "\u{3060}".freeze => "\u{305F}".freeze,

    # 3062 HIRAGANA LETTER DI
    # ->   3061 HIRAGANA LETTER TI
    "\u{3062}".freeze => "\u{3061}".freeze,

    # 3065 HIRAGANA LETTER DU
    # ->   3064 HIRAGANA LETTER TU
    "\u{3065}".freeze => "\u{3064}".freeze,

    # 3067 HIRAGANA LETTER DE
    # ->   3066 HIRAGANA LETTER TE
    "\u{3067}".freeze => "\u{3066}".freeze,

    # 3069 HIRAGANA LETTER DO
    # ->   3068 HIRAGANA LETTER TO
    "\u{3069}".freeze => "\u{3068}".freeze,

    # 3070 HIRAGANA LETTER BA
    # ->   306F HIRAGANA LETTER HA
    "\u{3070}".freeze => "\u{306F}".freeze,

    # 3071 HIRAGANA LETTER PA
    # ->   306F HIRAGANA LETTER HA
    "\u{3071}".freeze => "\u{306F}".freeze,

    # 3073 HIRAGANA LETTER BI
    # ->   3072 HIRAGANA LETTER HI
    "\u{3073}".freeze => "\u{3072}".freeze,

    # 3074 HIRAGANA LETTER PI
    # ->   3072 HIRAGANA LETTER HI
    "\u{3074}".freeze => "\u{3072}".freeze,

    # 3076 HIRAGANA LETTER BU
    # ->   3075 HIRAGANA LETTER HU
    "\u{3076}".freeze => "\u{3075}".freeze,

    # 3077 HIRAGANA LETTER PU
    # ->   3075 HIRAGANA LETTER HU
    "\u{3077}".freeze => "\u{3075}".freeze,

    # 3079 HIRAGANA LETTER BE
    # ->   3078 HIRAGANA LETTER HE
    "\u{3079}".freeze => "\u{3078}".freeze,

    # 307A HIRAGANA LETTER PE
    # ->   3078 HIRAGANA LETTER HE
    "\u{307A}".freeze => "\u{3078}".freeze,

    # 307C HIRAGANA LETTER BO
    # ->   307B HIRAGANA LETTER HO
    "\u{307C}".freeze => "\u{307B}".freeze,

    # 307D HIRAGANA LETTER PO
    # ->   307B HIRAGANA LETTER HO
    "\u{307D}".freeze => "\u{307B}".freeze,

    # 3094 HIRAGANA LETTER VU
    # ->   3046 HIRAGANA LETTER U
    "\u{3094}".freeze => "\u{3046}".freeze,

    # 309B KATAKANA-HIRAGANA VOICED SOUND MARK
    # ->   0020 SPACE
    "\u{309B}".freeze => ' '.freeze,

    # 309C KATAKANA-HIRAGANA SEMI-VOICED SOUND MARK
    # ->   0020 SPACE
    "\u{309C}".freeze => ' '.freeze,

    # 309E HIRAGANA VOICED ITERATION MARK
    # ->   309D HIRAGANA ITERATION MARK
    "\u{309E}".freeze => "\u{309D}".freeze,

    # 309F HIRAGANA DIGRAPH YORI
    # ->   3088 HIRAGANA LETTER YO
    #    + 308A HIRAGANA LETTER RI
    "\u{309F}".freeze => "\u{3088}\u{308A}".freeze,

    # 30AC KATAKANA LETTER GA
    # ->   30AB KATAKANA LETTER KA
    "\u{30AC}".freeze => "\u{30AB}".freeze,

    # 30AE KATAKANA LETTER GI
    # ->   30AD KATAKANA LETTER KI
    "\u{30AE}".freeze => "\u{30AD}".freeze,

    # 30B0 KATAKANA LETTER GU
    # ->   30AF KATAKANA LETTER KU
    "\u{30B0}".freeze => "\u{30AF}".freeze,

    # 30B2 KATAKANA LETTER GE
    # ->   30B1 KATAKANA LETTER KE
    "\u{30B2}".freeze => "\u{30B1}".freeze,

    # 30B4 KATAKANA LETTER GO
    # ->   30B3 KATAKANA LETTER KO
    "\u{30B4}".freeze => "\u{30B3}".freeze,

    # 30B6 KATAKANA LETTER ZA
    # ->   30B5 KATAKANA LETTER SA
    "\u{30B6}".freeze => "\u{30B5}".freeze,

    # 30B8 KATAKANA LETTER ZI
    # ->   30B7 KATAKANA LETTER SI
    "\u{30B8}".freeze => "\u{30B7}".freeze,

    # 30BA KATAKANA LETTER ZU
    # ->   30B9 KATAKANA LETTER SU
    "\u{30BA}".freeze => "\u{30B9}".freeze,

    # 30BC KATAKANA LETTER ZE
    # ->   30BB KATAKANA LETTER SE
    "\u{30BC}".freeze => "\u{30BB}".freeze,

    # 30BE KATAKANA LETTER ZO
    # ->   30BD KATAKANA LETTER SO
    "\u{30BE}".freeze => "\u{30BD}".freeze,

    # 30C0 KATAKANA LETTER DA
    # ->   30BF KATAKANA LETTER TA
    "\u{30C0}".freeze => "\u{30BF}".freeze,

    # 30C2 KATAKANA LETTER DI
    # ->   30C1 KATAKANA LETTER TI
    "\u{30C2}".freeze => "\u{30C1}".freeze,

    # 30C5 KATAKANA LETTER DU
    # ->   30C4 KATAKANA LETTER TU
    "\u{30C5}".freeze => "\u{30C4}".freeze,

    # 30C7 KATAKANA LETTER DE
    # ->   30C6 KATAKANA LETTER TE
    "\u{30C7}".freeze => "\u{30C6}".freeze,

    # 30C9 KATAKANA LETTER DO
    # ->   30C8 KATAKANA LETTER TO
    "\u{30C9}".freeze => "\u{30C8}".freeze,

    # 30D0 KATAKANA LETTER BA
    # ->   30CF KATAKANA LETTER HA
    "\u{30D0}".freeze => "\u{30CF}".freeze,

    # 30D1 KATAKANA LETTER PA
    # ->   30CF KATAKANA LETTER HA
    "\u{30D1}".freeze => "\u{30CF}".freeze,

    # 30D3 KATAKANA LETTER BI
    # ->   30D2 KATAKANA LETTER HI
    "\u{30D3}".freeze => "\u{30D2}".freeze,

    # 30D4 KATAKANA LETTER PI
    # ->   30D2 KATAKANA LETTER HI
    "\u{30D4}".freeze => "\u{30D2}".freeze,

    # 30D6 KATAKANA LETTER BU
    # ->   30D5 KATAKANA LETTER HU
    "\u{30D6}".freeze => "\u{30D5}".freeze,

    # 30D7 KATAKANA LETTER PU
    # ->   30D5 KATAKANA LETTER HU
    "\u{30D7}".freeze => "\u{30D5}".freeze,

    # 30D9 KATAKANA LETTER BE
    # ->   30D8 KATAKANA LETTER HE
    "\u{30D9}".freeze => "\u{30D8}".freeze,

    # 30DA KATAKANA LETTER PE
    # ->   30D8 KATAKANA LETTER HE
    "\u{30DA}".freeze => "\u{30D8}".freeze,

    # 30DC KATAKANA LETTER BO
    # ->   30DB KATAKANA LETTER HO
    "\u{30DC}".freeze => "\u{30DB}".freeze,

    # 30DD KATAKANA LETTER PO
    # ->   30DB KATAKANA LETTER HO
    "\u{30DD}".freeze => "\u{30DB}".freeze,

    # 30F4 KATAKANA LETTER VU
    # ->   30A6 KATAKANA LETTER U
    "\u{30F4}".freeze => "\u{30A6}".freeze,

    # 30F7 KATAKANA LETTER VA
    # ->   30EF KATAKANA LETTER WA
    "\u{30F7}".freeze => "\u{30EF}".freeze,

    # 30F8 KATAKANA LETTER VI
    # ->   30F0 KATAKANA LETTER WI
    "\u{30F8}".freeze => "\u{30F0}".freeze,

    # 30F9 KATAKANA LETTER VE
    # ->   30F1 KATAKANA LETTER WE
    "\u{30F9}".freeze => "\u{30F1}".freeze,

    # 30FA KATAKANA LETTER VO
    # ->   30F2 KATAKANA LETTER WO
    "\u{30FA}".freeze => "\u{30F2}".freeze,

    # 30FE KATAKANA VOICED ITERATION MARK
    # ->   30FD KATAKANA ITERATION MARK
    "\u{30FE}".freeze => "\u{30FD}".freeze,

    # 30FF KATAKANA DIGRAPH KOTO
    # ->   30B3 KATAKANA LETTER KO
    #    + 30C8 KATAKANA LETTER TO
    "\u{30FF}".freeze => "\u{30B3}\u{30C8}".freeze,

    # 3131 HANGUL LETTER KIYEOK
    # ->   1100 HANGUL CHOSEONG KIYEOK
    "\u{3131}".freeze => "\u{1100}".freeze,

    # 3132 HANGUL LETTER SSANGKIYEOK
    # ->   1101 HANGUL CHOSEONG SSANGKIYEOK
    "\u{3132}".freeze => "\u{1101}".freeze,

    # 3133 HANGUL LETTER KIYEOK-SIOS
    # ->   11AA HANGUL JONGSEONG KIYEOK-SIOS
    "\u{3133}".freeze => "\u{11AA}".freeze,

    # 3134 HANGUL LETTER NIEUN
    # ->   1102 HANGUL CHOSEONG NIEUN
    "\u{3134}".freeze => "\u{1102}".freeze,

    # 3135 HANGUL LETTER NIEUN-CIEUC
    # ->   11AC HANGUL JONGSEONG NIEUN-CIEUC
    "\u{3135}".freeze => "\u{11AC}".freeze,

    # 3136 HANGUL LETTER NIEUN-HIEUH
    # ->   11AD HANGUL JONGSEONG NIEUN-HIEUH
    "\u{3136}".freeze => "\u{11AD}".freeze,

    # 3137 HANGUL LETTER TIKEUT
    # ->   1103 HANGUL CHOSEONG TIKEUT
    "\u{3137}".freeze => "\u{1103}".freeze,

    # 3138 HANGUL LETTER SSANGTIKEUT
    # ->   1104 HANGUL CHOSEONG SSANGTIKEUT
    "\u{3138}".freeze => "\u{1104}".freeze,

    # 3139 HANGUL LETTER RIEUL
    # ->   1105 HANGUL CHOSEONG RIEUL
    "\u{3139}".freeze => "\u{1105}".freeze,

    # 313A HANGUL LETTER RIEUL-KIYEOK
    # ->   11B0 HANGUL JONGSEONG RIEUL-KIYEOK
    "\u{313A}".freeze => "\u{11B0}".freeze,

    # 313B HANGUL LETTER RIEUL-MIEUM
    # ->   11B1 HANGUL JONGSEONG RIEUL-MIEUM
    "\u{313B}".freeze => "\u{11B1}".freeze,

    # 313C HANGUL LETTER RIEUL-PIEUP
    # ->   11B2 HANGUL JONGSEONG RIEUL-PIEUP
    "\u{313C}".freeze => "\u{11B2}".freeze,

    # 313D HANGUL LETTER RIEUL-SIOS
    # ->   11B3 HANGUL JONGSEONG RIEUL-SIOS
    "\u{313D}".freeze => "\u{11B3}".freeze,

    # 313E HANGUL LETTER RIEUL-THIEUTH
    # ->   11B4 HANGUL JONGSEONG RIEUL-THIEUTH
    "\u{313E}".freeze => "\u{11B4}".freeze,

    # 313F HANGUL LETTER RIEUL-PHIEUPH
    # ->   11B5 HANGUL JONGSEONG RIEUL-PHIEUPH
    "\u{313F}".freeze => "\u{11B5}".freeze,

    # 3140 HANGUL LETTER RIEUL-HIEUH
    # ->   111A HANGUL CHOSEONG RIEUL-HIEUH
    "\u{3140}".freeze => "\u{111A}".freeze,

    # 3141 HANGUL LETTER MIEUM
    # ->   1106 HANGUL CHOSEONG MIEUM
    "\u{3141}".freeze => "\u{1106}".freeze,

    # 3142 HANGUL LETTER PIEUP
    # ->   1107 HANGUL CHOSEONG PIEUP
    "\u{3142}".freeze => "\u{1107}".freeze,

    # 3143 HANGUL LETTER SSANGPIEUP
    # ->   1108 HANGUL CHOSEONG SSANGPIEUP
    "\u{3143}".freeze => "\u{1108}".freeze,

    # 3144 HANGUL LETTER PIEUP-SIOS
    # ->   1121 HANGUL CHOSEONG PIEUP-SIOS
    "\u{3144}".freeze => "\u{1121}".freeze,

    # 3145 HANGUL LETTER SIOS
    # ->   1109 HANGUL CHOSEONG SIOS
    "\u{3145}".freeze => "\u{1109}".freeze,

    # 3146 HANGUL LETTER SSANGSIOS
    # ->   110A HANGUL CHOSEONG SSANGSIOS
    "\u{3146}".freeze => "\u{110A}".freeze,

    # 3147 HANGUL LETTER IEUNG
    # ->   110B HANGUL CHOSEONG IEUNG
    "\u{3147}".freeze => "\u{110B}".freeze,

    # 3148 HANGUL LETTER CIEUC
    # ->   110C HANGUL CHOSEONG CIEUC
    "\u{3148}".freeze => "\u{110C}".freeze,

    # 3149 HANGUL LETTER SSANGCIEUC
    # ->   110D HANGUL CHOSEONG SSANGCIEUC
    "\u{3149}".freeze => "\u{110D}".freeze,

    # 314A HANGUL LETTER CHIEUCH
    # ->   110E HANGUL CHOSEONG CHIEUCH
    "\u{314A}".freeze => "\u{110E}".freeze,

    # 314B HANGUL LETTER KHIEUKH
    # ->   110F HANGUL CHOSEONG KHIEUKH
    "\u{314B}".freeze => "\u{110F}".freeze,

    # 314C HANGUL LETTER THIEUTH
    # ->   1110 HANGUL CHOSEONG THIEUTH
    "\u{314C}".freeze => "\u{1110}".freeze,

    # 314D HANGUL LETTER PHIEUPH
    # ->   1111 HANGUL CHOSEONG PHIEUPH
    "\u{314D}".freeze => "\u{1111}".freeze,

    # 314E HANGUL LETTER HIEUH
    # ->   1112 HANGUL CHOSEONG HIEUH
    "\u{314E}".freeze => "\u{1112}".freeze,

    # 314F HANGUL LETTER A
    # ->   1161 HANGUL JUNGSEONG A
    "\u{314F}".freeze => "\u{1161}".freeze,

    # 3150 HANGUL LETTER AE
    # ->   1162 HANGUL JUNGSEONG AE
    "\u{3150}".freeze => "\u{1162}".freeze,

    # 3151 HANGUL LETTER YA
    # ->   1163 HANGUL JUNGSEONG YA
    "\u{3151}".freeze => "\u{1163}".freeze,

    # 3152 HANGUL LETTER YAE
    # ->   1164 HANGUL JUNGSEONG YAE
    "\u{3152}".freeze => "\u{1164}".freeze,

    # 3153 HANGUL LETTER EO
    # ->   1165 HANGUL JUNGSEONG EO
    "\u{3153}".freeze => "\u{1165}".freeze,

    # 3154 HANGUL LETTER E
    # ->   1166 HANGUL JUNGSEONG E
    "\u{3154}".freeze => "\u{1166}".freeze,

    # 3155 HANGUL LETTER YEO
    # ->   1167 HANGUL JUNGSEONG YEO
    "\u{3155}".freeze => "\u{1167}".freeze,

    # 3156 HANGUL LETTER YE
    # ->   1168 HANGUL JUNGSEONG YE
    "\u{3156}".freeze => "\u{1168}".freeze,

    # 3157 HANGUL LETTER O
    # ->   1169 HANGUL JUNGSEONG O
    "\u{3157}".freeze => "\u{1169}".freeze,

    # 3158 HANGUL LETTER WA
    # ->   116A HANGUL JUNGSEONG WA
    "\u{3158}".freeze => "\u{116A}".freeze,

    # 3159 HANGUL LETTER WAE
    # ->   116B HANGUL JUNGSEONG WAE
    "\u{3159}".freeze => "\u{116B}".freeze,

    # 315A HANGUL LETTER OE
    # ->   116C HANGUL JUNGSEONG OE
    "\u{315A}".freeze => "\u{116C}".freeze,

    # 315B HANGUL LETTER YO
    # ->   116D HANGUL JUNGSEONG YO
    "\u{315B}".freeze => "\u{116D}".freeze,

    # 315C HANGUL LETTER U
    # ->   116E HANGUL JUNGSEONG U
    "\u{315C}".freeze => "\u{116E}".freeze,

    # 315D HANGUL LETTER WEO
    # ->   116F HANGUL JUNGSEONG WEO
    "\u{315D}".freeze => "\u{116F}".freeze,

    # 315E HANGUL LETTER WE
    # ->   1170 HANGUL JUNGSEONG WE
    "\u{315E}".freeze => "\u{1170}".freeze,

    # 315F HANGUL LETTER WI
    # ->   1171 HANGUL JUNGSEONG WI
    "\u{315F}".freeze => "\u{1171}".freeze,

    # 3160 HANGUL LETTER YU
    # ->   1172 HANGUL JUNGSEONG YU
    "\u{3160}".freeze => "\u{1172}".freeze,

    # 3161 HANGUL LETTER EU
    # ->   1173 HANGUL JUNGSEONG EU
    "\u{3161}".freeze => "\u{1173}".freeze,

    # 3162 HANGUL LETTER YI
    # ->   1174 HANGUL JUNGSEONG YI
    "\u{3162}".freeze => "\u{1174}".freeze,

    # 3163 HANGUL LETTER I
    # ->   1175 HANGUL JUNGSEONG I
    "\u{3163}".freeze => "\u{1175}".freeze,

    # 3164 HANGUL FILLER
    # ->   1160 HANGUL JUNGSEONG FILLER
    "\u{3164}".freeze => "\u{1160}".freeze,

    # 3165 HANGUL LETTER SSANGNIEUN
    # ->   1114 HANGUL CHOSEONG SSANGNIEUN
    "\u{3165}".freeze => "\u{1114}".freeze,

    # 3166 HANGUL LETTER NIEUN-TIKEUT
    # ->   1115 HANGUL CHOSEONG NIEUN-TIKEUT
    "\u{3166}".freeze => "\u{1115}".freeze,

    # 3167 HANGUL LETTER NIEUN-SIOS
    # ->   11C7 HANGUL JONGSEONG NIEUN-SIOS
    "\u{3167}".freeze => "\u{11C7}".freeze,

    # 3168 HANGUL LETTER NIEUN-PANSIOS
    # ->   11C8 HANGUL JONGSEONG NIEUN-PANSIOS
    "\u{3168}".freeze => "\u{11C8}".freeze,

    # 3169 HANGUL LETTER RIEUL-KIYEOK-SIOS
    # ->   11CC HANGUL JONGSEONG RIEUL-KIYEOK-SIOS
    "\u{3169}".freeze => "\u{11CC}".freeze,

    # 316A HANGUL LETTER RIEUL-TIKEUT
    # ->   11CE HANGUL JONGSEONG RIEUL-TIKEUT
    "\u{316A}".freeze => "\u{11CE}".freeze,

    # 316B HANGUL LETTER RIEUL-PIEUP-SIOS
    # ->   11D3 HANGUL JONGSEONG RIEUL-PIEUP-SIOS
    "\u{316B}".freeze => "\u{11D3}".freeze,

    # 316C HANGUL LETTER RIEUL-PANSIOS
    # ->   11D7 HANGUL JONGSEONG RIEUL-PANSIOS
    "\u{316C}".freeze => "\u{11D7}".freeze,

    # 316D HANGUL LETTER RIEUL-YEORINHIEUH
    # ->   11D9 HANGUL JONGSEONG RIEUL-YEORINHIEUH
    "\u{316D}".freeze => "\u{11D9}".freeze,

    # 316E HANGUL LETTER MIEUM-PIEUP
    # ->   111C HANGUL CHOSEONG MIEUM-PIEUP
    "\u{316E}".freeze => "\u{111C}".freeze,

    # 316F HANGUL LETTER MIEUM-SIOS
    # ->   11DD HANGUL JONGSEONG MIEUM-SIOS
    "\u{316F}".freeze => "\u{11DD}".freeze,

    # 3170 HANGUL LETTER MIEUM-PANSIOS
    # ->   11DF HANGUL JONGSEONG MIEUM-PANSIOS
    "\u{3170}".freeze => "\u{11DF}".freeze,

    # 3171 HANGUL LETTER KAPYEOUNMIEUM
    # ->   111D HANGUL CHOSEONG KAPYEOUNMIEUM
    "\u{3171}".freeze => "\u{111D}".freeze,

    # 3172 HANGUL LETTER PIEUP-KIYEOK
    # ->   111E HANGUL CHOSEONG PIEUP-KIYEOK
    "\u{3172}".freeze => "\u{111E}".freeze,

    # 3173 HANGUL LETTER PIEUP-TIKEUT
    # ->   1120 HANGUL CHOSEONG PIEUP-TIKEUT
    "\u{3173}".freeze => "\u{1120}".freeze,

    # 3174 HANGUL LETTER PIEUP-SIOS-KIYEOK
    # ->   1122 HANGUL CHOSEONG PIEUP-SIOS-KIYEOK
    "\u{3174}".freeze => "\u{1122}".freeze,

    # 3175 HANGUL LETTER PIEUP-SIOS-TIKEUT
    # ->   1123 HANGUL CHOSEONG PIEUP-SIOS-TIKEUT
    "\u{3175}".freeze => "\u{1123}".freeze,

    # 3176 HANGUL LETTER PIEUP-CIEUC
    # ->   1127 HANGUL CHOSEONG PIEUP-CIEUC
    "\u{3176}".freeze => "\u{1127}".freeze,

    # 3177 HANGUL LETTER PIEUP-THIEUTH
    # ->   1129 HANGUL CHOSEONG PIEUP-THIEUTH
    "\u{3177}".freeze => "\u{1129}".freeze,

    # 3178 HANGUL LETTER KAPYEOUNPIEUP
    # ->   112B HANGUL CHOSEONG KAPYEOUNPIEUP
    "\u{3178}".freeze => "\u{112B}".freeze,

    # 3179 HANGUL LETTER KAPYEOUNSSANGPIEUP
    # ->   112C HANGUL CHOSEONG KAPYEOUNSSANGPIEUP
    "\u{3179}".freeze => "\u{112C}".freeze,

    # 317A HANGUL LETTER SIOS-KIYEOK
    # ->   112D HANGUL CHOSEONG SIOS-KIYEOK
    "\u{317A}".freeze => "\u{112D}".freeze,

    # 317B HANGUL LETTER SIOS-NIEUN
    # ->   112E HANGUL CHOSEONG SIOS-NIEUN
    "\u{317B}".freeze => "\u{112E}".freeze,

    # 317C HANGUL LETTER SIOS-TIKEUT
    # ->   112F HANGUL CHOSEONG SIOS-TIKEUT
    "\u{317C}".freeze => "\u{112F}".freeze,

    # 317D HANGUL LETTER SIOS-PIEUP
    # ->   1132 HANGUL CHOSEONG SIOS-PIEUP
    "\u{317D}".freeze => "\u{1132}".freeze,

    # 317E HANGUL LETTER SIOS-CIEUC
    # ->   1136 HANGUL CHOSEONG SIOS-CIEUC
    "\u{317E}".freeze => "\u{1136}".freeze,

    # 317F HANGUL LETTER PANSIOS
    # ->   1140 HANGUL CHOSEONG PANSIOS
    "\u{317F}".freeze => "\u{1140}".freeze,

    # 3180 HANGUL LETTER SSANGIEUNG
    # ->   1147 HANGUL CHOSEONG SSANGIEUNG
    "\u{3180}".freeze => "\u{1147}".freeze,

    # 3181 HANGUL LETTER YESIEUNG
    # ->   114C HANGUL CHOSEONG YESIEUNG
    "\u{3181}".freeze => "\u{114C}".freeze,

    # 3182 HANGUL LETTER YESIEUNG-SIOS
    # ->   11F1 HANGUL JONGSEONG YESIEUNG-SIOS
    "\u{3182}".freeze => "\u{11F1}".freeze,

    # 3183 HANGUL LETTER YESIEUNG-PANSIOS
    # ->   11F2 HANGUL JONGSEONG YESIEUNG-PANSIOS
    "\u{3183}".freeze => "\u{11F2}".freeze,

    # 3184 HANGUL LETTER KAPYEOUNPHIEUPH
    # ->   1157 HANGUL CHOSEONG KAPYEOUNPHIEUPH
    "\u{3184}".freeze => "\u{1157}".freeze,

    # 3185 HANGUL LETTER SSANGHIEUH
    # ->   1158 HANGUL CHOSEONG SSANGHIEUH
    "\u{3185}".freeze => "\u{1158}".freeze,

    # 3186 HANGUL LETTER YEORINHIEUH
    # ->   1159 HANGUL CHOSEONG YEORINHIEUH
    "\u{3186}".freeze => "\u{1159}".freeze,

    # 3187 HANGUL LETTER YO-YA
    # ->   1184 HANGUL JUNGSEONG YO-YA
    "\u{3187}".freeze => "\u{1184}".freeze,

    # 3188 HANGUL LETTER YO-YAE
    # ->   1185 HANGUL JUNGSEONG YO-YAE
    "\u{3188}".freeze => "\u{1185}".freeze,

    # 3189 HANGUL LETTER YO-I
    # ->   1188 HANGUL JUNGSEONG YO-I
    "\u{3189}".freeze => "\u{1188}".freeze,

    # 318A HANGUL LETTER YU-YEO
    # ->   1191 HANGUL JUNGSEONG YU-YEO
    "\u{318A}".freeze => "\u{1191}".freeze,

    # 318B HANGUL LETTER YU-YE
    # ->   1192 HANGUL JUNGSEONG YU-YE
    "\u{318B}".freeze => "\u{1192}".freeze,

    # 318C HANGUL LETTER YU-I
    # ->   1194 HANGUL JUNGSEONG YU-I
    "\u{318C}".freeze => "\u{1194}".freeze,

    # 318D HANGUL LETTER ARAEA
    # ->   119E HANGUL JUNGSEONG ARAEA
    "\u{318D}".freeze => "\u{119E}".freeze,

    # 318E HANGUL LETTER ARAEAE
    # ->   11A1 HANGUL JUNGSEONG ARAEA-I
    "\u{318E}".freeze => "\u{11A1}".freeze,

    # 3192 IDEOGRAPHIC ANNOTATION ONE MARK
    # ->   4E00 CJK UNIFIED IDEOGRAPH 4E00
    "\u{3192}".freeze => "\u{4E00}".freeze,

    # 3193 IDEOGRAPHIC ANNOTATION TWO MARK
    # ->   4E8C CJK UNIFIED IDEOGRAPH 4E8C
    "\u{3193}".freeze => "\u{4E8C}".freeze,

    # 3194 IDEOGRAPHIC ANNOTATION THREE MARK
    # ->   4E09 CJK UNIFIED IDEOGRAPH 4E09
    "\u{3194}".freeze => "\u{4E09}".freeze,

    # 3195 IDEOGRAPHIC ANNOTATION FOUR MARK
    # ->   56DB CJK UNIFIED IDEOGRAPH 56DB
    "\u{3195}".freeze => "\u{56DB}".freeze,

    # 3196 IDEOGRAPHIC ANNOTATION TOP MARK
    # ->   4E0A CJK UNIFIED IDEOGRAPH 4E0A
    "\u{3196}".freeze => "\u{4E0A}".freeze,

    # 3197 IDEOGRAPHIC ANNOTATION MIDDLE MARK
    # ->   4E2D CJK UNIFIED IDEOGRAPH 4E2D
    "\u{3197}".freeze => "\u{4E2D}".freeze,

    # 3198 IDEOGRAPHIC ANNOTATION BOTTOM MARK
    # ->   4E0B CJK UNIFIED IDEOGRAPH 4E0B
    "\u{3198}".freeze => "\u{4E0B}".freeze,

    # 3199 IDEOGRAPHIC ANNOTATION FIRST MARK
    # ->   7532 CJK UNIFIED IDEOGRAPH 7532
    "\u{3199}".freeze => "\u{7532}".freeze,

    # 319A IDEOGRAPHIC ANNOTATION SECOND MARK
    # ->   4E59 CJK UNIFIED IDEOGRAPH 4E59
    "\u{319A}".freeze => "\u{4E59}".freeze,

    # 319B IDEOGRAPHIC ANNOTATION THIRD MARK
    # ->   4E19 CJK UNIFIED IDEOGRAPH 4E19
    "\u{319B}".freeze => "\u{4E19}".freeze,

    # 319C IDEOGRAPHIC ANNOTATION FOURTH MARK
    # ->   4E01 CJK UNIFIED IDEOGRAPH 4E01
    "\u{319C}".freeze => "\u{4E01}".freeze,

    # 319D IDEOGRAPHIC ANNOTATION HEAVEN MARK
    # ->   5929 CJK UNIFIED IDEOGRAPH 5929
    "\u{319D}".freeze => "\u{5929}".freeze,

    # 319E IDEOGRAPHIC ANNOTATION EARTH MARK
    # ->   5730 CJK UNIFIED IDEOGRAPH 5730
    "\u{319E}".freeze => "\u{5730}".freeze,

    # 319F IDEOGRAPHIC ANNOTATION MAN MARK
    # ->   4EBA CJK UNIFIED IDEOGRAPH 4EBA
    "\u{319F}".freeze => "\u{4EBA}".freeze,

    # 3200 PARENTHESIZED HANGUL KIYEOK
    # ->   0028 LEFT PARENTHESIS
    #    + 1100 HANGUL CHOSEONG KIYEOK
    #    + 0029 RIGHT PARENTHESIS
    "\u{3200}".freeze => "(\u{1100})".freeze,

    # 3201 PARENTHESIZED HANGUL NIEUN
    # ->   0028 LEFT PARENTHESIS
    #    + 1102 HANGUL CHOSEONG NIEUN
    #    + 0029 RIGHT PARENTHESIS
    "\u{3201}".freeze => "(\u{1102})".freeze,

    # 3202 PARENTHESIZED HANGUL TIKEUT
    # ->   0028 LEFT PARENTHESIS
    #    + 1103 HANGUL CHOSEONG TIKEUT
    #    + 0029 RIGHT PARENTHESIS
    "\u{3202}".freeze => "(\u{1103})".freeze,

    # 3203 PARENTHESIZED HANGUL RIEUL
    # ->   0028 LEFT PARENTHESIS
    #    + 1105 HANGUL CHOSEONG RIEUL
    #    + 0029 RIGHT PARENTHESIS
    "\u{3203}".freeze => "(\u{1105})".freeze,

    # 3204 PARENTHESIZED HANGUL MIEUM
    # ->   0028 LEFT PARENTHESIS
    #    + 1106 HANGUL CHOSEONG MIEUM
    #    + 0029 RIGHT PARENTHESIS
    "\u{3204}".freeze => "(\u{1106})".freeze,

    # 3205 PARENTHESIZED HANGUL PIEUP
    # ->   0028 LEFT PARENTHESIS
    #    + 1107 HANGUL CHOSEONG PIEUP
    #    + 0029 RIGHT PARENTHESIS
    "\u{3205}".freeze => "(\u{1107})".freeze,

    # 3206 PARENTHESIZED HANGUL SIOS
    # ->   0028 LEFT PARENTHESIS
    #    + 1109 HANGUL CHOSEONG SIOS
    #    + 0029 RIGHT PARENTHESIS
    "\u{3206}".freeze => "(\u{1109})".freeze,

    # 3207 PARENTHESIZED HANGUL IEUNG
    # ->   0028 LEFT PARENTHESIS
    #    + 110B HANGUL CHOSEONG IEUNG
    #    + 0029 RIGHT PARENTHESIS
    "\u{3207}".freeze => "(\u{110B})".freeze,

    # 3208 PARENTHESIZED HANGUL CIEUC
    # ->   0028 LEFT PARENTHESIS
    #    + 110C HANGUL CHOSEONG CIEUC
    #    + 0029 RIGHT PARENTHESIS
    "\u{3208}".freeze => "(\u{110C})".freeze,

    # 3209 PARENTHESIZED HANGUL CHIEUCH
    # ->   0028 LEFT PARENTHESIS
    #    + 110E HANGUL CHOSEONG CHIEUCH
    #    + 0029 RIGHT PARENTHESIS
    "\u{3209}".freeze => "(\u{110E})".freeze,

    # 320A PARENTHESIZED HANGUL KHIEUKH
    # ->   0028 LEFT PARENTHESIS
    #    + 110F HANGUL CHOSEONG KHIEUKH
    #    + 0029 RIGHT PARENTHESIS
    "\u{320A}".freeze => "(\u{110F})".freeze,

    # 320B PARENTHESIZED HANGUL THIEUTH
    # ->   0028 LEFT PARENTHESIS
    #    + 1110 HANGUL CHOSEONG THIEUTH
    #    + 0029 RIGHT PARENTHESIS
    "\u{320B}".freeze => "(\u{1110})".freeze,

    # 320C PARENTHESIZED HANGUL PHIEUPH
    # ->   0028 LEFT PARENTHESIS
    #    + 1111 HANGUL CHOSEONG PHIEUPH
    #    + 0029 RIGHT PARENTHESIS
    "\u{320C}".freeze => "(\u{1111})".freeze,

    # 320D PARENTHESIZED HANGUL HIEUH
    # ->   0028 LEFT PARENTHESIS
    #    + 1112 HANGUL CHOSEONG HIEUH
    #    + 0029 RIGHT PARENTHESIS
    "\u{320D}".freeze => "(\u{1112})".freeze,

    # 320E PARENTHESIZED HANGUL KIYEOK A
    # ->   0028 LEFT PARENTHESIS
    #    + 1100 HANGUL CHOSEONG KIYEOK
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{320E}".freeze => "(\u{1100}\u{1161})".freeze,

    # 320F PARENTHESIZED HANGUL NIEUN A
    # ->   0028 LEFT PARENTHESIS
    #    + 1102 HANGUL CHOSEONG NIEUN
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{320F}".freeze => "(\u{1102}\u{1161})".freeze,

    # 3210 PARENTHESIZED HANGUL TIKEUT A
    # ->   0028 LEFT PARENTHESIS
    #    + 1103 HANGUL CHOSEONG TIKEUT
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3210}".freeze => "(\u{1103}\u{1161})".freeze,

    # 3211 PARENTHESIZED HANGUL RIEUL A
    # ->   0028 LEFT PARENTHESIS
    #    + 1105 HANGUL CHOSEONG RIEUL
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3211}".freeze => "(\u{1105}\u{1161})".freeze,

    # 3212 PARENTHESIZED HANGUL MIEUM A
    # ->   0028 LEFT PARENTHESIS
    #    + 1106 HANGUL CHOSEONG MIEUM
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3212}".freeze => "(\u{1106}\u{1161})".freeze,

    # 3213 PARENTHESIZED HANGUL PIEUP A
    # ->   0028 LEFT PARENTHESIS
    #    + 1107 HANGUL CHOSEONG PIEUP
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3213}".freeze => "(\u{1107}\u{1161})".freeze,

    # 3214 PARENTHESIZED HANGUL SIOS A
    # ->   0028 LEFT PARENTHESIS
    #    + 1109 HANGUL CHOSEONG SIOS
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3214}".freeze => "(\u{1109}\u{1161})".freeze,

    # 3215 PARENTHESIZED HANGUL IEUNG A
    # ->   0028 LEFT PARENTHESIS
    #    + 110B HANGUL CHOSEONG IEUNG
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3215}".freeze => "(\u{110B}\u{1161})".freeze,

    # 3216 PARENTHESIZED HANGUL CIEUC A
    # ->   0028 LEFT PARENTHESIS
    #    + 110C HANGUL CHOSEONG CIEUC
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3216}".freeze => "(\u{110C}\u{1161})".freeze,

    # 3217 PARENTHESIZED HANGUL CHIEUCH A
    # ->   0028 LEFT PARENTHESIS
    #    + 110E HANGUL CHOSEONG CHIEUCH
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3217}".freeze => "(\u{110E}\u{1161})".freeze,

    # 3218 PARENTHESIZED HANGUL KHIEUKH A
    # ->   0028 LEFT PARENTHESIS
    #    + 110F HANGUL CHOSEONG KHIEUKH
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3218}".freeze => "(\u{110F}\u{1161})".freeze,

    # 3219 PARENTHESIZED HANGUL THIEUTH A
    # ->   0028 LEFT PARENTHESIS
    #    + 1110 HANGUL CHOSEONG THIEUTH
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3219}".freeze => "(\u{1110}\u{1161})".freeze,

    # 321A PARENTHESIZED HANGUL PHIEUPH A
    # ->   0028 LEFT PARENTHESIS
    #    + 1111 HANGUL CHOSEONG PHIEUPH
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{321A}".freeze => "(\u{1111}\u{1161})".freeze,

    # 321B PARENTHESIZED HANGUL HIEUH A
    # ->   0028 LEFT PARENTHESIS
    #    + 1112 HANGUL CHOSEONG HIEUH
    #    + 1161 HANGUL JUNGSEONG A
    #    + 0029 RIGHT PARENTHESIS
    "\u{321B}".freeze => "(\u{1112}\u{1161})".freeze,

    # 321C PARENTHESIZED HANGUL CIEUC U
    # ->   0028 LEFT PARENTHESIS
    #    + 110C HANGUL CHOSEONG CIEUC
    #    + 116E HANGUL JUNGSEONG U
    #    + 0029 RIGHT PARENTHESIS
    "\u{321C}".freeze => "(\u{110C}\u{116E})".freeze,

    # 321D PARENTHESIZED KOREAN CHARACTER OJEON
    # ->   0028 LEFT PARENTHESIS
    #    + 110B HANGUL CHOSEONG IEUNG
    #    + 1169 HANGUL JUNGSEONG O
    #    + 110C HANGUL CHOSEONG CIEUC
    #    + 1165 HANGUL JUNGSEONG EO
    #    + 11AB HANGUL JONGSEONG NIEUN
    #    + 0029 RIGHT PARENTHESIS
    "\u{321D}".freeze => "(\u{110B}\u{1169}\u{110C}\u{1165}\u{11AB})".freeze,

    # 321E PARENTHESIZED KOREAN CHARACTER O HU
    # ->   0028 LEFT PARENTHESIS
    #    + 110B HANGUL CHOSEONG IEUNG
    #    + 1169 HANGUL JUNGSEONG O
    #    + 1112 HANGUL CHOSEONG HIEUH
    #    + 116E HANGUL JUNGSEONG U
    #    + 0029 RIGHT PARENTHESIS
    "\u{321E}".freeze => "(\u{110B}\u{1169}\u{1112}\u{116E})".freeze,

    # 3220 PARENTHESIZED IDEOGRAPH ONE
    # ->   0028 LEFT PARENTHESIS
    #    + 4E00 CJK UNIFIED IDEOGRAPH 4E00
    #    + 0029 RIGHT PARENTHESIS
    "\u{3220}".freeze => "(\u{4E00})".freeze,

    # 3221 PARENTHESIZED IDEOGRAPH TWO
    # ->   0028 LEFT PARENTHESIS
    #    + 4E8C CJK UNIFIED IDEOGRAPH 4E8C
    #    + 0029 RIGHT PARENTHESIS
    "\u{3221}".freeze => "(\u{4E8C})".freeze,

    # 3222 PARENTHESIZED IDEOGRAPH THREE
    # ->   0028 LEFT PARENTHESIS
    #    + 4E09 CJK UNIFIED IDEOGRAPH 4E09
    #    + 0029 RIGHT PARENTHESIS
    "\u{3222}".freeze => "(\u{4E09})".freeze,

    # 3223 PARENTHESIZED IDEOGRAPH FOUR
    # ->   0028 LEFT PARENTHESIS
    #    + 56DB CJK UNIFIED IDEOGRAPH 56DB
    #    + 0029 RIGHT PARENTHESIS
    "\u{3223}".freeze => "(\u{56DB})".freeze,

    # 3224 PARENTHESIZED IDEOGRAPH FIVE
    # ->   0028 LEFT PARENTHESIS
    #    + 4E94 CJK UNIFIED IDEOGRAPH 4E94
    #    + 0029 RIGHT PARENTHESIS
    "\u{3224}".freeze => "(\u{4E94})".freeze,

    # 3225 PARENTHESIZED IDEOGRAPH SIX
    # ->   0028 LEFT PARENTHESIS
    #    + 516D CJK UNIFIED IDEOGRAPH 516D
    #    + 0029 RIGHT PARENTHESIS
    "\u{3225}".freeze => "(\u{516D})".freeze,

    # 3226 PARENTHESIZED IDEOGRAPH SEVEN
    # ->   0028 LEFT PARENTHESIS
    #    + 4E03 CJK UNIFIED IDEOGRAPH 4E03
    #    + 0029 RIGHT PARENTHESIS
    "\u{3226}".freeze => "(\u{4E03})".freeze,

    # 3227 PARENTHESIZED IDEOGRAPH EIGHT
    # ->   0028 LEFT PARENTHESIS
    #    + 516B CJK UNIFIED IDEOGRAPH 516B
    #    + 0029 RIGHT PARENTHESIS
    "\u{3227}".freeze => "(\u{516B})".freeze,

    # 3228 PARENTHESIZED IDEOGRAPH NINE
    # ->   0028 LEFT PARENTHESIS
    #    + 4E5D CJK UNIFIED IDEOGRAPH 4E5D
    #    + 0029 RIGHT PARENTHESIS
    "\u{3228}".freeze => "(\u{4E5D})".freeze,

    # 3229 PARENTHESIZED IDEOGRAPH TEN
    # ->   0028 LEFT PARENTHESIS
    #    + 5341 CJK UNIFIED IDEOGRAPH 5341
    #    + 0029 RIGHT PARENTHESIS
    "\u{3229}".freeze => "(\u{5341})".freeze,

    # 322A PARENTHESIZED IDEOGRAPH MOON
    # ->   0028 LEFT PARENTHESIS
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    #    + 0029 RIGHT PARENTHESIS
    "\u{322A}".freeze => "(\u{6708})".freeze,

    # 322B PARENTHESIZED IDEOGRAPH FIRE
    # ->   0028 LEFT PARENTHESIS
    #    + 706B CJK UNIFIED IDEOGRAPH 706B
    #    + 0029 RIGHT PARENTHESIS
    "\u{322B}".freeze => "(\u{706B})".freeze,

    # 322C PARENTHESIZED IDEOGRAPH WATER
    # ->   0028 LEFT PARENTHESIS
    #    + 6C34 CJK UNIFIED IDEOGRAPH 6C34
    #    + 0029 RIGHT PARENTHESIS
    "\u{322C}".freeze => "(\u{6C34})".freeze,

    # 322D PARENTHESIZED IDEOGRAPH WOOD
    # ->   0028 LEFT PARENTHESIS
    #    + 6728 CJK UNIFIED IDEOGRAPH 6728
    #    + 0029 RIGHT PARENTHESIS
    "\u{322D}".freeze => "(\u{6728})".freeze,

    # 322E PARENTHESIZED IDEOGRAPH METAL
    # ->   0028 LEFT PARENTHESIS
    #    + 91D1 CJK UNIFIED IDEOGRAPH 91D1
    #    + 0029 RIGHT PARENTHESIS
    "\u{322E}".freeze => "(\u{91D1})".freeze,

    # 322F PARENTHESIZED IDEOGRAPH EARTH
    # ->   0028 LEFT PARENTHESIS
    #    + 571F CJK UNIFIED IDEOGRAPH 571F
    #    + 0029 RIGHT PARENTHESIS
    "\u{322F}".freeze => "(\u{571F})".freeze,

    # 3230 PARENTHESIZED IDEOGRAPH SUN
    # ->   0028 LEFT PARENTHESIS
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    #    + 0029 RIGHT PARENTHESIS
    "\u{3230}".freeze => "(\u{65E5})".freeze,

    # 3231 PARENTHESIZED IDEOGRAPH STOCK
    # ->   0028 LEFT PARENTHESIS
    #    + 682A CJK UNIFIED IDEOGRAPH 682A
    #    + 0029 RIGHT PARENTHESIS
    "\u{3231}".freeze => "(\u{682A})".freeze,

    # 3232 PARENTHESIZED IDEOGRAPH HAVE
    # ->   0028 LEFT PARENTHESIS
    #    + 6709 CJK UNIFIED IDEOGRAPH 6709
    #    + 0029 RIGHT PARENTHESIS
    "\u{3232}".freeze => "(\u{6709})".freeze,

    # 3233 PARENTHESIZED IDEOGRAPH SOCIETY
    # ->   0028 LEFT PARENTHESIS
    #    + 793E CJK UNIFIED IDEOGRAPH 793E
    #    + 0029 RIGHT PARENTHESIS
    "\u{3233}".freeze => "(\u{793E})".freeze,

    # 3234 PARENTHESIZED IDEOGRAPH NAME
    # ->   0028 LEFT PARENTHESIS
    #    + 540D CJK UNIFIED IDEOGRAPH 540D
    #    + 0029 RIGHT PARENTHESIS
    "\u{3234}".freeze => "(\u{540D})".freeze,

    # 3235 PARENTHESIZED IDEOGRAPH SPECIAL
    # ->   0028 LEFT PARENTHESIS
    #    + 7279 CJK UNIFIED IDEOGRAPH 7279
    #    + 0029 RIGHT PARENTHESIS
    "\u{3235}".freeze => "(\u{7279})".freeze,

    # 3236 PARENTHESIZED IDEOGRAPH FINANCIAL
    # ->   0028 LEFT PARENTHESIS
    #    + 8CA1 CJK UNIFIED IDEOGRAPH 8CA1
    #    + 0029 RIGHT PARENTHESIS
    "\u{3236}".freeze => "(\u{8CA1})".freeze,

    # 3237 PARENTHESIZED IDEOGRAPH CONGRATULATION
    # ->   0028 LEFT PARENTHESIS
    #    + 795D CJK UNIFIED IDEOGRAPH 795D
    #    + 0029 RIGHT PARENTHESIS
    "\u{3237}".freeze => "(\u{795D})".freeze,

    # 3238 PARENTHESIZED IDEOGRAPH LABOR
    # ->   0028 LEFT PARENTHESIS
    #    + 52B4 CJK UNIFIED IDEOGRAPH 52B4
    #    + 0029 RIGHT PARENTHESIS
    "\u{3238}".freeze => "(\u{52B4})".freeze,

    # 3239 PARENTHESIZED IDEOGRAPH REPRESENT
    # ->   0028 LEFT PARENTHESIS
    #    + 4EE3 CJK UNIFIED IDEOGRAPH 4EE3
    #    + 0029 RIGHT PARENTHESIS
    "\u{3239}".freeze => "(\u{4EE3})".freeze,

    # 323A PARENTHESIZED IDEOGRAPH CALL
    # ->   0028 LEFT PARENTHESIS
    #    + 547C CJK UNIFIED IDEOGRAPH 547C
    #    + 0029 RIGHT PARENTHESIS
    "\u{323A}".freeze => "(\u{547C})".freeze,

    # 323B PARENTHESIZED IDEOGRAPH STUDY
    # ->   0028 LEFT PARENTHESIS
    #    + 5B66 CJK UNIFIED IDEOGRAPH 5B66
    #    + 0029 RIGHT PARENTHESIS
    "\u{323B}".freeze => "(\u{5B66})".freeze,

    # 323C PARENTHESIZED IDEOGRAPH SUPERVISE
    # ->   0028 LEFT PARENTHESIS
    #    + 76E3 CJK UNIFIED IDEOGRAPH 76E3
    #    + 0029 RIGHT PARENTHESIS
    "\u{323C}".freeze => "(\u{76E3})".freeze,

    # 323D PARENTHESIZED IDEOGRAPH ENTERPRISE
    # ->   0028 LEFT PARENTHESIS
    #    + 4F01 CJK UNIFIED IDEOGRAPH 4F01
    #    + 0029 RIGHT PARENTHESIS
    "\u{323D}".freeze => "(\u{4F01})".freeze,

    # 323E PARENTHESIZED IDEOGRAPH RESOURCE
    # ->   0028 LEFT PARENTHESIS
    #    + 8CC7 CJK UNIFIED IDEOGRAPH 8CC7
    #    + 0029 RIGHT PARENTHESIS
    "\u{323E}".freeze => "(\u{8CC7})".freeze,

    # 323F PARENTHESIZED IDEOGRAPH ALLIANCE
    # ->   0028 LEFT PARENTHESIS
    #    + 5354 CJK UNIFIED IDEOGRAPH 5354
    #    + 0029 RIGHT PARENTHESIS
    "\u{323F}".freeze => "(\u{5354})".freeze,

    # 3240 PARENTHESIZED IDEOGRAPH FESTIVAL
    # ->   0028 LEFT PARENTHESIS
    #    + 796D CJK UNIFIED IDEOGRAPH 796D
    #    + 0029 RIGHT PARENTHESIS
    "\u{3240}".freeze => "(\u{796D})".freeze,

    # 3241 PARENTHESIZED IDEOGRAPH REST
    # ->   0028 LEFT PARENTHESIS
    #    + 4F11 CJK UNIFIED IDEOGRAPH 4F11
    #    + 0029 RIGHT PARENTHESIS
    "\u{3241}".freeze => "(\u{4F11})".freeze,

    # 3242 PARENTHESIZED IDEOGRAPH SELF
    # ->   0028 LEFT PARENTHESIS
    #    + 81EA CJK UNIFIED IDEOGRAPH 81EA
    #    + 0029 RIGHT PARENTHESIS
    "\u{3242}".freeze => "(\u{81EA})".freeze,

    # 3243 PARENTHESIZED IDEOGRAPH REACH
    # ->   0028 LEFT PARENTHESIS
    #    + 81F3 CJK UNIFIED IDEOGRAPH 81F3
    #    + 0029 RIGHT PARENTHESIS
    "\u{3243}".freeze => "(\u{81F3})".freeze,

    # 3250 PARTNERSHIP SIGN
    # ->   0050 LATIN CAPITAL LETTER P
    #    + 0054 LATIN CAPITAL LETTER T
    #    + 0045 LATIN CAPITAL LETTER E
    "\u{3250}".freeze => 'PTE'.freeze,

    # 3251 CIRCLED NUMBER TWENTY ONE
    # ->   0032 DIGIT TWO
    #    + 0031 DIGIT ONE
    "\u{3251}".freeze => '21'.freeze,

    # 3252 CIRCLED NUMBER TWENTY TWO
    # ->   0032 DIGIT TWO
    #    + 0032 DIGIT TWO
    "\u{3252}".freeze => '22'.freeze,

    # 3253 CIRCLED NUMBER TWENTY THREE
    # ->   0032 DIGIT TWO
    #    + 0033 DIGIT THREE
    "\u{3253}".freeze => '23'.freeze,

    # 3254 CIRCLED NUMBER TWENTY FOUR
    # ->   0032 DIGIT TWO
    #    + 0034 DIGIT FOUR
    "\u{3254}".freeze => '24'.freeze,

    # 3255 CIRCLED NUMBER TWENTY FIVE
    # ->   0032 DIGIT TWO
    #    + 0035 DIGIT FIVE
    "\u{3255}".freeze => '25'.freeze,

    # 3256 CIRCLED NUMBER TWENTY SIX
    # ->   0032 DIGIT TWO
    #    + 0036 DIGIT SIX
    "\u{3256}".freeze => '26'.freeze,

    # 3257 CIRCLED NUMBER TWENTY SEVEN
    # ->   0032 DIGIT TWO
    #    + 0037 DIGIT SEVEN
    "\u{3257}".freeze => '27'.freeze,

    # 3258 CIRCLED NUMBER TWENTY EIGHT
    # ->   0032 DIGIT TWO
    #    + 0038 DIGIT EIGHT
    "\u{3258}".freeze => '28'.freeze,

    # 3259 CIRCLED NUMBER TWENTY NINE
    # ->   0032 DIGIT TWO
    #    + 0039 DIGIT NINE
    "\u{3259}".freeze => '29'.freeze,

    # 325A CIRCLED NUMBER THIRTY
    # ->   0033 DIGIT THREE
    #    + 0030 DIGIT ZERO
    "\u{325A}".freeze => '30'.freeze,

    # 325B CIRCLED NUMBER THIRTY ONE
    # ->   0033 DIGIT THREE
    #    + 0031 DIGIT ONE
    "\u{325B}".freeze => '31'.freeze,

    # 325C CIRCLED NUMBER THIRTY TWO
    # ->   0033 DIGIT THREE
    #    + 0032 DIGIT TWO
    "\u{325C}".freeze => '32'.freeze,

    # 325D CIRCLED NUMBER THIRTY THREE
    # ->   0033 DIGIT THREE
    #    + 0033 DIGIT THREE
    "\u{325D}".freeze => '33'.freeze,

    # 325E CIRCLED NUMBER THIRTY FOUR
    # ->   0033 DIGIT THREE
    #    + 0034 DIGIT FOUR
    "\u{325E}".freeze => '34'.freeze,

    # 325F CIRCLED NUMBER THIRTY FIVE
    # ->   0033 DIGIT THREE
    #    + 0035 DIGIT FIVE
    "\u{325F}".freeze => '35'.freeze,

    # 3260 CIRCLED HANGUL KIYEOK
    # ->   1100 HANGUL CHOSEONG KIYEOK
    "\u{3260}".freeze => "\u{1100}".freeze,

    # 3261 CIRCLED HANGUL NIEUN
    # ->   1102 HANGUL CHOSEONG NIEUN
    "\u{3261}".freeze => "\u{1102}".freeze,

    # 3262 CIRCLED HANGUL TIKEUT
    # ->   1103 HANGUL CHOSEONG TIKEUT
    "\u{3262}".freeze => "\u{1103}".freeze,

    # 3263 CIRCLED HANGUL RIEUL
    # ->   1105 HANGUL CHOSEONG RIEUL
    "\u{3263}".freeze => "\u{1105}".freeze,

    # 3264 CIRCLED HANGUL MIEUM
    # ->   1106 HANGUL CHOSEONG MIEUM
    "\u{3264}".freeze => "\u{1106}".freeze,

    # 3265 CIRCLED HANGUL PIEUP
    # ->   1107 HANGUL CHOSEONG PIEUP
    "\u{3265}".freeze => "\u{1107}".freeze,

    # 3266 CIRCLED HANGUL SIOS
    # ->   1109 HANGUL CHOSEONG SIOS
    "\u{3266}".freeze => "\u{1109}".freeze,

    # 3267 CIRCLED HANGUL IEUNG
    # ->   110B HANGUL CHOSEONG IEUNG
    "\u{3267}".freeze => "\u{110B}".freeze,

    # 3268 CIRCLED HANGUL CIEUC
    # ->   110C HANGUL CHOSEONG CIEUC
    "\u{3268}".freeze => "\u{110C}".freeze,

    # 3269 CIRCLED HANGUL CHIEUCH
    # ->   110E HANGUL CHOSEONG CHIEUCH
    "\u{3269}".freeze => "\u{110E}".freeze,

    # 326A CIRCLED HANGUL KHIEUKH
    # ->   110F HANGUL CHOSEONG KHIEUKH
    "\u{326A}".freeze => "\u{110F}".freeze,

    # 326B CIRCLED HANGUL THIEUTH
    # ->   1110 HANGUL CHOSEONG THIEUTH
    "\u{326B}".freeze => "\u{1110}".freeze,

    # 326C CIRCLED HANGUL PHIEUPH
    # ->   1111 HANGUL CHOSEONG PHIEUPH
    "\u{326C}".freeze => "\u{1111}".freeze,

    # 326D CIRCLED HANGUL HIEUH
    # ->   1112 HANGUL CHOSEONG HIEUH
    "\u{326D}".freeze => "\u{1112}".freeze,

    # 326E CIRCLED HANGUL KIYEOK A
    # ->   1100 HANGUL CHOSEONG KIYEOK
    #    + 1161 HANGUL JUNGSEONG A
    "\u{326E}".freeze => "\u{1100}\u{1161}".freeze,

    # 326F CIRCLED HANGUL NIEUN A
    # ->   1102 HANGUL CHOSEONG NIEUN
    #    + 1161 HANGUL JUNGSEONG A
    "\u{326F}".freeze => "\u{1102}\u{1161}".freeze,

    # 3270 CIRCLED HANGUL TIKEUT A
    # ->   1103 HANGUL CHOSEONG TIKEUT
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3270}".freeze => "\u{1103}\u{1161}".freeze,

    # 3271 CIRCLED HANGUL RIEUL A
    # ->   1105 HANGUL CHOSEONG RIEUL
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3271}".freeze => "\u{1105}\u{1161}".freeze,

    # 3272 CIRCLED HANGUL MIEUM A
    # ->   1106 HANGUL CHOSEONG MIEUM
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3272}".freeze => "\u{1106}\u{1161}".freeze,

    # 3273 CIRCLED HANGUL PIEUP A
    # ->   1107 HANGUL CHOSEONG PIEUP
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3273}".freeze => "\u{1107}\u{1161}".freeze,

    # 3274 CIRCLED HANGUL SIOS A
    # ->   1109 HANGUL CHOSEONG SIOS
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3274}".freeze => "\u{1109}\u{1161}".freeze,

    # 3275 CIRCLED HANGUL IEUNG A
    # ->   110B HANGUL CHOSEONG IEUNG
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3275}".freeze => "\u{110B}\u{1161}".freeze,

    # 3276 CIRCLED HANGUL CIEUC A
    # ->   110C HANGUL CHOSEONG CIEUC
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3276}".freeze => "\u{110C}\u{1161}".freeze,

    # 3277 CIRCLED HANGUL CHIEUCH A
    # ->   110E HANGUL CHOSEONG CHIEUCH
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3277}".freeze => "\u{110E}\u{1161}".freeze,

    # 3278 CIRCLED HANGUL KHIEUKH A
    # ->   110F HANGUL CHOSEONG KHIEUKH
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3278}".freeze => "\u{110F}\u{1161}".freeze,

    # 3279 CIRCLED HANGUL THIEUTH A
    # ->   1110 HANGUL CHOSEONG THIEUTH
    #    + 1161 HANGUL JUNGSEONG A
    "\u{3279}".freeze => "\u{1110}\u{1161}".freeze,

    # 327A CIRCLED HANGUL PHIEUPH A
    # ->   1111 HANGUL CHOSEONG PHIEUPH
    #    + 1161 HANGUL JUNGSEONG A
    "\u{327A}".freeze => "\u{1111}\u{1161}".freeze,

    # 327B CIRCLED HANGUL HIEUH A
    # ->   1112 HANGUL CHOSEONG HIEUH
    #    + 1161 HANGUL JUNGSEONG A
    "\u{327B}".freeze => "\u{1112}\u{1161}".freeze,

    # 327C CIRCLED KOREAN CHARACTER CHAMKO
    # ->   110E HANGUL CHOSEONG CHIEUCH
    #    + 1161 HANGUL JUNGSEONG A
    #    + 11B7 HANGUL JONGSEONG MIEUM
    #    + 1100 HANGUL CHOSEONG KIYEOK
    #    + 1169 HANGUL JUNGSEONG O
    "\u{327C}".freeze => "\u{110E}\u{1161}\u{11B7}\u{1100}\u{1169}".freeze,

    # 327D CIRCLED KOREAN CHARACTER JUEUI
    # ->   110C HANGUL CHOSEONG CIEUC
    #    + 116E HANGUL JUNGSEONG U
    #    + 110B HANGUL CHOSEONG IEUNG
    #    + 1174 HANGUL JUNGSEONG YI
    "\u{327D}".freeze => "\u{110C}\u{116E}\u{110B}\u{1174}".freeze,

    # 3280 CIRCLED IDEOGRAPH ONE
    # ->   4E00 CJK UNIFIED IDEOGRAPH 4E00
    "\u{3280}".freeze => "\u{4E00}".freeze,

    # 3281 CIRCLED IDEOGRAPH TWO
    # ->   4E8C CJK UNIFIED IDEOGRAPH 4E8C
    "\u{3281}".freeze => "\u{4E8C}".freeze,

    # 3282 CIRCLED IDEOGRAPH THREE
    # ->   4E09 CJK UNIFIED IDEOGRAPH 4E09
    "\u{3282}".freeze => "\u{4E09}".freeze,

    # 3283 CIRCLED IDEOGRAPH FOUR
    # ->   56DB CJK UNIFIED IDEOGRAPH 56DB
    "\u{3283}".freeze => "\u{56DB}".freeze,

    # 3284 CIRCLED IDEOGRAPH FIVE
    # ->   4E94 CJK UNIFIED IDEOGRAPH 4E94
    "\u{3284}".freeze => "\u{4E94}".freeze,

    # 3285 CIRCLED IDEOGRAPH SIX
    # ->   516D CJK UNIFIED IDEOGRAPH 516D
    "\u{3285}".freeze => "\u{516D}".freeze,

    # 3286 CIRCLED IDEOGRAPH SEVEN
    # ->   4E03 CJK UNIFIED IDEOGRAPH 4E03
    "\u{3286}".freeze => "\u{4E03}".freeze,

    # 3287 CIRCLED IDEOGRAPH EIGHT
    # ->   516B CJK UNIFIED IDEOGRAPH 516B
    "\u{3287}".freeze => "\u{516B}".freeze,

    # 3288 CIRCLED IDEOGRAPH NINE
    # ->   4E5D CJK UNIFIED IDEOGRAPH 4E5D
    "\u{3288}".freeze => "\u{4E5D}".freeze,

    # 3289 CIRCLED IDEOGRAPH TEN
    # ->   5341 CJK UNIFIED IDEOGRAPH 5341
    "\u{3289}".freeze => "\u{5341}".freeze,

    # 328A CIRCLED IDEOGRAPH MOON
    # ->   6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{328A}".freeze => "\u{6708}".freeze,

    # 328B CIRCLED IDEOGRAPH FIRE
    # ->   706B CJK UNIFIED IDEOGRAPH 706B
    "\u{328B}".freeze => "\u{706B}".freeze,

    # 328C CIRCLED IDEOGRAPH WATER
    # ->   6C34 CJK UNIFIED IDEOGRAPH 6C34
    "\u{328C}".freeze => "\u{6C34}".freeze,

    # 328D CIRCLED IDEOGRAPH WOOD
    # ->   6728 CJK UNIFIED IDEOGRAPH 6728
    "\u{328D}".freeze => "\u{6728}".freeze,

    # 328E CIRCLED IDEOGRAPH METAL
    # ->   91D1 CJK UNIFIED IDEOGRAPH 91D1
    "\u{328E}".freeze => "\u{91D1}".freeze,

    # 328F CIRCLED IDEOGRAPH EARTH
    # ->   571F CJK UNIFIED IDEOGRAPH 571F
    "\u{328F}".freeze => "\u{571F}".freeze,

    # 3290 CIRCLED IDEOGRAPH SUN
    # ->   65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{3290}".freeze => "\u{65E5}".freeze,

    # 3291 CIRCLED IDEOGRAPH STOCK
    # ->   682A CJK UNIFIED IDEOGRAPH 682A
    "\u{3291}".freeze => "\u{682A}".freeze,

    # 3292 CIRCLED IDEOGRAPH HAVE
    # ->   6709 CJK UNIFIED IDEOGRAPH 6709
    "\u{3292}".freeze => "\u{6709}".freeze,

    # 3293 CIRCLED IDEOGRAPH SOCIETY
    # ->   793E CJK UNIFIED IDEOGRAPH 793E
    "\u{3293}".freeze => "\u{793E}".freeze,

    # 3294 CIRCLED IDEOGRAPH NAME
    # ->   540D CJK UNIFIED IDEOGRAPH 540D
    "\u{3294}".freeze => "\u{540D}".freeze,

    # 3295 CIRCLED IDEOGRAPH SPECIAL
    # ->   7279 CJK UNIFIED IDEOGRAPH 7279
    "\u{3295}".freeze => "\u{7279}".freeze,

    # 3296 CIRCLED IDEOGRAPH FINANCIAL
    # ->   8CA1 CJK UNIFIED IDEOGRAPH 8CA1
    "\u{3296}".freeze => "\u{8CA1}".freeze,

    # 3297 CIRCLED IDEOGRAPH CONGRATULATION
    # ->   795D CJK UNIFIED IDEOGRAPH 795D
    "\u{3297}".freeze => "\u{795D}".freeze,

    # 3298 CIRCLED IDEOGRAPH LABOR
    # ->   52B4 CJK UNIFIED IDEOGRAPH 52B4
    "\u{3298}".freeze => "\u{52B4}".freeze,

    # 3299 CIRCLED IDEOGRAPH SECRET
    # ->   79D8 CJK UNIFIED IDEOGRAPH 79D8
    "\u{3299}".freeze => "\u{79D8}".freeze,

    # 329A CIRCLED IDEOGRAPH MALE
    # ->   7537 CJK UNIFIED IDEOGRAPH 7537
    "\u{329A}".freeze => "\u{7537}".freeze,

    # 329B CIRCLED IDEOGRAPH FEMALE
    # ->   5973 CJK UNIFIED IDEOGRAPH 5973
    "\u{329B}".freeze => "\u{5973}".freeze,

    # 329C CIRCLED IDEOGRAPH SUITABLE
    # ->   9069 CJK UNIFIED IDEOGRAPH 9069
    "\u{329C}".freeze => "\u{9069}".freeze,

    # 329D CIRCLED IDEOGRAPH EXCELLENT
    # ->   512A CJK UNIFIED IDEOGRAPH 512A
    "\u{329D}".freeze => "\u{512A}".freeze,

    # 329E CIRCLED IDEOGRAPH PRINT
    # ->   5370 CJK UNIFIED IDEOGRAPH 5370
    "\u{329E}".freeze => "\u{5370}".freeze,

    # 329F CIRCLED IDEOGRAPH ATTENTION
    # ->   6CE8 CJK UNIFIED IDEOGRAPH 6CE8
    "\u{329F}".freeze => "\u{6CE8}".freeze,

    # 32A0 CIRCLED IDEOGRAPH ITEM
    # ->   9805 CJK UNIFIED IDEOGRAPH 9805
    "\u{32A0}".freeze => "\u{9805}".freeze,

    # 32A1 CIRCLED IDEOGRAPH REST
    # ->   4F11 CJK UNIFIED IDEOGRAPH 4F11
    "\u{32A1}".freeze => "\u{4F11}".freeze,

    # 32A2 CIRCLED IDEOGRAPH COPY
    # ->   5199 CJK UNIFIED IDEOGRAPH 5199
    "\u{32A2}".freeze => "\u{5199}".freeze,

    # 32A3 CIRCLED IDEOGRAPH CORRECT
    # ->   6B63 CJK UNIFIED IDEOGRAPH 6B63
    "\u{32A3}".freeze => "\u{6B63}".freeze,

    # 32A4 CIRCLED IDEOGRAPH HIGH
    # ->   4E0A CJK UNIFIED IDEOGRAPH 4E0A
    "\u{32A4}".freeze => "\u{4E0A}".freeze,

    # 32A5 CIRCLED IDEOGRAPH CENTRE
    # ->   4E2D CJK UNIFIED IDEOGRAPH 4E2D
    "\u{32A5}".freeze => "\u{4E2D}".freeze,

    # 32A6 CIRCLED IDEOGRAPH LOW
    # ->   4E0B CJK UNIFIED IDEOGRAPH 4E0B
    "\u{32A6}".freeze => "\u{4E0B}".freeze,

    # 32A7 CIRCLED IDEOGRAPH LEFT
    # ->   5DE6 CJK UNIFIED IDEOGRAPH 5DE6
    "\u{32A7}".freeze => "\u{5DE6}".freeze,

    # 32A8 CIRCLED IDEOGRAPH RIGHT
    # ->   53F3 CJK UNIFIED IDEOGRAPH 53F3
    "\u{32A8}".freeze => "\u{53F3}".freeze,

    # 32A9 CIRCLED IDEOGRAPH MEDICINE
    # ->   533B CJK UNIFIED IDEOGRAPH 533B
    "\u{32A9}".freeze => "\u{533B}".freeze,

    # 32AA CIRCLED IDEOGRAPH RELIGION
    # ->   5B97 CJK UNIFIED IDEOGRAPH 5B97
    "\u{32AA}".freeze => "\u{5B97}".freeze,

    # 32AB CIRCLED IDEOGRAPH STUDY
    # ->   5B66 CJK UNIFIED IDEOGRAPH 5B66
    "\u{32AB}".freeze => "\u{5B66}".freeze,

    # 32AC CIRCLED IDEOGRAPH SUPERVISE
    # ->   76E3 CJK UNIFIED IDEOGRAPH 76E3
    "\u{32AC}".freeze => "\u{76E3}".freeze,

    # 32AD CIRCLED IDEOGRAPH ENTERPRISE
    # ->   4F01 CJK UNIFIED IDEOGRAPH 4F01
    "\u{32AD}".freeze => "\u{4F01}".freeze,

    # 32AE CIRCLED IDEOGRAPH RESOURCE
    # ->   8CC7 CJK UNIFIED IDEOGRAPH 8CC7
    "\u{32AE}".freeze => "\u{8CC7}".freeze,

    # 32AF CIRCLED IDEOGRAPH ALLIANCE
    # ->   5354 CJK UNIFIED IDEOGRAPH 5354
    "\u{32AF}".freeze => "\u{5354}".freeze,

    # 32B0 CIRCLED IDEOGRAPH NIGHT
    # ->   591C CJK UNIFIED IDEOGRAPH 591C
    "\u{32B0}".freeze => "\u{591C}".freeze,

    # 32B1 CIRCLED NUMBER THIRTY SIX
    # ->   0033 DIGIT THREE
    #    + 0036 DIGIT SIX
    "\u{32B1}".freeze => '36'.freeze,

    # 32B2 CIRCLED NUMBER THIRTY SEVEN
    # ->   0033 DIGIT THREE
    #    + 0037 DIGIT SEVEN
    "\u{32B2}".freeze => '37'.freeze,

    # 32B3 CIRCLED NUMBER THIRTY EIGHT
    # ->   0033 DIGIT THREE
    #    + 0038 DIGIT EIGHT
    "\u{32B3}".freeze => '38'.freeze,

    # 32B4 CIRCLED NUMBER THIRTY NINE
    # ->   0033 DIGIT THREE
    #    + 0039 DIGIT NINE
    "\u{32B4}".freeze => '39'.freeze,

    # 32B5 CIRCLED NUMBER FORTY
    # ->   0034 DIGIT FOUR
    #    + 0030 DIGIT ZERO
    "\u{32B5}".freeze => '40'.freeze,

    # 32B6 CIRCLED NUMBER FORTY ONE
    # ->   0034 DIGIT FOUR
    #    + 0031 DIGIT ONE
    "\u{32B6}".freeze => '41'.freeze,

    # 32B7 CIRCLED NUMBER FORTY TWO
    # ->   0034 DIGIT FOUR
    #    + 0032 DIGIT TWO
    "\u{32B7}".freeze => '42'.freeze,

    # 32B8 CIRCLED NUMBER FORTY THREE
    # ->   0034 DIGIT FOUR
    #    + 0033 DIGIT THREE
    "\u{32B8}".freeze => '43'.freeze,

    # 32B9 CIRCLED NUMBER FORTY FOUR
    # ->   0034 DIGIT FOUR
    #    + 0034 DIGIT FOUR
    "\u{32B9}".freeze => '44'.freeze,

    # 32BA CIRCLED NUMBER FORTY FIVE
    # ->   0034 DIGIT FOUR
    #    + 0035 DIGIT FIVE
    "\u{32BA}".freeze => '45'.freeze,

    # 32BB CIRCLED NUMBER FORTY SIX
    # ->   0034 DIGIT FOUR
    #    + 0036 DIGIT SIX
    "\u{32BB}".freeze => '46'.freeze,

    # 32BC CIRCLED NUMBER FORTY SEVEN
    # ->   0034 DIGIT FOUR
    #    + 0037 DIGIT SEVEN
    "\u{32BC}".freeze => '47'.freeze,

    # 32BD CIRCLED NUMBER FORTY EIGHT
    # ->   0034 DIGIT FOUR
    #    + 0038 DIGIT EIGHT
    "\u{32BD}".freeze => '48'.freeze,

    # 32BE CIRCLED NUMBER FORTY NINE
    # ->   0034 DIGIT FOUR
    #    + 0039 DIGIT NINE
    "\u{32BE}".freeze => '49'.freeze,

    # 32BF CIRCLED NUMBER FIFTY
    # ->   0035 DIGIT FIVE
    #    + 0030 DIGIT ZERO
    "\u{32BF}".freeze => '50'.freeze,

    # 32C0 IDEOGRAPHIC TELEGRAPH SYMBOL FOR JANUARY
    # ->   0031 DIGIT ONE
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C0}".freeze => "1\u{6708}".freeze,

    # 32C1 IDEOGRAPHIC TELEGRAPH SYMBOL FOR FEBRUARY
    # ->   0032 DIGIT TWO
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C1}".freeze => "2\u{6708}".freeze,

    # 32C2 IDEOGRAPHIC TELEGRAPH SYMBOL FOR MARCH
    # ->   0033 DIGIT THREE
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C2}".freeze => "3\u{6708}".freeze,

    # 32C3 IDEOGRAPHIC TELEGRAPH SYMBOL FOR APRIL
    # ->   0034 DIGIT FOUR
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C3}".freeze => "4\u{6708}".freeze,

    # 32C4 IDEOGRAPHIC TELEGRAPH SYMBOL FOR MAY
    # ->   0035 DIGIT FIVE
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C4}".freeze => "5\u{6708}".freeze,

    # 32C5 IDEOGRAPHIC TELEGRAPH SYMBOL FOR JUNE
    # ->   0036 DIGIT SIX
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C5}".freeze => "6\u{6708}".freeze,

    # 32C6 IDEOGRAPHIC TELEGRAPH SYMBOL FOR JULY
    # ->   0037 DIGIT SEVEN
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C6}".freeze => "7\u{6708}".freeze,

    # 32C7 IDEOGRAPHIC TELEGRAPH SYMBOL FOR AUGUST
    # ->   0038 DIGIT EIGHT
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C7}".freeze => "8\u{6708}".freeze,

    # 32C8 IDEOGRAPHIC TELEGRAPH SYMBOL FOR SEPTEMBER
    # ->   0039 DIGIT NINE
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C8}".freeze => "9\u{6708}".freeze,

    # 32C9 IDEOGRAPHIC TELEGRAPH SYMBOL FOR OCTOBER
    # ->   0031 DIGIT ONE
    #    + 0030 DIGIT ZERO
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32C9}".freeze => "10\u{6708}".freeze,

    # 32CA IDEOGRAPHIC TELEGRAPH SYMBOL FOR NOVEMBER
    # ->   0031 DIGIT ONE
    #    + 0031 DIGIT ONE
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32CA}".freeze => "11\u{6708}".freeze,

    # 32CB IDEOGRAPHIC TELEGRAPH SYMBOL FOR DECEMBER
    # ->   0031 DIGIT ONE
    #    + 0032 DIGIT TWO
    #    + 6708 CJK UNIFIED IDEOGRAPH 6708
    "\u{32CB}".freeze => "12\u{6708}".freeze,

    # 32CC SQUARE HG
    # ->   0048 LATIN CAPITAL LETTER H
    #    + 0067 LATIN SMALL LETTER G
    "\u{32CC}".freeze => 'Hg'.freeze,

    # 32CD SQUARE ERG
    # ->   0065 LATIN SMALL LETTER E
    #    + 0072 LATIN SMALL LETTER R
    #    + 0067 LATIN SMALL LETTER G
    "\u{32CD}".freeze => 'erg'.freeze,

    # 32CE SQUARE EV
    # ->   0065 LATIN SMALL LETTER E
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{32CE}".freeze => 'eV'.freeze,

    # 32CF LIMITED LIABILITY SIGN
    # ->   004C LATIN CAPITAL LETTER L
    #    + 0054 LATIN CAPITAL LETTER T
    #    + 0044 LATIN CAPITAL LETTER D
    "\u{32CF}".freeze => 'LTD'.freeze,

    # 32D0 CIRCLED KATAKANA A
    # ->   30A2 KATAKANA LETTER A
    "\u{32D0}".freeze => "\u{30A2}".freeze,

    # 32D1 CIRCLED KATAKANA I
    # ->   30A4 KATAKANA LETTER I
    "\u{32D1}".freeze => "\u{30A4}".freeze,

    # 32D2 CIRCLED KATAKANA U
    # ->   30A6 KATAKANA LETTER U
    "\u{32D2}".freeze => "\u{30A6}".freeze,

    # 32D3 CIRCLED KATAKANA E
    # ->   30A8 KATAKANA LETTER E
    "\u{32D3}".freeze => "\u{30A8}".freeze,

    # 32D4 CIRCLED KATAKANA O
    # ->   30AA KATAKANA LETTER O
    "\u{32D4}".freeze => "\u{30AA}".freeze,

    # 32D5 CIRCLED KATAKANA KA
    # ->   30AB KATAKANA LETTER KA
    "\u{32D5}".freeze => "\u{30AB}".freeze,

    # 32D6 CIRCLED KATAKANA KI
    # ->   30AD KATAKANA LETTER KI
    "\u{32D6}".freeze => "\u{30AD}".freeze,

    # 32D7 CIRCLED KATAKANA KU
    # ->   30AF KATAKANA LETTER KU
    "\u{32D7}".freeze => "\u{30AF}".freeze,

    # 32D8 CIRCLED KATAKANA KE
    # ->   30B1 KATAKANA LETTER KE
    "\u{32D8}".freeze => "\u{30B1}".freeze,

    # 32D9 CIRCLED KATAKANA KO
    # ->   30B3 KATAKANA LETTER KO
    "\u{32D9}".freeze => "\u{30B3}".freeze,

    # 32DA CIRCLED KATAKANA SA
    # ->   30B5 KATAKANA LETTER SA
    "\u{32DA}".freeze => "\u{30B5}".freeze,

    # 32DB CIRCLED KATAKANA SI
    # ->   30B7 KATAKANA LETTER SI
    "\u{32DB}".freeze => "\u{30B7}".freeze,

    # 32DC CIRCLED KATAKANA SU
    # ->   30B9 KATAKANA LETTER SU
    "\u{32DC}".freeze => "\u{30B9}".freeze,

    # 32DD CIRCLED KATAKANA SE
    # ->   30BB KATAKANA LETTER SE
    "\u{32DD}".freeze => "\u{30BB}".freeze,

    # 32DE CIRCLED KATAKANA SO
    # ->   30BD KATAKANA LETTER SO
    "\u{32DE}".freeze => "\u{30BD}".freeze,

    # 32DF CIRCLED KATAKANA TA
    # ->   30BF KATAKANA LETTER TA
    "\u{32DF}".freeze => "\u{30BF}".freeze,

    # 32E0 CIRCLED KATAKANA TI
    # ->   30C1 KATAKANA LETTER TI
    "\u{32E0}".freeze => "\u{30C1}".freeze,

    # 32E1 CIRCLED KATAKANA TU
    # ->   30C4 KATAKANA LETTER TU
    "\u{32E1}".freeze => "\u{30C4}".freeze,

    # 32E2 CIRCLED KATAKANA TE
    # ->   30C6 KATAKANA LETTER TE
    "\u{32E2}".freeze => "\u{30C6}".freeze,

    # 32E3 CIRCLED KATAKANA TO
    # ->   30C8 KATAKANA LETTER TO
    "\u{32E3}".freeze => "\u{30C8}".freeze,

    # 32E4 CIRCLED KATAKANA NA
    # ->   30CA KATAKANA LETTER NA
    "\u{32E4}".freeze => "\u{30CA}".freeze,

    # 32E5 CIRCLED KATAKANA NI
    # ->   30CB KATAKANA LETTER NI
    "\u{32E5}".freeze => "\u{30CB}".freeze,

    # 32E6 CIRCLED KATAKANA NU
    # ->   30CC KATAKANA LETTER NU
    "\u{32E6}".freeze => "\u{30CC}".freeze,

    # 32E7 CIRCLED KATAKANA NE
    # ->   30CD KATAKANA LETTER NE
    "\u{32E7}".freeze => "\u{30CD}".freeze,

    # 32E8 CIRCLED KATAKANA NO
    # ->   30CE KATAKANA LETTER NO
    "\u{32E8}".freeze => "\u{30CE}".freeze,

    # 32E9 CIRCLED KATAKANA HA
    # ->   30CF KATAKANA LETTER HA
    "\u{32E9}".freeze => "\u{30CF}".freeze,

    # 32EA CIRCLED KATAKANA HI
    # ->   30D2 KATAKANA LETTER HI
    "\u{32EA}".freeze => "\u{30D2}".freeze,

    # 32EB CIRCLED KATAKANA HU
    # ->   30D5 KATAKANA LETTER HU
    "\u{32EB}".freeze => "\u{30D5}".freeze,

    # 32EC CIRCLED KATAKANA HE
    # ->   30D8 KATAKANA LETTER HE
    "\u{32EC}".freeze => "\u{30D8}".freeze,

    # 32ED CIRCLED KATAKANA HO
    # ->   30DB KATAKANA LETTER HO
    "\u{32ED}".freeze => "\u{30DB}".freeze,

    # 32EE CIRCLED KATAKANA MA
    # ->   30DE KATAKANA LETTER MA
    "\u{32EE}".freeze => "\u{30DE}".freeze,

    # 32EF CIRCLED KATAKANA MI
    # ->   30DF KATAKANA LETTER MI
    "\u{32EF}".freeze => "\u{30DF}".freeze,

    # 32F0 CIRCLED KATAKANA MU
    # ->   30E0 KATAKANA LETTER MU
    "\u{32F0}".freeze => "\u{30E0}".freeze,

    # 32F1 CIRCLED KATAKANA ME
    # ->   30E1 KATAKANA LETTER ME
    "\u{32F1}".freeze => "\u{30E1}".freeze,

    # 32F2 CIRCLED KATAKANA MO
    # ->   30E2 KATAKANA LETTER MO
    "\u{32F2}".freeze => "\u{30E2}".freeze,

    # 32F3 CIRCLED KATAKANA YA
    # ->   30E4 KATAKANA LETTER YA
    "\u{32F3}".freeze => "\u{30E4}".freeze,

    # 32F4 CIRCLED KATAKANA YU
    # ->   30E6 KATAKANA LETTER YU
    "\u{32F4}".freeze => "\u{30E6}".freeze,

    # 32F5 CIRCLED KATAKANA YO
    # ->   30E8 KATAKANA LETTER YO
    "\u{32F5}".freeze => "\u{30E8}".freeze,

    # 32F6 CIRCLED KATAKANA RA
    # ->   30E9 KATAKANA LETTER RA
    "\u{32F6}".freeze => "\u{30E9}".freeze,

    # 32F7 CIRCLED KATAKANA RI
    # ->   30EA KATAKANA LETTER RI
    "\u{32F7}".freeze => "\u{30EA}".freeze,

    # 32F8 CIRCLED KATAKANA RU
    # ->   30EB KATAKANA LETTER RU
    "\u{32F8}".freeze => "\u{30EB}".freeze,

    # 32F9 CIRCLED KATAKANA RE
    # ->   30EC KATAKANA LETTER RE
    "\u{32F9}".freeze => "\u{30EC}".freeze,

    # 32FA CIRCLED KATAKANA RO
    # ->   30ED KATAKANA LETTER RO
    "\u{32FA}".freeze => "\u{30ED}".freeze,

    # 32FB CIRCLED KATAKANA WA
    # ->   30EF KATAKANA LETTER WA
    "\u{32FB}".freeze => "\u{30EF}".freeze,

    # 32FC CIRCLED KATAKANA WI
    # ->   30F0 KATAKANA LETTER WI
    "\u{32FC}".freeze => "\u{30F0}".freeze,

    # 32FD CIRCLED KATAKANA WE
    # ->   30F1 KATAKANA LETTER WE
    "\u{32FD}".freeze => "\u{30F1}".freeze,

    # 32FE CIRCLED KATAKANA WO
    # ->   30F2 KATAKANA LETTER WO
    "\u{32FE}".freeze => "\u{30F2}".freeze,

    # 3300 SQUARE APAATO
    # ->   30A2 KATAKANA LETTER A
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30C8 KATAKANA LETTER TO
    #    + 30CF KATAKANA LETTER HA
    "\u{3300}".freeze => "\u{30A2}\u{30FC}\u{30C8}\u{30CF}".freeze,

    # 3301 SQUARE ARUHUA
    # ->   30A2 KATAKANA LETTER A
    #    + 30EB KATAKANA LETTER RU
    #    + 30D5 KATAKANA LETTER HU
    #    + 30A1 KATAKANA LETTER SMALL A
    "\u{3301}".freeze => "\u{30A2}\u{30EB}\u{30D5}\u{30A1}".freeze,

    # 3302 SQUARE ANPEA
    # ->   30A2 KATAKANA LETTER A
    #    + 30F3 KATAKANA LETTER N
    #    + 30A2 KATAKANA LETTER A
    #    + 30D8 KATAKANA LETTER HE
    "\u{3302}".freeze => "\u{30A2}\u{30F3}\u{30A2}\u{30D8}".freeze,

    # 3303 SQUARE AARU
    # ->   30A2 KATAKANA LETTER A
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30EB KATAKANA LETTER RU
    "\u{3303}".freeze => "\u{30A2}\u{30FC}\u{30EB}".freeze,

    # 3304 SQUARE ININGU
    # ->   30A4 KATAKANA LETTER I
    #    + 30CB KATAKANA LETTER NI
    #    + 30F3 KATAKANA LETTER N
    #    + 30AF KATAKANA LETTER KU
    "\u{3304}".freeze => "\u{30A4}\u{30CB}\u{30F3}\u{30AF}".freeze,

    # 3305 SQUARE INTI
    # ->   30A4 KATAKANA LETTER I
    #    + 30F3 KATAKANA LETTER N
    #    + 30C1 KATAKANA LETTER TI
    "\u{3305}".freeze => "\u{30A4}\u{30F3}\u{30C1}".freeze,

    # 3306 SQUARE UON
    # ->   30A6 KATAKANA LETTER U
    #    + 30A9 KATAKANA LETTER SMALL O
    #    + 30F3 KATAKANA LETTER N
    "\u{3306}".freeze => "\u{30A6}\u{30A9}\u{30F3}".freeze,

    # 3307 SQUARE ESUKUUDO
    # ->   30A8 KATAKANA LETTER E
    #    + 30B9 KATAKANA LETTER SU
    #    + 30AF KATAKANA LETTER KU
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30C8 KATAKANA LETTER TO
    "\u{3307}".freeze => "\u{30A8}\u{30B9}\u{30AF}\u{30FC}\u{30C8}".freeze,

    # 3308 SQUARE EEKAA
    # ->   30A8 KATAKANA LETTER E
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30AB KATAKANA LETTER KA
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    "\u{3308}".freeze => "\u{30A8}\u{30FC}\u{30AB}\u{30FC}".freeze,

    # 3309 SQUARE ONSU
    # ->   30AA KATAKANA LETTER O
    #    + 30F3 KATAKANA LETTER N
    #    + 30B9 KATAKANA LETTER SU
    "\u{3309}".freeze => "\u{30AA}\u{30F3}\u{30B9}".freeze,

    # 330A SQUARE OOMU
    # ->   30AA KATAKANA LETTER O
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30E0 KATAKANA LETTER MU
    "\u{330A}".freeze => "\u{30AA}\u{30FC}\u{30E0}".freeze,

    # 330B SQUARE KAIRI
    # ->   30AB KATAKANA LETTER KA
    #    + 30A4 KATAKANA LETTER I
    #    + 30EA KATAKANA LETTER RI
    "\u{330B}".freeze => "\u{30AB}\u{30A4}\u{30EA}".freeze,

    # 330C SQUARE KARATTO
    # ->   30AB KATAKANA LETTER KA
    #    + 30E9 KATAKANA LETTER RA
    #    + 30C3 KATAKANA LETTER SMALL TU
    #    + 30C8 KATAKANA LETTER TO
    "\u{330C}".freeze => "\u{30AB}\u{30E9}\u{30C3}\u{30C8}".freeze,

    # 330D SQUARE KARORII
    # ->   30AB KATAKANA LETTER KA
    #    + 30ED KATAKANA LETTER RO
    #    + 30EA KATAKANA LETTER RI
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    "\u{330D}".freeze => "\u{30AB}\u{30ED}\u{30EA}\u{30FC}".freeze,

    # 330E SQUARE GARON
    # ->   30ED KATAKANA LETTER RO
    #    + 30F3 KATAKANA LETTER N
    #    + 30AB KATAKANA LETTER KA
    "\u{330E}".freeze => "\u{30ED}\u{30F3}\u{30AB}".freeze,

    # 330F SQUARE GANMA
    # ->   30F3 KATAKANA LETTER N
    #    + 30DE KATAKANA LETTER MA
    #    + 30AB KATAKANA LETTER KA
    "\u{330F}".freeze => "\u{30F3}\u{30DE}\u{30AB}".freeze,

    # 3310 SQUARE GIGA
    # ->   30AD KATAKANA LETTER KI
    #    + 30AB KATAKANA LETTER KA
    "\u{3310}".freeze => "\u{30AD}\u{30AB}".freeze,

    # 3311 SQUARE GINII
    # ->   30CB KATAKANA LETTER NI
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30AD KATAKANA LETTER KI
    "\u{3311}".freeze => "\u{30CB}\u{30FC}\u{30AD}".freeze,

    # 3312 SQUARE KYURII
    # ->   30AD KATAKANA LETTER KI
    #    + 30E5 KATAKANA LETTER SMALL YU
    #    + 30EA KATAKANA LETTER RI
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    "\u{3312}".freeze => "\u{30AD}\u{30E5}\u{30EA}\u{30FC}".freeze,

    # 3313 SQUARE GIRUDAA
    # ->   30EB KATAKANA LETTER RU
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30AD KATAKANA LETTER KI
    #    + 30BF KATAKANA LETTER TA
    "\u{3313}".freeze => "\u{30EB}\u{30FC}\u{30AD}\u{30BF}".freeze,

    # 3314 SQUARE KIRO
    # ->   30AD KATAKANA LETTER KI
    #    + 30ED KATAKANA LETTER RO
    "\u{3314}".freeze => "\u{30AD}\u{30ED}".freeze,

    # 3315 SQUARE KIROGURAMU
    # ->   30AD KATAKANA LETTER KI
    #    + 30ED KATAKANA LETTER RO
    #    + 30E9 KATAKANA LETTER RA
    #    + 30E0 KATAKANA LETTER MU
    #    + 30AF KATAKANA LETTER KU
    "\u{3315}".freeze => "\u{30AD}\u{30ED}\u{30E9}\u{30E0}\u{30AF}".freeze,

    # 3316 SQUARE KIROMEETORU
    # ->   30AD KATAKANA LETTER KI
    #    + 30ED KATAKANA LETTER RO
    #    + 30E1 KATAKANA LETTER ME
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30C8 KATAKANA LETTER TO
    #    + 30EB KATAKANA LETTER RU
    "\u{3316}".freeze => "\u{30AD}\u{30ED}\u{30E1}\u{30FC}\u{30C8}\u{30EB}".freeze,

    # 3317 SQUARE KIROWATTO
    # ->   30AD KATAKANA LETTER KI
    #    + 30ED KATAKANA LETTER RO
    #    + 30EF KATAKANA LETTER WA
    #    + 30C3 KATAKANA LETTER SMALL TU
    #    + 30C8 KATAKANA LETTER TO
    "\u{3317}".freeze => "\u{30AD}\u{30ED}\u{30EF}\u{30C3}\u{30C8}".freeze,

    # 3318 SQUARE GURAMU
    # ->   30E9 KATAKANA LETTER RA
    #    + 30E0 KATAKANA LETTER MU
    #    + 30AF KATAKANA LETTER KU
    "\u{3318}".freeze => "\u{30E9}\u{30E0}\u{30AF}".freeze,

    # 3319 SQUARE GURAMUTON
    # ->   30E9 KATAKANA LETTER RA
    #    + 30E0 KATAKANA LETTER MU
    #    + 30C8 KATAKANA LETTER TO
    #    + 30F3 KATAKANA LETTER N
    #    + 30AF KATAKANA LETTER KU
    "\u{3319}".freeze => "\u{30E9}\u{30E0}\u{30C8}\u{30F3}\u{30AF}".freeze,

    # 331A SQUARE KURUZEIRO
    # ->   30AF KATAKANA LETTER KU
    #    + 30EB KATAKANA LETTER RU
    #    + 30A4 KATAKANA LETTER I
    #    + 30ED KATAKANA LETTER RO
    #    + 30BB KATAKANA LETTER SE
    "\u{331A}".freeze => "\u{30AF}\u{30EB}\u{30A4}\u{30ED}\u{30BB}".freeze,

    # 331B SQUARE KUROONE
    # ->   30AF KATAKANA LETTER KU
    #    + 30ED KATAKANA LETTER RO
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30CD KATAKANA LETTER NE
    "\u{331B}".freeze => "\u{30AF}\u{30ED}\u{30FC}\u{30CD}".freeze,

    # 331C SQUARE KEESU
    # ->   30B1 KATAKANA LETTER KE
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30B9 KATAKANA LETTER SU
    "\u{331C}".freeze => "\u{30B1}\u{30FC}\u{30B9}".freeze,

    # 331D SQUARE KORUNA
    # ->   30B3 KATAKANA LETTER KO
    #    + 30EB KATAKANA LETTER RU
    #    + 30CA KATAKANA LETTER NA
    "\u{331D}".freeze => "\u{30B3}\u{30EB}\u{30CA}".freeze,

    # 331E SQUARE KOOPO
    # ->   30B3 KATAKANA LETTER KO
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30DB KATAKANA LETTER HO
    "\u{331E}".freeze => "\u{30B3}\u{30FC}\u{30DB}".freeze,

    # 331F SQUARE SAIKURU
    # ->   30B5 KATAKANA LETTER SA
    #    + 30A4 KATAKANA LETTER I
    #    + 30AF KATAKANA LETTER KU
    #    + 30EB KATAKANA LETTER RU
    "\u{331F}".freeze => "\u{30B5}\u{30A4}\u{30AF}\u{30EB}".freeze,

    # 3320 SQUARE SANTIIMU
    # ->   30B5 KATAKANA LETTER SA
    #    + 30F3 KATAKANA LETTER N
    #    + 30C1 KATAKANA LETTER TI
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30E0 KATAKANA LETTER MU
    "\u{3320}".freeze => "\u{30B5}\u{30F3}\u{30C1}\u{30FC}\u{30E0}".freeze,

    # 3321 SQUARE SIRINGU
    # ->   30B7 KATAKANA LETTER SI
    #    + 30EA KATAKANA LETTER RI
    #    + 30F3 KATAKANA LETTER N
    #    + 30AF KATAKANA LETTER KU
    "\u{3321}".freeze => "\u{30B7}\u{30EA}\u{30F3}\u{30AF}".freeze,

    # 3322 SQUARE SENTI
    # ->   30BB KATAKANA LETTER SE
    #    + 30F3 KATAKANA LETTER N
    #    + 30C1 KATAKANA LETTER TI
    "\u{3322}".freeze => "\u{30BB}\u{30F3}\u{30C1}".freeze,

    # 3323 SQUARE SENTO
    # ->   30BB KATAKANA LETTER SE
    #    + 30F3 KATAKANA LETTER N
    #    + 30C8 KATAKANA LETTER TO
    "\u{3323}".freeze => "\u{30BB}\u{30F3}\u{30C8}".freeze,

    # 3324 SQUARE DAASU
    # ->   30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30B9 KATAKANA LETTER SU
    #    + 30BF KATAKANA LETTER TA
    "\u{3324}".freeze => "\u{30FC}\u{30B9}\u{30BF}".freeze,

    # 3325 SQUARE DESI
    # ->   30B7 KATAKANA LETTER SI
    #    + 30C6 KATAKANA LETTER TE
    "\u{3325}".freeze => "\u{30B7}\u{30C6}".freeze,

    # 3326 SQUARE DORU
    # ->   30EB KATAKANA LETTER RU
    #    + 30C8 KATAKANA LETTER TO
    "\u{3326}".freeze => "\u{30EB}\u{30C8}".freeze,

    # 3327 SQUARE TON
    # ->   30C8 KATAKANA LETTER TO
    #    + 30F3 KATAKANA LETTER N
    "\u{3327}".freeze => "\u{30C8}\u{30F3}".freeze,

    # 3328 SQUARE NANO
    # ->   30CA KATAKANA LETTER NA
    #    + 30CE KATAKANA LETTER NO
    "\u{3328}".freeze => "\u{30CA}\u{30CE}".freeze,

    # 3329 SQUARE NOTTO
    # ->   30CE KATAKANA LETTER NO
    #    + 30C3 KATAKANA LETTER SMALL TU
    #    + 30C8 KATAKANA LETTER TO
    "\u{3329}".freeze => "\u{30CE}\u{30C3}\u{30C8}".freeze,

    # 332A SQUARE HAITU
    # ->   30CF KATAKANA LETTER HA
    #    + 30A4 KATAKANA LETTER I
    #    + 30C4 KATAKANA LETTER TU
    "\u{332A}".freeze => "\u{30CF}\u{30A4}\u{30C4}".freeze,

    # 332B SQUARE PAASENTO
    # ->   30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30BB KATAKANA LETTER SE
    #    + 30F3 KATAKANA LETTER N
    #    + 30C8 KATAKANA LETTER TO
    #    + 30CF KATAKANA LETTER HA
    "\u{332B}".freeze => "\u{30FC}\u{30BB}\u{30F3}\u{30C8}\u{30CF}".freeze,

    # 332C SQUARE PAATU
    # ->   30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30C4 KATAKANA LETTER TU
    #    + 30CF KATAKANA LETTER HA
    "\u{332C}".freeze => "\u{30FC}\u{30C4}\u{30CF}".freeze,

    # 332D SQUARE BAARERU
    # ->   30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30EC KATAKANA LETTER RE
    #    + 30EB KATAKANA LETTER RU
    #    + 30CF KATAKANA LETTER HA
    "\u{332D}".freeze => "\u{30FC}\u{30EC}\u{30EB}\u{30CF}".freeze,

    # 332E SQUARE PIASUTORU
    # ->   30A2 KATAKANA LETTER A
    #    + 30B9 KATAKANA LETTER SU
    #    + 30C8 KATAKANA LETTER TO
    #    + 30EB KATAKANA LETTER RU
    #    + 30D2 KATAKANA LETTER HI
    "\u{332E}".freeze => "\u{30A2}\u{30B9}\u{30C8}\u{30EB}\u{30D2}".freeze,

    # 332F SQUARE PIKURU
    # ->   30AF KATAKANA LETTER KU
    #    + 30EB KATAKANA LETTER RU
    #    + 30D2 KATAKANA LETTER HI
    "\u{332F}".freeze => "\u{30AF}\u{30EB}\u{30D2}".freeze,

    # 3330 SQUARE PIKO
    # ->   30B3 KATAKANA LETTER KO
    #    + 30D2 KATAKANA LETTER HI
    "\u{3330}".freeze => "\u{30B3}\u{30D2}".freeze,

    # 3331 SQUARE BIRU
    # ->   30EB KATAKANA LETTER RU
    #    + 30D2 KATAKANA LETTER HI
    "\u{3331}".freeze => "\u{30EB}\u{30D2}".freeze,

    # 3332 SQUARE HUARADDO
    # ->   30D5 KATAKANA LETTER HU
    #    + 30A1 KATAKANA LETTER SMALL A
    #    + 30E9 KATAKANA LETTER RA
    #    + 30C3 KATAKANA LETTER SMALL TU
    #    + 30C8 KATAKANA LETTER TO
    "\u{3332}".freeze => "\u{30D5}\u{30A1}\u{30E9}\u{30C3}\u{30C8}".freeze,

    # 3333 SQUARE HUIITO
    # ->   30D5 KATAKANA LETTER HU
    #    + 30A3 KATAKANA LETTER SMALL I
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30C8 KATAKANA LETTER TO
    "\u{3333}".freeze => "\u{30D5}\u{30A3}\u{30FC}\u{30C8}".freeze,

    # 3334 SQUARE BUSSYERU
    # ->   30C3 KATAKANA LETTER SMALL TU
    #    + 30B7 KATAKANA LETTER SI
    #    + 30A7 KATAKANA LETTER SMALL E
    #    + 30EB KATAKANA LETTER RU
    #    + 30D5 KATAKANA LETTER HU
    "\u{3334}".freeze => "\u{30C3}\u{30B7}\u{30A7}\u{30EB}\u{30D5}".freeze,

    # 3335 SQUARE HURAN
    # ->   30D5 KATAKANA LETTER HU
    #    + 30E9 KATAKANA LETTER RA
    #    + 30F3 KATAKANA LETTER N
    "\u{3335}".freeze => "\u{30D5}\u{30E9}\u{30F3}".freeze,

    # 3336 SQUARE HEKUTAARU
    # ->   30D8 KATAKANA LETTER HE
    #    + 30AF KATAKANA LETTER KU
    #    + 30BF KATAKANA LETTER TA
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30EB KATAKANA LETTER RU
    "\u{3336}".freeze => "\u{30D8}\u{30AF}\u{30BF}\u{30FC}\u{30EB}".freeze,

    # 3337 SQUARE PESO
    # ->   30BD KATAKANA LETTER SO
    #    + 30D8 KATAKANA LETTER HE
    "\u{3337}".freeze => "\u{30BD}\u{30D8}".freeze,

    # 3338 SQUARE PENIHI
    # ->   30CB KATAKANA LETTER NI
    #    + 30D2 KATAKANA LETTER HI
    #    + 30D8 KATAKANA LETTER HE
    "\u{3338}".freeze => "\u{30CB}\u{30D2}\u{30D8}".freeze,

    # 3339 SQUARE HERUTU
    # ->   30D8 KATAKANA LETTER HE
    #    + 30EB KATAKANA LETTER RU
    #    + 30C4 KATAKANA LETTER TU
    "\u{3339}".freeze => "\u{30D8}\u{30EB}\u{30C4}".freeze,

    # 333A SQUARE PENSU
    # ->   30F3 KATAKANA LETTER N
    #    + 30B9 KATAKANA LETTER SU
    #    + 30D8 KATAKANA LETTER HE
    "\u{333A}".freeze => "\u{30F3}\u{30B9}\u{30D8}".freeze,

    # 333B SQUARE PEEZI
    # ->   30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30D8 KATAKANA LETTER HE
    #    + 30B7 KATAKANA LETTER SI
    "\u{333B}".freeze => "\u{30FC}\u{30D8}\u{30B7}".freeze,

    # 333C SQUARE BEETA
    # ->   30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30BF KATAKANA LETTER TA
    #    + 30D8 KATAKANA LETTER HE
    "\u{333C}".freeze => "\u{30FC}\u{30BF}\u{30D8}".freeze,

    # 333D SQUARE POINTO
    # ->   30A4 KATAKANA LETTER I
    #    + 30F3 KATAKANA LETTER N
    #    + 30C8 KATAKANA LETTER TO
    #    + 30DB KATAKANA LETTER HO
    "\u{333D}".freeze => "\u{30A4}\u{30F3}\u{30C8}\u{30DB}".freeze,

    # 333E SQUARE BORUTO
    # ->   30EB KATAKANA LETTER RU
    #    + 30C8 KATAKANA LETTER TO
    #    + 30DB KATAKANA LETTER HO
    "\u{333E}".freeze => "\u{30EB}\u{30C8}\u{30DB}".freeze,

    # 333F SQUARE HON
    # ->   30DB KATAKANA LETTER HO
    #    + 30F3 KATAKANA LETTER N
    "\u{333F}".freeze => "\u{30DB}\u{30F3}".freeze,

    # 3340 SQUARE PONDO
    # ->   30F3 KATAKANA LETTER N
    #    + 30DB KATAKANA LETTER HO
    #    + 30C8 KATAKANA LETTER TO
    "\u{3340}".freeze => "\u{30F3}\u{30DB}\u{30C8}".freeze,

    # 3341 SQUARE HOORU
    # ->   30DB KATAKANA LETTER HO
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30EB KATAKANA LETTER RU
    "\u{3341}".freeze => "\u{30DB}\u{30FC}\u{30EB}".freeze,

    # 3342 SQUARE HOON
    # ->   30DB KATAKANA LETTER HO
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30F3 KATAKANA LETTER N
    "\u{3342}".freeze => "\u{30DB}\u{30FC}\u{30F3}".freeze,

    # 3343 SQUARE MAIKURO
    # ->   30DE KATAKANA LETTER MA
    #    + 30A4 KATAKANA LETTER I
    #    + 30AF KATAKANA LETTER KU
    #    + 30ED KATAKANA LETTER RO
    "\u{3343}".freeze => "\u{30DE}\u{30A4}\u{30AF}\u{30ED}".freeze,

    # 3344 SQUARE MAIRU
    # ->   30DE KATAKANA LETTER MA
    #    + 30A4 KATAKANA LETTER I
    #    + 30EB KATAKANA LETTER RU
    "\u{3344}".freeze => "\u{30DE}\u{30A4}\u{30EB}".freeze,

    # 3345 SQUARE MAHHA
    # ->   30DE KATAKANA LETTER MA
    #    + 30C3 KATAKANA LETTER SMALL TU
    #    + 30CF KATAKANA LETTER HA
    "\u{3345}".freeze => "\u{30DE}\u{30C3}\u{30CF}".freeze,

    # 3346 SQUARE MARUKU
    # ->   30DE KATAKANA LETTER MA
    #    + 30EB KATAKANA LETTER RU
    #    + 30AF KATAKANA LETTER KU
    "\u{3346}".freeze => "\u{30DE}\u{30EB}\u{30AF}".freeze,

    # 3347 SQUARE MANSYON
    # ->   30DE KATAKANA LETTER MA
    #    + 30F3 KATAKANA LETTER N
    #    + 30B7 KATAKANA LETTER SI
    #    + 30E7 KATAKANA LETTER SMALL YO
    #    + 30F3 KATAKANA LETTER N
    "\u{3347}".freeze => "\u{30DE}\u{30F3}\u{30B7}\u{30E7}\u{30F3}".freeze,

    # 3348 SQUARE MIKURON
    # ->   30DF KATAKANA LETTER MI
    #    + 30AF KATAKANA LETTER KU
    #    + 30ED KATAKANA LETTER RO
    #    + 30F3 KATAKANA LETTER N
    "\u{3348}".freeze => "\u{30DF}\u{30AF}\u{30ED}\u{30F3}".freeze,

    # 3349 SQUARE MIRI
    # ->   30DF KATAKANA LETTER MI
    #    + 30EA KATAKANA LETTER RI
    "\u{3349}".freeze => "\u{30DF}\u{30EA}".freeze,

    # 334A SQUARE MIRIBAARU
    # ->   30DF KATAKANA LETTER MI
    #    + 30EA KATAKANA LETTER RI
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30EB KATAKANA LETTER RU
    #    + 30CF KATAKANA LETTER HA
    "\u{334A}".freeze => "\u{30DF}\u{30EA}\u{30FC}\u{30EB}\u{30CF}".freeze,

    # 334B SQUARE MEGA
    # ->   30E1 KATAKANA LETTER ME
    #    + 30AB KATAKANA LETTER KA
    "\u{334B}".freeze => "\u{30E1}\u{30AB}".freeze,

    # 334C SQUARE MEGATON
    # ->   30E1 KATAKANA LETTER ME
    #    + 30C8 KATAKANA LETTER TO
    #    + 30F3 KATAKANA LETTER N
    #    + 30AB KATAKANA LETTER KA
    "\u{334C}".freeze => "\u{30E1}\u{30C8}\u{30F3}\u{30AB}".freeze,

    # 334D SQUARE MEETORU
    # ->   30E1 KATAKANA LETTER ME
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30C8 KATAKANA LETTER TO
    #    + 30EB KATAKANA LETTER RU
    "\u{334D}".freeze => "\u{30E1}\u{30FC}\u{30C8}\u{30EB}".freeze,

    # 334E SQUARE YAADO
    # ->   30E4 KATAKANA LETTER YA
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30C8 KATAKANA LETTER TO
    "\u{334E}".freeze => "\u{30E4}\u{30FC}\u{30C8}".freeze,

    # 334F SQUARE YAARU
    # ->   30E4 KATAKANA LETTER YA
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30EB KATAKANA LETTER RU
    "\u{334F}".freeze => "\u{30E4}\u{30FC}\u{30EB}".freeze,

    # 3350 SQUARE YUAN
    # ->   30E6 KATAKANA LETTER YU
    #    + 30A2 KATAKANA LETTER A
    #    + 30F3 KATAKANA LETTER N
    "\u{3350}".freeze => "\u{30E6}\u{30A2}\u{30F3}".freeze,

    # 3351 SQUARE RITTORU
    # ->   30EA KATAKANA LETTER RI
    #    + 30C3 KATAKANA LETTER SMALL TU
    #    + 30C8 KATAKANA LETTER TO
    #    + 30EB KATAKANA LETTER RU
    "\u{3351}".freeze => "\u{30EA}\u{30C3}\u{30C8}\u{30EB}".freeze,

    # 3352 SQUARE RIRA
    # ->   30EA KATAKANA LETTER RI
    #    + 30E9 KATAKANA LETTER RA
    "\u{3352}".freeze => "\u{30EA}\u{30E9}".freeze,

    # 3353 SQUARE RUPII
    # ->   30EB KATAKANA LETTER RU
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30D2 KATAKANA LETTER HI
    "\u{3353}".freeze => "\u{30EB}\u{30FC}\u{30D2}".freeze,

    # 3354 SQUARE RUUBURU
    # ->   30EB KATAKANA LETTER RU
    #    + 30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    #    + 30EB KATAKANA LETTER RU
    #    + 30D5 KATAKANA LETTER HU
    "\u{3354}".freeze => "\u{30EB}\u{30FC}\u{30EB}\u{30D5}".freeze,

    # 3355 SQUARE REMU
    # ->   30EC KATAKANA LETTER RE
    #    + 30E0 KATAKANA LETTER MU
    "\u{3355}".freeze => "\u{30EC}\u{30E0}".freeze,

    # 3356 SQUARE RENTOGEN
    # ->   30EC KATAKANA LETTER RE
    #    + 30F3 KATAKANA LETTER N
    #    + 30C8 KATAKANA LETTER TO
    #    + 30F3 KATAKANA LETTER N
    #    + 30B1 KATAKANA LETTER KE
    "\u{3356}".freeze => "\u{30EC}\u{30F3}\u{30C8}\u{30F3}\u{30B1}".freeze,

    # 3357 SQUARE WATTO
    # ->   30EF KATAKANA LETTER WA
    #    + 30C3 KATAKANA LETTER SMALL TU
    #    + 30C8 KATAKANA LETTER TO
    "\u{3357}".freeze => "\u{30EF}\u{30C3}\u{30C8}".freeze,

    # 3358 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR ZERO
    # ->   0030 DIGIT ZERO
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3358}".freeze => "0\u{70B9}".freeze,

    # 3359 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR ONE
    # ->   0031 DIGIT ONE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3359}".freeze => "1\u{70B9}".freeze,

    # 335A IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TWO
    # ->   0032 DIGIT TWO
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{335A}".freeze => "2\u{70B9}".freeze,

    # 335B IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR THREE
    # ->   0033 DIGIT THREE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{335B}".freeze => "3\u{70B9}".freeze,

    # 335C IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR FOUR
    # ->   0034 DIGIT FOUR
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{335C}".freeze => "4\u{70B9}".freeze,

    # 335D IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR FIVE
    # ->   0035 DIGIT FIVE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{335D}".freeze => "5\u{70B9}".freeze,

    # 335E IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR SIX
    # ->   0036 DIGIT SIX
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{335E}".freeze => "6\u{70B9}".freeze,

    # 335F IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR SEVEN
    # ->   0037 DIGIT SEVEN
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{335F}".freeze => "7\u{70B9}".freeze,

    # 3360 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR EIGHT
    # ->   0038 DIGIT EIGHT
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3360}".freeze => "8\u{70B9}".freeze,

    # 3361 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR NINE
    # ->   0039 DIGIT NINE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3361}".freeze => "9\u{70B9}".freeze,

    # 3362 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TEN
    # ->   0031 DIGIT ONE
    #    + 0030 DIGIT ZERO
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3362}".freeze => "10\u{70B9}".freeze,

    # 3363 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR ELEVEN
    # ->   0031 DIGIT ONE
    #    + 0031 DIGIT ONE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3363}".freeze => "11\u{70B9}".freeze,

    # 3364 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TWELVE
    # ->   0031 DIGIT ONE
    #    + 0032 DIGIT TWO
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3364}".freeze => "12\u{70B9}".freeze,

    # 3365 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR THIRTEEN
    # ->   0031 DIGIT ONE
    #    + 0033 DIGIT THREE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3365}".freeze => "13\u{70B9}".freeze,

    # 3366 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR FOURTEEN
    # ->   0031 DIGIT ONE
    #    + 0034 DIGIT FOUR
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3366}".freeze => "14\u{70B9}".freeze,

    # 3367 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR FIFTEEN
    # ->   0031 DIGIT ONE
    #    + 0035 DIGIT FIVE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3367}".freeze => "15\u{70B9}".freeze,

    # 3368 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR SIXTEEN
    # ->   0031 DIGIT ONE
    #    + 0036 DIGIT SIX
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3368}".freeze => "16\u{70B9}".freeze,

    # 3369 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR SEVENTEEN
    # ->   0031 DIGIT ONE
    #    + 0037 DIGIT SEVEN
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3369}".freeze => "17\u{70B9}".freeze,

    # 336A IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR EIGHTEEN
    # ->   0031 DIGIT ONE
    #    + 0038 DIGIT EIGHT
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{336A}".freeze => "18\u{70B9}".freeze,

    # 336B IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR NINETEEN
    # ->   0031 DIGIT ONE
    #    + 0039 DIGIT NINE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{336B}".freeze => "19\u{70B9}".freeze,

    # 336C IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TWENTY
    # ->   0032 DIGIT TWO
    #    + 0030 DIGIT ZERO
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{336C}".freeze => "20\u{70B9}".freeze,

    # 336D IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TWENTY-ONE
    # ->   0032 DIGIT TWO
    #    + 0031 DIGIT ONE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{336D}".freeze => "21\u{70B9}".freeze,

    # 336E IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TWENTY-TWO
    # ->   0032 DIGIT TWO
    #    + 0032 DIGIT TWO
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{336E}".freeze => "22\u{70B9}".freeze,

    # 336F IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TWENTY-THREE
    # ->   0032 DIGIT TWO
    #    + 0033 DIGIT THREE
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{336F}".freeze => "23\u{70B9}".freeze,

    # 3370 IDEOGRAPHIC TELEGRAPH SYMBOL FOR HOUR TWENTY-FOUR
    # ->   0032 DIGIT TWO
    #    + 0034 DIGIT FOUR
    #    + 70B9 CJK UNIFIED IDEOGRAPH 70B9
    "\u{3370}".freeze => "24\u{70B9}".freeze,

    # 3371 SQUARE HPA
    # ->   0068 LATIN SMALL LETTER H
    #    + 0050 LATIN CAPITAL LETTER P
    #    + 0061 LATIN SMALL LETTER A
    "\u{3371}".freeze => 'hPa'.freeze,

    # 3372 SQUARE DA
    # ->   0064 LATIN SMALL LETTER D
    #    + 0061 LATIN SMALL LETTER A
    "\u{3372}".freeze => 'da'.freeze,

    # 3373 SQUARE AU
    # ->   0041 LATIN CAPITAL LETTER A
    #    + 0055 LATIN CAPITAL LETTER U
    "\u{3373}".freeze => 'AU'.freeze,

    # 3374 SQUARE BAR
    # ->   0062 LATIN SMALL LETTER B
    #    + 0061 LATIN SMALL LETTER A
    #    + 0072 LATIN SMALL LETTER R
    "\u{3374}".freeze => 'bar'.freeze,

    # 3375 SQUARE OV
    # ->   006F LATIN SMALL LETTER O
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{3375}".freeze => 'oV'.freeze,

    # 3376 SQUARE PC
    # ->   0070 LATIN SMALL LETTER P
    #    + 0063 LATIN SMALL LETTER C
    "\u{3376}".freeze => 'pc'.freeze,

    # 3377 SQUARE DM
    # ->   0064 LATIN SMALL LETTER D
    #    + 006D LATIN SMALL LETTER M
    "\u{3377}".freeze => 'dm'.freeze,

    # 3378 SQUARE DM SQUARED
    # ->   0064 LATIN SMALL LETTER D
    #    + 006D LATIN SMALL LETTER M
    #    + 0032 DIGIT TWO
    "\u{3378}".freeze => 'dm2'.freeze,

    # 3379 SQUARE DM CUBED
    # ->   0064 LATIN SMALL LETTER D
    #    + 006D LATIN SMALL LETTER M
    #    + 0033 DIGIT THREE
    "\u{3379}".freeze => 'dm3'.freeze,

    # 337A SQUARE IU
    # ->   0049 LATIN CAPITAL LETTER I
    #    + 0055 LATIN CAPITAL LETTER U
    "\u{337A}".freeze => 'IU'.freeze,

    # 337B SQUARE ERA NAME HEISEI
    # ->   5E73 CJK UNIFIED IDEOGRAPH 5E73
    #    + 6210 CJK UNIFIED IDEOGRAPH 6210
    "\u{337B}".freeze => "\u{5E73}\u{6210}".freeze,

    # 337C SQUARE ERA NAME SYOUWA
    # ->   662D CJK UNIFIED IDEOGRAPH 662D
    #    + 548C CJK UNIFIED IDEOGRAPH 548C
    "\u{337C}".freeze => "\u{662D}\u{548C}".freeze,

    # 337D SQUARE ERA NAME TAISYOU
    # ->   5927 CJK UNIFIED IDEOGRAPH 5927
    #    + 6B63 CJK UNIFIED IDEOGRAPH 6B63
    "\u{337D}".freeze => "\u{5927}\u{6B63}".freeze,

    # 337E SQUARE ERA NAME MEIZI
    # ->   660E CJK UNIFIED IDEOGRAPH 660E
    #    + 6CBB CJK UNIFIED IDEOGRAPH 6CBB
    "\u{337E}".freeze => "\u{660E}\u{6CBB}".freeze,

    # 337F SQUARE CORPORATION
    # ->   682A CJK UNIFIED IDEOGRAPH 682A
    #    + 5F0F CJK UNIFIED IDEOGRAPH 5F0F
    #    + 4F1A CJK UNIFIED IDEOGRAPH 4F1A
    #    + 793E CJK UNIFIED IDEOGRAPH 793E
    "\u{337F}".freeze => "\u{682A}\u{5F0F}\u{4F1A}\u{793E}".freeze,

    # 3380 SQUARE PA AMPS
    # ->   0070 LATIN SMALL LETTER P
    #    + 0041 LATIN CAPITAL LETTER A
    "\u{3380}".freeze => 'pA'.freeze,

    # 3381 SQUARE NA
    # ->   006E LATIN SMALL LETTER N
    #    + 0041 LATIN CAPITAL LETTER A
    "\u{3381}".freeze => 'nA'.freeze,

    # 3382 SQUARE MU A
    # ->   03BC GREEK SMALL LETTER MU
    #    + 0041 LATIN CAPITAL LETTER A
    "\u{3382}".freeze => "\u{03BC}A".freeze,

    # 3383 SQUARE MA
    # ->   006D LATIN SMALL LETTER M
    #    + 0041 LATIN CAPITAL LETTER A
    "\u{3383}".freeze => 'mA'.freeze,

    # 3384 SQUARE KA
    # ->   006B LATIN SMALL LETTER K
    #    + 0041 LATIN CAPITAL LETTER A
    "\u{3384}".freeze => 'kA'.freeze,

    # 3385 SQUARE KB
    # ->   004B LATIN CAPITAL LETTER K
    #    + 0042 LATIN CAPITAL LETTER B
    "\u{3385}".freeze => 'KB'.freeze,

    # 3386 SQUARE MB
    # ->   004D LATIN CAPITAL LETTER M
    #    + 0042 LATIN CAPITAL LETTER B
    "\u{3386}".freeze => 'MB'.freeze,

    # 3387 SQUARE GB
    # ->   0047 LATIN CAPITAL LETTER G
    #    + 0042 LATIN CAPITAL LETTER B
    "\u{3387}".freeze => 'GB'.freeze,

    # 3388 SQUARE CAL
    # ->   0063 LATIN SMALL LETTER C
    #    + 0061 LATIN SMALL LETTER A
    #    + 006C LATIN SMALL LETTER L
    "\u{3388}".freeze => 'cal'.freeze,

    # 3389 SQUARE KCAL
    # ->   006B LATIN SMALL LETTER K
    #    + 0063 LATIN SMALL LETTER C
    #    + 0061 LATIN SMALL LETTER A
    #    + 006C LATIN SMALL LETTER L
    "\u{3389}".freeze => 'kcal'.freeze,

    # 338A SQUARE PF
    # ->   0070 LATIN SMALL LETTER P
    #    + 0046 LATIN CAPITAL LETTER F
    "\u{338A}".freeze => 'pF'.freeze,

    # 338B SQUARE NF
    # ->   006E LATIN SMALL LETTER N
    #    + 0046 LATIN CAPITAL LETTER F
    "\u{338B}".freeze => 'nF'.freeze,

    # 338C SQUARE MU F
    # ->   03BC GREEK SMALL LETTER MU
    #    + 0046 LATIN CAPITAL LETTER F
    "\u{338C}".freeze => "\u{03BC}F".freeze,

    # 338D SQUARE MU G
    # ->   03BC GREEK SMALL LETTER MU
    #    + 0067 LATIN SMALL LETTER G
    "\u{338D}".freeze => "\u{03BC}g".freeze,

    # 338E SQUARE MG
    # ->   006D LATIN SMALL LETTER M
    #    + 0067 LATIN SMALL LETTER G
    "\u{338E}".freeze => 'mg'.freeze,

    # 338F SQUARE KG
    # ->   006B LATIN SMALL LETTER K
    #    + 0067 LATIN SMALL LETTER G
    "\u{338F}".freeze => 'kg'.freeze,

    # 3390 SQUARE HZ
    # ->   0048 LATIN CAPITAL LETTER H
    #    + 007A LATIN SMALL LETTER Z
    "\u{3390}".freeze => 'Hz'.freeze,

    # 3391 SQUARE KHZ
    # ->   006B LATIN SMALL LETTER K
    #    + 0048 LATIN CAPITAL LETTER H
    #    + 007A LATIN SMALL LETTER Z
    "\u{3391}".freeze => 'kHz'.freeze,

    # 3392 SQUARE MHZ
    # ->   004D LATIN CAPITAL LETTER M
    #    + 0048 LATIN CAPITAL LETTER H
    #    + 007A LATIN SMALL LETTER Z
    "\u{3392}".freeze => 'MHz'.freeze,

    # 3393 SQUARE GHZ
    # ->   0047 LATIN CAPITAL LETTER G
    #    + 0048 LATIN CAPITAL LETTER H
    #    + 007A LATIN SMALL LETTER Z
    "\u{3393}".freeze => 'GHz'.freeze,

    # 3394 SQUARE THZ
    # ->   0054 LATIN CAPITAL LETTER T
    #    + 0048 LATIN CAPITAL LETTER H
    #    + 007A LATIN SMALL LETTER Z
    "\u{3394}".freeze => 'THz'.freeze,

    # 3395 SQUARE MU L
    # ->   03BC GREEK SMALL LETTER MU
    #    + 006C LATIN SMALL LETTER L
    "\u{3395}".freeze => "\u{03BC}l".freeze,

    # 3396 SQUARE ML
    # ->   006D LATIN SMALL LETTER M
    #    + 006C LATIN SMALL LETTER L
    "\u{3396}".freeze => 'ml'.freeze,

    # 3397 SQUARE DL
    # ->   0064 LATIN SMALL LETTER D
    #    + 006C LATIN SMALL LETTER L
    "\u{3397}".freeze => 'dl'.freeze,

    # 3398 SQUARE KL
    # ->   006B LATIN SMALL LETTER K
    #    + 006C LATIN SMALL LETTER L
    "\u{3398}".freeze => 'kl'.freeze,

    # 3399 SQUARE FM
    # ->   0066 LATIN SMALL LETTER F
    #    + 006D LATIN SMALL LETTER M
    "\u{3399}".freeze => 'fm'.freeze,

    # 339A SQUARE NM
    # ->   006E LATIN SMALL LETTER N
    #    + 006D LATIN SMALL LETTER M
    "\u{339A}".freeze => 'nm'.freeze,

    # 339B SQUARE MU M
    # ->   03BC GREEK SMALL LETTER MU
    #    + 006D LATIN SMALL LETTER M
    "\u{339B}".freeze => "\u{03BC}m".freeze,

    # 339C SQUARE MM
    # ->   006D LATIN SMALL LETTER M
    #    + 006D LATIN SMALL LETTER M
    "\u{339C}".freeze => 'mm'.freeze,

    # 339D SQUARE CM
    # ->   0063 LATIN SMALL LETTER C
    #    + 006D LATIN SMALL LETTER M
    "\u{339D}".freeze => 'cm'.freeze,

    # 339E SQUARE KM
    # ->   006B LATIN SMALL LETTER K
    #    + 006D LATIN SMALL LETTER M
    "\u{339E}".freeze => 'km'.freeze,

    # 339F SQUARE MM SQUARED
    # ->   006D LATIN SMALL LETTER M
    #    + 006D LATIN SMALL LETTER M
    #    + 0032 DIGIT TWO
    "\u{339F}".freeze => 'mm2'.freeze,

    # 33A0 SQUARE CM SQUARED
    # ->   0063 LATIN SMALL LETTER C
    #    + 006D LATIN SMALL LETTER M
    #    + 0032 DIGIT TWO
    "\u{33A0}".freeze => 'cm2'.freeze,

    # 33A1 SQUARE M SQUARED
    # ->   006D LATIN SMALL LETTER M
    #    + 0032 DIGIT TWO
    "\u{33A1}".freeze => 'm2'.freeze,

    # 33A2 SQUARE KM SQUARED
    # ->   006B LATIN SMALL LETTER K
    #    + 006D LATIN SMALL LETTER M
    #    + 0032 DIGIT TWO
    "\u{33A2}".freeze => 'km2'.freeze,

    # 33A3 SQUARE MM CUBED
    # ->   006D LATIN SMALL LETTER M
    #    + 006D LATIN SMALL LETTER M
    #    + 0033 DIGIT THREE
    "\u{33A3}".freeze => 'mm3'.freeze,

    # 33A4 SQUARE CM CUBED
    # ->   0063 LATIN SMALL LETTER C
    #    + 006D LATIN SMALL LETTER M
    #    + 0033 DIGIT THREE
    "\u{33A4}".freeze => 'cm3'.freeze,

    # 33A5 SQUARE M CUBED
    # ->   006D LATIN SMALL LETTER M
    #    + 0033 DIGIT THREE
    "\u{33A5}".freeze => 'm3'.freeze,

    # 33A6 SQUARE KM CUBED
    # ->   006B LATIN SMALL LETTER K
    #    + 006D LATIN SMALL LETTER M
    #    + 0033 DIGIT THREE
    "\u{33A6}".freeze => 'km3'.freeze,

    # 33A7 SQUARE M OVER S
    # ->   006D LATIN SMALL LETTER M
    #    + 2215 DIVISION SLASH
    #    + 0073 LATIN SMALL LETTER S
    "\u{33A7}".freeze => "m\u{2215}s".freeze,

    # 33A8 SQUARE M OVER S SQUARED
    # ->   006D LATIN SMALL LETTER M
    #    + 2215 DIVISION SLASH
    #    + 0073 LATIN SMALL LETTER S
    #    + 0032 DIGIT TWO
    "\u{33A8}".freeze => "m\u{2215}s2".freeze,

    # 33A9 SQUARE PA
    # ->   0050 LATIN CAPITAL LETTER P
    #    + 0061 LATIN SMALL LETTER A
    "\u{33A9}".freeze => 'Pa'.freeze,

    # 33AA SQUARE KPA
    # ->   006B LATIN SMALL LETTER K
    #    + 0050 LATIN CAPITAL LETTER P
    #    + 0061 LATIN SMALL LETTER A
    "\u{33AA}".freeze => 'kPa'.freeze,

    # 33AB SQUARE MPA
    # ->   004D LATIN CAPITAL LETTER M
    #    + 0050 LATIN CAPITAL LETTER P
    #    + 0061 LATIN SMALL LETTER A
    "\u{33AB}".freeze => 'MPa'.freeze,

    # 33AC SQUARE GPA
    # ->   0047 LATIN CAPITAL LETTER G
    #    + 0050 LATIN CAPITAL LETTER P
    #    + 0061 LATIN SMALL LETTER A
    "\u{33AC}".freeze => 'GPa'.freeze,

    # 33AD SQUARE RAD
    # ->   0072 LATIN SMALL LETTER R
    #    + 0061 LATIN SMALL LETTER A
    #    + 0064 LATIN SMALL LETTER D
    "\u{33AD}".freeze => 'rad'.freeze,

    # 33AE SQUARE RAD OVER S
    # ->   0072 LATIN SMALL LETTER R
    #    + 0061 LATIN SMALL LETTER A
    #    + 0064 LATIN SMALL LETTER D
    #    + 2215 DIVISION SLASH
    #    + 0073 LATIN SMALL LETTER S
    "\u{33AE}".freeze => "rad\u{2215}s".freeze,

    # 33AF SQUARE RAD OVER S SQUARED
    # ->   0072 LATIN SMALL LETTER R
    #    + 0061 LATIN SMALL LETTER A
    #    + 0064 LATIN SMALL LETTER D
    #    + 2215 DIVISION SLASH
    #    + 0073 LATIN SMALL LETTER S
    #    + 0032 DIGIT TWO
    "\u{33AF}".freeze => "rad\u{2215}s2".freeze,

    # 33B0 SQUARE PS
    # ->   0070 LATIN SMALL LETTER P
    #    + 0073 LATIN SMALL LETTER S
    "\u{33B0}".freeze => 'ps'.freeze,

    # 33B1 SQUARE NS
    # ->   006E LATIN SMALL LETTER N
    #    + 0073 LATIN SMALL LETTER S
    "\u{33B1}".freeze => 'ns'.freeze,

    # 33B2 SQUARE MU S
    # ->   03BC GREEK SMALL LETTER MU
    #    + 0073 LATIN SMALL LETTER S
    "\u{33B2}".freeze => "\u{03BC}s".freeze,

    # 33B3 SQUARE MS
    # ->   006D LATIN SMALL LETTER M
    #    + 0073 LATIN SMALL LETTER S
    "\u{33B3}".freeze => 'ms'.freeze,

    # 33B4 SQUARE PV
    # ->   0070 LATIN SMALL LETTER P
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{33B4}".freeze => 'pV'.freeze,

    # 33B5 SQUARE NV
    # ->   006E LATIN SMALL LETTER N
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{33B5}".freeze => 'nV'.freeze,

    # 33B6 SQUARE MU V
    # ->   03BC GREEK SMALL LETTER MU
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{33B6}".freeze => "\u{03BC}V".freeze,

    # 33B7 SQUARE MV
    # ->   006D LATIN SMALL LETTER M
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{33B7}".freeze => 'mV'.freeze,

    # 33B8 SQUARE KV
    # ->   006B LATIN SMALL LETTER K
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{33B8}".freeze => 'kV'.freeze,

    # 33B9 SQUARE MV MEGA
    # ->   004D LATIN CAPITAL LETTER M
    #    + 0056 LATIN CAPITAL LETTER V
    "\u{33B9}".freeze => 'MV'.freeze,

    # 33BA SQUARE PW
    # ->   0070 LATIN SMALL LETTER P
    #    + 0057 LATIN CAPITAL LETTER W
    "\u{33BA}".freeze => 'pW'.freeze,

    # 33BB SQUARE NW
    # ->   006E LATIN SMALL LETTER N
    #    + 0057 LATIN CAPITAL LETTER W
    "\u{33BB}".freeze => 'nW'.freeze,

    # 33BC SQUARE MU W
    # ->   03BC GREEK SMALL LETTER MU
    #    + 0057 LATIN CAPITAL LETTER W
    "\u{33BC}".freeze => "\u{03BC}W".freeze,

    # 33BD SQUARE MW
    # ->   006D LATIN SMALL LETTER M
    #    + 0057 LATIN CAPITAL LETTER W
    "\u{33BD}".freeze => 'mW'.freeze,

    # 33BE SQUARE KW
    # ->   006B LATIN SMALL LETTER K
    #    + 0057 LATIN CAPITAL LETTER W
    "\u{33BE}".freeze => 'kW'.freeze,

    # 33BF SQUARE MW MEGA
    # ->   004D LATIN CAPITAL LETTER M
    #    + 0057 LATIN CAPITAL LETTER W
    "\u{33BF}".freeze => 'MW'.freeze,

    # 33C0 SQUARE K OHM
    # ->   006B LATIN SMALL LETTER K
    #    + 03A9 GREEK CAPITAL LETTER OMEGA
    "\u{33C0}".freeze => "k\u{03A9}".freeze,

    # 33C1 SQUARE M OHM
    # ->   004D LATIN CAPITAL LETTER M
    #    + 03A9 GREEK CAPITAL LETTER OMEGA
    "\u{33C1}".freeze => "M\u{03A9}".freeze,

    # 33C2 SQUARE AM
    # ->   0061 LATIN SMALL LETTER A
    #    + 002E FULL STOP
    #    + 006D LATIN SMALL LETTER M
    #    + 002E FULL STOP
    "\u{33C2}".freeze => 'a.m.'.freeze,

    # 33C3 SQUARE BQ
    # ->   0042 LATIN CAPITAL LETTER B
    #    + 0071 LATIN SMALL LETTER Q
    "\u{33C3}".freeze => 'Bq'.freeze,

    # 33C4 SQUARE CC
    # ->   0063 LATIN SMALL LETTER C
    #    + 0063 LATIN SMALL LETTER C
    "\u{33C4}".freeze => 'cc'.freeze,

    # 33C5 SQUARE CD
    # ->   0063 LATIN SMALL LETTER C
    #    + 0064 LATIN SMALL LETTER D
    "\u{33C5}".freeze => 'cd'.freeze,

    # 33C6 SQUARE C OVER KG
    # ->   0043 LATIN CAPITAL LETTER C
    #    + 2215 DIVISION SLASH
    #    + 006B LATIN SMALL LETTER K
    #    + 0067 LATIN SMALL LETTER G
    "\u{33C6}".freeze => "C\u{2215}kg".freeze,

    # 33C7 SQUARE CO
    # ->   0043 LATIN CAPITAL LETTER C
    #    + 006F LATIN SMALL LETTER O
    #    + 002E FULL STOP
    "\u{33C7}".freeze => 'Co.'.freeze,

    # 33C8 SQUARE DB
    # ->   0064 LATIN SMALL LETTER D
    #    + 0042 LATIN CAPITAL LETTER B
    "\u{33C8}".freeze => 'dB'.freeze,

    # 33C9 SQUARE GY
    # ->   0047 LATIN CAPITAL LETTER G
    #    + 0079 LATIN SMALL LETTER Y
    "\u{33C9}".freeze => 'Gy'.freeze,

    # 33CA SQUARE HA
    # ->   0068 LATIN SMALL LETTER H
    #    + 0061 LATIN SMALL LETTER A
    "\u{33CA}".freeze => 'ha'.freeze,

    # 33CB SQUARE HP
    # ->   0048 LATIN CAPITAL LETTER H
    #    + 0050 LATIN CAPITAL LETTER P
    "\u{33CB}".freeze => 'HP'.freeze,

    # 33CC SQUARE IN
    # ->   0069 LATIN SMALL LETTER I
    #    + 006E LATIN SMALL LETTER N
    "\u{33CC}".freeze => 'in'.freeze,

    # 33CD SQUARE KK
    # ->   004B LATIN CAPITAL LETTER K
    #    + 004B LATIN CAPITAL LETTER K
    "\u{33CD}".freeze => 'KK'.freeze,

    # 33CE SQUARE KM CAPITAL
    # ->   004B LATIN CAPITAL LETTER K
    #    + 004D LATIN CAPITAL LETTER M
    "\u{33CE}".freeze => 'KM'.freeze,

    # 33CF SQUARE KT
    # ->   006B LATIN SMALL LETTER K
    #    + 0074 LATIN SMALL LETTER T
    "\u{33CF}".freeze => 'kt'.freeze,

    # 33D0 SQUARE LM
    # ->   006C LATIN SMALL LETTER L
    #    + 006D LATIN SMALL LETTER M
    "\u{33D0}".freeze => 'lm'.freeze,

    # 33D1 SQUARE LN
    # ->   006C LATIN SMALL LETTER L
    #    + 006E LATIN SMALL LETTER N
    "\u{33D1}".freeze => 'ln'.freeze,

    # 33D2 SQUARE LOG
    # ->   006C LATIN SMALL LETTER L
    #    + 006F LATIN SMALL LETTER O
    #    + 0067 LATIN SMALL LETTER G
    "\u{33D2}".freeze => 'log'.freeze,

    # 33D3 SQUARE LX
    # ->   006C LATIN SMALL LETTER L
    #    + 0078 LATIN SMALL LETTER X
    "\u{33D3}".freeze => 'lx'.freeze,

    # 33D4 SQUARE MB SMALL
    # ->   006D LATIN SMALL LETTER M
    #    + 0062 LATIN SMALL LETTER B
    "\u{33D4}".freeze => 'mb'.freeze,

    # 33D5 SQUARE MIL
    # ->   006D LATIN SMALL LETTER M
    #    + 0069 LATIN SMALL LETTER I
    #    + 006C LATIN SMALL LETTER L
    "\u{33D5}".freeze => 'mil'.freeze,

    # 33D6 SQUARE MOL
    # ->   006D LATIN SMALL LETTER M
    #    + 006F LATIN SMALL LETTER O
    #    + 006C LATIN SMALL LETTER L
    "\u{33D6}".freeze => 'mol'.freeze,

    # 33D7 SQUARE PH
    # ->   0050 LATIN CAPITAL LETTER P
    #    + 0048 LATIN CAPITAL LETTER H
    "\u{33D7}".freeze => 'PH'.freeze,

    # 33D8 SQUARE PM
    # ->   0070 LATIN SMALL LETTER P
    #    + 002E FULL STOP
    #    + 006D LATIN SMALL LETTER M
    #    + 002E FULL STOP
    "\u{33D8}".freeze => 'p.m.'.freeze,

    # 33D9 SQUARE PPM
    # ->   0050 LATIN CAPITAL LETTER P
    #    + 0050 LATIN CAPITAL LETTER P
    #    + 004D LATIN CAPITAL LETTER M
    "\u{33D9}".freeze => 'PPM'.freeze,

    # 33DA SQUARE PR
    # ->   0050 LATIN CAPITAL LETTER P
    #    + 0052 LATIN CAPITAL LETTER R
    "\u{33DA}".freeze => 'PR'.freeze,

    # 33DB SQUARE SR
    # ->   0073 LATIN SMALL LETTER S
    #    + 0072 LATIN SMALL LETTER R
    "\u{33DB}".freeze => 'sr'.freeze,

    # 33DC SQUARE SV
    # ->   0053 LATIN CAPITAL LETTER S
    #    + 0076 LATIN SMALL LETTER V
    "\u{33DC}".freeze => 'Sv'.freeze,

    # 33DD SQUARE WB
    # ->   0057 LATIN CAPITAL LETTER W
    #    + 0062 LATIN SMALL LETTER B
    "\u{33DD}".freeze => 'Wb'.freeze,

    # 33DE SQUARE V OVER M
    # ->   0056 LATIN CAPITAL LETTER V
    #    + 2215 DIVISION SLASH
    #    + 006D LATIN SMALL LETTER M
    "\u{33DE}".freeze => "V\u{2215}m".freeze,

    # 33DF SQUARE A OVER M
    # ->   0041 LATIN CAPITAL LETTER A
    #    + 2215 DIVISION SLASH
    #    + 006D LATIN SMALL LETTER M
    "\u{33DF}".freeze => "A\u{2215}m".freeze,

    # 33E0 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY ONE
    # ->   0031 DIGIT ONE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E0}".freeze => "1\u{65E5}".freeze,

    # 33E1 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWO
    # ->   0032 DIGIT TWO
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E1}".freeze => "2\u{65E5}".freeze,

    # 33E2 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY THREE
    # ->   0033 DIGIT THREE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E2}".freeze => "3\u{65E5}".freeze,

    # 33E3 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY FOUR
    # ->   0034 DIGIT FOUR
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E3}".freeze => "4\u{65E5}".freeze,

    # 33E4 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY FIVE
    # ->   0035 DIGIT FIVE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E4}".freeze => "5\u{65E5}".freeze,

    # 33E5 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY SIX
    # ->   0036 DIGIT SIX
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E5}".freeze => "6\u{65E5}".freeze,

    # 33E6 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY SEVEN
    # ->   0037 DIGIT SEVEN
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E6}".freeze => "7\u{65E5}".freeze,

    # 33E7 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY EIGHT
    # ->   0038 DIGIT EIGHT
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E7}".freeze => "8\u{65E5}".freeze,

    # 33E8 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY NINE
    # ->   0039 DIGIT NINE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E8}".freeze => "9\u{65E5}".freeze,

    # 33E9 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TEN
    # ->   0031 DIGIT ONE
    #    + 0030 DIGIT ZERO
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33E9}".freeze => "10\u{65E5}".freeze,

    # 33EA IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY ELEVEN
    # ->   0031 DIGIT ONE
    #    + 0031 DIGIT ONE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33EA}".freeze => "11\u{65E5}".freeze,

    # 33EB IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWELVE
    # ->   0031 DIGIT ONE
    #    + 0032 DIGIT TWO
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33EB}".freeze => "12\u{65E5}".freeze,

    # 33EC IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY THIRTEEN
    # ->   0031 DIGIT ONE
    #    + 0033 DIGIT THREE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33EC}".freeze => "13\u{65E5}".freeze,

    # 33ED IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY FOURTEEN
    # ->   0031 DIGIT ONE
    #    + 0034 DIGIT FOUR
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33ED}".freeze => "14\u{65E5}".freeze,

    # 33EE IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY FIFTEEN
    # ->   0031 DIGIT ONE
    #    + 0035 DIGIT FIVE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33EE}".freeze => "15\u{65E5}".freeze,

    # 33EF IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY SIXTEEN
    # ->   0031 DIGIT ONE
    #    + 0036 DIGIT SIX
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33EF}".freeze => "16\u{65E5}".freeze,

    # 33F0 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY SEVENTEEN
    # ->   0031 DIGIT ONE
    #    + 0037 DIGIT SEVEN
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F0}".freeze => "17\u{65E5}".freeze,

    # 33F1 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY EIGHTEEN
    # ->   0031 DIGIT ONE
    #    + 0038 DIGIT EIGHT
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F1}".freeze => "18\u{65E5}".freeze,

    # 33F2 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY NINETEEN
    # ->   0031 DIGIT ONE
    #    + 0039 DIGIT NINE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F2}".freeze => "19\u{65E5}".freeze,

    # 33F3 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY
    # ->   0032 DIGIT TWO
    #    + 0030 DIGIT ZERO
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F3}".freeze => "20\u{65E5}".freeze,

    # 33F4 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-ONE
    # ->   0032 DIGIT TWO
    #    + 0031 DIGIT ONE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F4}".freeze => "21\u{65E5}".freeze,

    # 33F5 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-TWO
    # ->   0032 DIGIT TWO
    #    + 0032 DIGIT TWO
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F5}".freeze => "22\u{65E5}".freeze,

    # 33F6 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-THREE
    # ->   0032 DIGIT TWO
    #    + 0033 DIGIT THREE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F6}".freeze => "23\u{65E5}".freeze,

    # 33F7 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-FOUR
    # ->   0032 DIGIT TWO
    #    + 0034 DIGIT FOUR
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F7}".freeze => "24\u{65E5}".freeze,

    # 33F8 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-FIVE
    # ->   0032 DIGIT TWO
    #    + 0035 DIGIT FIVE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F8}".freeze => "25\u{65E5}".freeze,

    # 33F9 IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-SIX
    # ->   0032 DIGIT TWO
    #    + 0036 DIGIT SIX
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33F9}".freeze => "26\u{65E5}".freeze,

    # 33FA IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-SEVEN
    # ->   0032 DIGIT TWO
    #    + 0037 DIGIT SEVEN
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33FA}".freeze => "27\u{65E5}".freeze,

    # 33FB IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-EIGHT
    # ->   0032 DIGIT TWO
    #    + 0038 DIGIT EIGHT
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33FB}".freeze => "28\u{65E5}".freeze,

    # 33FC IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY TWENTY-NINE
    # ->   0032 DIGIT TWO
    #    + 0039 DIGIT NINE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33FC}".freeze => "29\u{65E5}".freeze,

    # 33FD IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY THIRTY
    # ->   0033 DIGIT THREE
    #    + 0030 DIGIT ZERO
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33FD}".freeze => "30\u{65E5}".freeze,

    # 33FE IDEOGRAPHIC TELEGRAPH SYMBOL FOR DAY THIRTY-ONE
    # ->   0033 DIGIT THREE
    #    + 0031 DIGIT ONE
    #    + 65E5 CJK UNIFIED IDEOGRAPH 65E5
    "\u{33FE}".freeze => "31\u{65E5}".freeze,

    # 33FF SQUARE GAL
    # ->   0067 LATIN SMALL LETTER G
    #    + 0061 LATIN SMALL LETTER A
    #    + 006C LATIN SMALL LETTER L
    "\u{33FF}".freeze => 'gal'.freeze,

    # F900 CJK UNIFIED IDEOGRAPH F900
    # ->   8C48 CJK UNIFIED IDEOGRAPH 8C48
    "\u{F900}".freeze => "\u{8C48}".freeze,

    # F901 CJK UNIFIED IDEOGRAPH F901
    # ->   66F4 CJK UNIFIED IDEOGRAPH 66F4
    "\u{F901}".freeze => "\u{66F4}".freeze,

    # F902 CJK UNIFIED IDEOGRAPH F902
    # ->   8ECA CJK UNIFIED IDEOGRAPH 8ECA
    "\u{F902}".freeze => "\u{8ECA}".freeze,

    # F903 CJK UNIFIED IDEOGRAPH F903
    # ->   8CC8 CJK UNIFIED IDEOGRAPH 8CC8
    "\u{F903}".freeze => "\u{8CC8}".freeze,

    # F904 CJK UNIFIED IDEOGRAPH F904
    # ->   6ED1 CJK UNIFIED IDEOGRAPH 6ED1
    "\u{F904}".freeze => "\u{6ED1}".freeze,

    # F905 CJK UNIFIED IDEOGRAPH F905
    # ->   4E32 CJK UNIFIED IDEOGRAPH 4E32
    "\u{F905}".freeze => "\u{4E32}".freeze,

    # F906 CJK UNIFIED IDEOGRAPH F906
    # ->   53E5 CJK UNIFIED IDEOGRAPH 53E5
    "\u{F906}".freeze => "\u{53E5}".freeze,

    # F907 CJK UNIFIED IDEOGRAPH F907
    # ->   9F9C CJK UNIFIED IDEOGRAPH 9F9C
    "\u{F907}".freeze => "\u{9F9C}".freeze,

    # F908 CJK UNIFIED IDEOGRAPH F908
    # ->   9F9C CJK UNIFIED IDEOGRAPH 9F9C
    "\u{F908}".freeze => "\u{9F9C}".freeze,

    # F909 CJK UNIFIED IDEOGRAPH F909
    # ->   5951 CJK UNIFIED IDEOGRAPH 5951
    "\u{F909}".freeze => "\u{5951}".freeze,

    # F90A CJK UNIFIED IDEOGRAPH F90A
    # ->   91D1 CJK UNIFIED IDEOGRAPH 91D1
    "\u{F90A}".freeze => "\u{91D1}".freeze,

    # F90B CJK UNIFIED IDEOGRAPH F90B
    # ->   5587 CJK UNIFIED IDEOGRAPH 5587
    "\u{F90B}".freeze => "\u{5587}".freeze,

    # F90C CJK UNIFIED IDEOGRAPH F90C
    # ->   5948 CJK UNIFIED IDEOGRAPH 5948
    "\u{F90C}".freeze => "\u{5948}".freeze,

    # F90D CJK UNIFIED IDEOGRAPH F90D
    # ->   61F6 CJK UNIFIED IDEOGRAPH 61F6
    "\u{F90D}".freeze => "\u{61F6}".freeze,

    # F90E CJK UNIFIED IDEOGRAPH F90E
    # ->   7669 CJK UNIFIED IDEOGRAPH 7669
    "\u{F90E}".freeze => "\u{7669}".freeze,

    # F90F CJK UNIFIED IDEOGRAPH F90F
    # ->   7F85 CJK UNIFIED IDEOGRAPH 7F85
    "\u{F90F}".freeze => "\u{7F85}".freeze,

    # F910 CJK UNIFIED IDEOGRAPH F910
    # ->   863F CJK UNIFIED IDEOGRAPH 863F
    "\u{F910}".freeze => "\u{863F}".freeze,

    # F911 CJK UNIFIED IDEOGRAPH F911
    # ->   87BA CJK UNIFIED IDEOGRAPH 87BA
    "\u{F911}".freeze => "\u{87BA}".freeze,

    # F912 CJK UNIFIED IDEOGRAPH F912
    # ->   88F8 CJK UNIFIED IDEOGRAPH 88F8
    "\u{F912}".freeze => "\u{88F8}".freeze,

    # F913 CJK UNIFIED IDEOGRAPH F913
    # ->   908F CJK UNIFIED IDEOGRAPH 908F
    "\u{F913}".freeze => "\u{908F}".freeze,

    # F914 CJK UNIFIED IDEOGRAPH F914
    # ->   6A02 CJK UNIFIED IDEOGRAPH 6A02
    "\u{F914}".freeze => "\u{6A02}".freeze,

    # F915 CJK UNIFIED IDEOGRAPH F915
    # ->   6D1B CJK UNIFIED IDEOGRAPH 6D1B
    "\u{F915}".freeze => "\u{6D1B}".freeze,

    # F916 CJK UNIFIED IDEOGRAPH F916
    # ->   70D9 CJK UNIFIED IDEOGRAPH 70D9
    "\u{F916}".freeze => "\u{70D9}".freeze,

    # F917 CJK UNIFIED IDEOGRAPH F917
    # ->   73DE CJK UNIFIED IDEOGRAPH 73DE
    "\u{F917}".freeze => "\u{73DE}".freeze,

    # F918 CJK UNIFIED IDEOGRAPH F918
    # ->   843D CJK UNIFIED IDEOGRAPH 843D
    "\u{F918}".freeze => "\u{843D}".freeze,

    # F919 CJK UNIFIED IDEOGRAPH F919
    # ->   916A CJK UNIFIED IDEOGRAPH 916A
    "\u{F919}".freeze => "\u{916A}".freeze,

    # F91A CJK UNIFIED IDEOGRAPH F91A
    # ->   99F1 CJK UNIFIED IDEOGRAPH 99F1
    "\u{F91A}".freeze => "\u{99F1}".freeze,

    # F91B CJK UNIFIED IDEOGRAPH F91B
    # ->   4E82 CJK UNIFIED IDEOGRAPH 4E82
    "\u{F91B}".freeze => "\u{4E82}".freeze,

    # F91C CJK UNIFIED IDEOGRAPH F91C
    # ->   5375 CJK UNIFIED IDEOGRAPH 5375
    "\u{F91C}".freeze => "\u{5375}".freeze,

    # F91D CJK UNIFIED IDEOGRAPH F91D
    # ->   6B04 CJK UNIFIED IDEOGRAPH 6B04
    "\u{F91D}".freeze => "\u{6B04}".freeze,

    # F91E CJK UNIFIED IDEOGRAPH F91E
    # ->   721B CJK UNIFIED IDEOGRAPH 721B
    "\u{F91E}".freeze => "\u{721B}".freeze,

    # F91F CJK UNIFIED IDEOGRAPH F91F
    # ->   862D CJK UNIFIED IDEOGRAPH 862D
    "\u{F91F}".freeze => "\u{862D}".freeze,

    # F920 CJK UNIFIED IDEOGRAPH F920
    # ->   9E1E CJK UNIFIED IDEOGRAPH 9E1E
    "\u{F920}".freeze => "\u{9E1E}".freeze,

    # F921 CJK UNIFIED IDEOGRAPH F921
    # ->   5D50 CJK UNIFIED IDEOGRAPH 5D50
    "\u{F921}".freeze => "\u{5D50}".freeze,

    # F922 CJK UNIFIED IDEOGRAPH F922
    # ->   6FEB CJK UNIFIED IDEOGRAPH 6FEB
    "\u{F922}".freeze => "\u{6FEB}".freeze,

    # F923 CJK UNIFIED IDEOGRAPH F923
    # ->   85CD CJK UNIFIED IDEOGRAPH 85CD
    "\u{F923}".freeze => "\u{85CD}".freeze,

    # F924 CJK UNIFIED IDEOGRAPH F924
    # ->   8964 CJK UNIFIED IDEOGRAPH 8964
    "\u{F924}".freeze => "\u{8964}".freeze,

    # F925 CJK UNIFIED IDEOGRAPH F925
    # ->   62C9 CJK UNIFIED IDEOGRAPH 62C9
    "\u{F925}".freeze => "\u{62C9}".freeze,

    # F926 CJK UNIFIED IDEOGRAPH F926
    # ->   81D8 CJK UNIFIED IDEOGRAPH 81D8
    "\u{F926}".freeze => "\u{81D8}".freeze,

    # F927 CJK UNIFIED IDEOGRAPH F927
    # ->   881F CJK UNIFIED IDEOGRAPH 881F
    "\u{F927}".freeze => "\u{881F}".freeze,

    # F928 CJK UNIFIED IDEOGRAPH F928
    # ->   5ECA CJK UNIFIED IDEOGRAPH 5ECA
    "\u{F928}".freeze => "\u{5ECA}".freeze,

    # F929 CJK UNIFIED IDEOGRAPH F929
    # ->   6717 CJK UNIFIED IDEOGRAPH 6717
    "\u{F929}".freeze => "\u{6717}".freeze,

    # F92A CJK UNIFIED IDEOGRAPH F92A
    # ->   6D6A CJK UNIFIED IDEOGRAPH 6D6A
    "\u{F92A}".freeze => "\u{6D6A}".freeze,

    # F92B CJK UNIFIED IDEOGRAPH F92B
    # ->   72FC CJK UNIFIED IDEOGRAPH 72FC
    "\u{F92B}".freeze => "\u{72FC}".freeze,

    # F92C CJK UNIFIED IDEOGRAPH F92C
    # ->   90CE CJK UNIFIED IDEOGRAPH 90CE
    "\u{F92C}".freeze => "\u{90CE}".freeze,

    # F92D CJK UNIFIED IDEOGRAPH F92D
    # ->   4F86 CJK UNIFIED IDEOGRAPH 4F86
    "\u{F92D}".freeze => "\u{4F86}".freeze,

    # F92E CJK UNIFIED IDEOGRAPH F92E
    # ->   51B7 CJK UNIFIED IDEOGRAPH 51B7
    "\u{F92E}".freeze => "\u{51B7}".freeze,

    # F92F CJK UNIFIED IDEOGRAPH F92F
    # ->   52DE CJK UNIFIED IDEOGRAPH 52DE
    "\u{F92F}".freeze => "\u{52DE}".freeze,

    # F930 CJK UNIFIED IDEOGRAPH F930
    # ->   64C4 CJK UNIFIED IDEOGRAPH 64C4
    "\u{F930}".freeze => "\u{64C4}".freeze,

    # F931 CJK UNIFIED IDEOGRAPH F931
    # ->   6AD3 CJK UNIFIED IDEOGRAPH 6AD3
    "\u{F931}".freeze => "\u{6AD3}".freeze,

    # F932 CJK UNIFIED IDEOGRAPH F932
    # ->   7210 CJK UNIFIED IDEOGRAPH 7210
    "\u{F932}".freeze => "\u{7210}".freeze,

    # F933 CJK UNIFIED IDEOGRAPH F933
    # ->   76E7 CJK UNIFIED IDEOGRAPH 76E7
    "\u{F933}".freeze => "\u{76E7}".freeze,

    # F934 CJK UNIFIED IDEOGRAPH F934
    # ->   8001 CJK UNIFIED IDEOGRAPH 8001
    "\u{F934}".freeze => "\u{8001}".freeze,

    # F935 CJK UNIFIED IDEOGRAPH F935
    # ->   8606 CJK UNIFIED IDEOGRAPH 8606
    "\u{F935}".freeze => "\u{8606}".freeze,

    # F936 CJK UNIFIED IDEOGRAPH F936
    # ->   865C CJK UNIFIED IDEOGRAPH 865C
    "\u{F936}".freeze => "\u{865C}".freeze,

    # F937 CJK UNIFIED IDEOGRAPH F937
    # ->   8DEF CJK UNIFIED IDEOGRAPH 8DEF
    "\u{F937}".freeze => "\u{8DEF}".freeze,

    # F938 CJK UNIFIED IDEOGRAPH F938
    # ->   9732 CJK UNIFIED IDEOGRAPH 9732
    "\u{F938}".freeze => "\u{9732}".freeze,

    # F939 CJK UNIFIED IDEOGRAPH F939
    # ->   9B6F CJK UNIFIED IDEOGRAPH 9B6F
    "\u{F939}".freeze => "\u{9B6F}".freeze,

    # F93A CJK UNIFIED IDEOGRAPH F93A
    # ->   9DFA CJK UNIFIED IDEOGRAPH 9DFA
    "\u{F93A}".freeze => "\u{9DFA}".freeze,

    # F93B CJK UNIFIED IDEOGRAPH F93B
    # ->   788C CJK UNIFIED IDEOGRAPH 788C
    "\u{F93B}".freeze => "\u{788C}".freeze,

    # F93C CJK UNIFIED IDEOGRAPH F93C
    # ->   797F CJK UNIFIED IDEOGRAPH 797F
    "\u{F93C}".freeze => "\u{797F}".freeze,

    # F93D CJK UNIFIED IDEOGRAPH F93D
    # ->   7DA0 CJK UNIFIED IDEOGRAPH 7DA0
    "\u{F93D}".freeze => "\u{7DA0}".freeze,

    # F93E CJK UNIFIED IDEOGRAPH F93E
    # ->   83C9 CJK UNIFIED IDEOGRAPH 83C9
    "\u{F93E}".freeze => "\u{83C9}".freeze,

    # F93F CJK UNIFIED IDEOGRAPH F93F
    # ->   9304 CJK UNIFIED IDEOGRAPH 9304
    "\u{F93F}".freeze => "\u{9304}".freeze,

    # F940 CJK UNIFIED IDEOGRAPH F940
    # ->   9E7F CJK UNIFIED IDEOGRAPH 9E7F
    "\u{F940}".freeze => "\u{9E7F}".freeze,

    # F941 CJK UNIFIED IDEOGRAPH F941
    # ->   8AD6 CJK UNIFIED IDEOGRAPH 8AD6
    "\u{F941}".freeze => "\u{8AD6}".freeze,

    # F942 CJK UNIFIED IDEOGRAPH F942
    # ->   58DF CJK UNIFIED IDEOGRAPH 58DF
    "\u{F942}".freeze => "\u{58DF}".freeze,

    # F943 CJK UNIFIED IDEOGRAPH F943
    # ->   5F04 CJK UNIFIED IDEOGRAPH 5F04
    "\u{F943}".freeze => "\u{5F04}".freeze,

    # F944 CJK UNIFIED IDEOGRAPH F944
    # ->   7C60 CJK UNIFIED IDEOGRAPH 7C60
    "\u{F944}".freeze => "\u{7C60}".freeze,

    # F945 CJK UNIFIED IDEOGRAPH F945
    # ->   807E CJK UNIFIED IDEOGRAPH 807E
    "\u{F945}".freeze => "\u{807E}".freeze,

    # F946 CJK UNIFIED IDEOGRAPH F946
    # ->   7262 CJK UNIFIED IDEOGRAPH 7262
    "\u{F946}".freeze => "\u{7262}".freeze,

    # F947 CJK UNIFIED IDEOGRAPH F947
    # ->   78CA CJK UNIFIED IDEOGRAPH 78CA
    "\u{F947}".freeze => "\u{78CA}".freeze,

    # F948 CJK UNIFIED IDEOGRAPH F948
    # ->   8CC2 CJK UNIFIED IDEOGRAPH 8CC2
    "\u{F948}".freeze => "\u{8CC2}".freeze,

    # F949 CJK UNIFIED IDEOGRAPH F949
    # ->   96F7 CJK UNIFIED IDEOGRAPH 96F7
    "\u{F949}".freeze => "\u{96F7}".freeze,

    # F94A CJK UNIFIED IDEOGRAPH F94A
    # ->   58D8 CJK UNIFIED IDEOGRAPH 58D8
    "\u{F94A}".freeze => "\u{58D8}".freeze,

    # F94B CJK UNIFIED IDEOGRAPH F94B
    # ->   5C62 CJK UNIFIED IDEOGRAPH 5C62
    "\u{F94B}".freeze => "\u{5C62}".freeze,

    # F94C CJK UNIFIED IDEOGRAPH F94C
    # ->   6A13 CJK UNIFIED IDEOGRAPH 6A13
    "\u{F94C}".freeze => "\u{6A13}".freeze,

    # F94D CJK UNIFIED IDEOGRAPH F94D
    # ->   6DDA CJK UNIFIED IDEOGRAPH 6DDA
    "\u{F94D}".freeze => "\u{6DDA}".freeze,

    # F94E CJK UNIFIED IDEOGRAPH F94E
    # ->   6F0F CJK UNIFIED IDEOGRAPH 6F0F
    "\u{F94E}".freeze => "\u{6F0F}".freeze,

    # F94F CJK UNIFIED IDEOGRAPH F94F
    # ->   7D2F CJK UNIFIED IDEOGRAPH 7D2F
    "\u{F94F}".freeze => "\u{7D2F}".freeze,

    # F950 CJK UNIFIED IDEOGRAPH F950
    # ->   7E37 CJK UNIFIED IDEOGRAPH 7E37
    "\u{F950}".freeze => "\u{7E37}".freeze,

    # F951 CJK UNIFIED IDEOGRAPH F951
    # ->   964B CJK UNIFIED IDEOGRAPH 964B
    "\u{F951}".freeze => "\u{964B}".freeze,

    # F952 CJK UNIFIED IDEOGRAPH F952
    # ->   52D2 CJK UNIFIED IDEOGRAPH 52D2
    "\u{F952}".freeze => "\u{52D2}".freeze,

    # F953 CJK UNIFIED IDEOGRAPH F953
    # ->   808B CJK UNIFIED IDEOGRAPH 808B
    "\u{F953}".freeze => "\u{808B}".freeze,

    # F954 CJK UNIFIED IDEOGRAPH F954
    # ->   51DC CJK UNIFIED IDEOGRAPH 51DC
    "\u{F954}".freeze => "\u{51DC}".freeze,

    # F955 CJK UNIFIED IDEOGRAPH F955
    # ->   51CC CJK UNIFIED IDEOGRAPH 51CC
    "\u{F955}".freeze => "\u{51CC}".freeze,

    # F956 CJK UNIFIED IDEOGRAPH F956
    # ->   7A1C CJK UNIFIED IDEOGRAPH 7A1C
    "\u{F956}".freeze => "\u{7A1C}".freeze,

    # F957 CJK UNIFIED IDEOGRAPH F957
    # ->   7DBE CJK UNIFIED IDEOGRAPH 7DBE
    "\u{F957}".freeze => "\u{7DBE}".freeze,

    # F958 CJK UNIFIED IDEOGRAPH F958
    # ->   83F1 CJK UNIFIED IDEOGRAPH 83F1
    "\u{F958}".freeze => "\u{83F1}".freeze,

    # F959 CJK UNIFIED IDEOGRAPH F959
    # ->   9675 CJK UNIFIED IDEOGRAPH 9675
    "\u{F959}".freeze => "\u{9675}".freeze,

    # F95A CJK UNIFIED IDEOGRAPH F95A
    # ->   8B80 CJK UNIFIED IDEOGRAPH 8B80
    "\u{F95A}".freeze => "\u{8B80}".freeze,

    # F95B CJK UNIFIED IDEOGRAPH F95B
    # ->   62CF CJK UNIFIED IDEOGRAPH 62CF
    "\u{F95B}".freeze => "\u{62CF}".freeze,

    # F95C CJK UNIFIED IDEOGRAPH F95C
    # ->   6A02 CJK UNIFIED IDEOGRAPH 6A02
    "\u{F95C}".freeze => "\u{6A02}".freeze,

    # F95D CJK UNIFIED IDEOGRAPH F95D
    # ->   8AFE CJK UNIFIED IDEOGRAPH 8AFE
    "\u{F95D}".freeze => "\u{8AFE}".freeze,

    # F95E CJK UNIFIED IDEOGRAPH F95E
    # ->   4E39 CJK UNIFIED IDEOGRAPH 4E39
    "\u{F95E}".freeze => "\u{4E39}".freeze,

    # F95F CJK UNIFIED IDEOGRAPH F95F
    # ->   5BE7 CJK UNIFIED IDEOGRAPH 5BE7
    "\u{F95F}".freeze => "\u{5BE7}".freeze,

    # F960 CJK UNIFIED IDEOGRAPH F960
    # ->   6012 CJK UNIFIED IDEOGRAPH 6012
    "\u{F960}".freeze => "\u{6012}".freeze,

    # F961 CJK UNIFIED IDEOGRAPH F961
    # ->   7387 CJK UNIFIED IDEOGRAPH 7387
    "\u{F961}".freeze => "\u{7387}".freeze,

    # F962 CJK UNIFIED IDEOGRAPH F962
    # ->   7570 CJK UNIFIED IDEOGRAPH 7570
    "\u{F962}".freeze => "\u{7570}".freeze,

    # F963 CJK UNIFIED IDEOGRAPH F963
    # ->   5317 CJK UNIFIED IDEOGRAPH 5317
    "\u{F963}".freeze => "\u{5317}".freeze,

    # F964 CJK UNIFIED IDEOGRAPH F964
    # ->   78FB CJK UNIFIED IDEOGRAPH 78FB
    "\u{F964}".freeze => "\u{78FB}".freeze,

    # F965 CJK UNIFIED IDEOGRAPH F965
    # ->   4FBF CJK UNIFIED IDEOGRAPH 4FBF
    "\u{F965}".freeze => "\u{4FBF}".freeze,

    # F966 CJK UNIFIED IDEOGRAPH F966
    # ->   5FA9 CJK UNIFIED IDEOGRAPH 5FA9
    "\u{F966}".freeze => "\u{5FA9}".freeze,

    # F967 CJK UNIFIED IDEOGRAPH F967
    # ->   4E0D CJK UNIFIED IDEOGRAPH 4E0D
    "\u{F967}".freeze => "\u{4E0D}".freeze,

    # F968 CJK UNIFIED IDEOGRAPH F968
    # ->   6CCC CJK UNIFIED IDEOGRAPH 6CCC
    "\u{F968}".freeze => "\u{6CCC}".freeze,

    # F969 CJK UNIFIED IDEOGRAPH F969
    # ->   6578 CJK UNIFIED IDEOGRAPH 6578
    "\u{F969}".freeze => "\u{6578}".freeze,

    # F96A CJK UNIFIED IDEOGRAPH F96A
    # ->   7D22 CJK UNIFIED IDEOGRAPH 7D22
    "\u{F96A}".freeze => "\u{7D22}".freeze,

    # F96B CJK UNIFIED IDEOGRAPH F96B
    # ->   53C3 CJK UNIFIED IDEOGRAPH 53C3
    "\u{F96B}".freeze => "\u{53C3}".freeze,

    # F96C CJK UNIFIED IDEOGRAPH F96C
    # ->   585E CJK UNIFIED IDEOGRAPH 585E
    "\u{F96C}".freeze => "\u{585E}".freeze,

    # F96D CJK UNIFIED IDEOGRAPH F96D
    # ->   7701 CJK UNIFIED IDEOGRAPH 7701
    "\u{F96D}".freeze => "\u{7701}".freeze,

    # F96E CJK UNIFIED IDEOGRAPH F96E
    # ->   8449 CJK UNIFIED IDEOGRAPH 8449
    "\u{F96E}".freeze => "\u{8449}".freeze,

    # F96F CJK UNIFIED IDEOGRAPH F96F
    # ->   8AAA CJK UNIFIED IDEOGRAPH 8AAA
    "\u{F96F}".freeze => "\u{8AAA}".freeze,

    # F970 CJK UNIFIED IDEOGRAPH F970
    # ->   6BBA CJK UNIFIED IDEOGRAPH 6BBA
    "\u{F970}".freeze => "\u{6BBA}".freeze,

    # F971 CJK UNIFIED IDEOGRAPH F971
    # ->   8FB0 CJK UNIFIED IDEOGRAPH 8FB0
    "\u{F971}".freeze => "\u{8FB0}".freeze,

    # F972 CJK UNIFIED IDEOGRAPH F972
    # ->   6C88 CJK UNIFIED IDEOGRAPH 6C88
    "\u{F972}".freeze => "\u{6C88}".freeze,

    # F973 CJK UNIFIED IDEOGRAPH F973
    # ->   62FE CJK UNIFIED IDEOGRAPH 62FE
    "\u{F973}".freeze => "\u{62FE}".freeze,

    # F974 CJK UNIFIED IDEOGRAPH F974
    # ->   82E5 CJK UNIFIED IDEOGRAPH 82E5
    "\u{F974}".freeze => "\u{82E5}".freeze,

    # F975 CJK UNIFIED IDEOGRAPH F975
    # ->   63A0 CJK UNIFIED IDEOGRAPH 63A0
    "\u{F975}".freeze => "\u{63A0}".freeze,

    # F976 CJK UNIFIED IDEOGRAPH F976
    # ->   7565 CJK UNIFIED IDEOGRAPH 7565
    "\u{F976}".freeze => "\u{7565}".freeze,

    # F977 CJK UNIFIED IDEOGRAPH F977
    # ->   4EAE CJK UNIFIED IDEOGRAPH 4EAE
    "\u{F977}".freeze => "\u{4EAE}".freeze,

    # F978 CJK UNIFIED IDEOGRAPH F978
    # ->   5169 CJK UNIFIED IDEOGRAPH 5169
    "\u{F978}".freeze => "\u{5169}".freeze,

    # F979 CJK UNIFIED IDEOGRAPH F979
    # ->   51C9 CJK UNIFIED IDEOGRAPH 51C9
    "\u{F979}".freeze => "\u{51C9}".freeze,

    # F97A CJK UNIFIED IDEOGRAPH F97A
    # ->   6881 CJK UNIFIED IDEOGRAPH 6881
    "\u{F97A}".freeze => "\u{6881}".freeze,

    # F97B CJK UNIFIED IDEOGRAPH F97B
    # ->   7CE7 CJK UNIFIED IDEOGRAPH 7CE7
    "\u{F97B}".freeze => "\u{7CE7}".freeze,

    # F97C CJK UNIFIED IDEOGRAPH F97C
    # ->   826F CJK UNIFIED IDEOGRAPH 826F
    "\u{F97C}".freeze => "\u{826F}".freeze,

    # F97D CJK UNIFIED IDEOGRAPH F97D
    # ->   8AD2 CJK UNIFIED IDEOGRAPH 8AD2
    "\u{F97D}".freeze => "\u{8AD2}".freeze,

    # F97E CJK UNIFIED IDEOGRAPH F97E
    # ->   91CF CJK UNIFIED IDEOGRAPH 91CF
    "\u{F97E}".freeze => "\u{91CF}".freeze,

    # F97F CJK UNIFIED IDEOGRAPH F97F
    # ->   52F5 CJK UNIFIED IDEOGRAPH 52F5
    "\u{F97F}".freeze => "\u{52F5}".freeze,

    # F980 CJK UNIFIED IDEOGRAPH F980
    # ->   5442 CJK UNIFIED IDEOGRAPH 5442
    "\u{F980}".freeze => "\u{5442}".freeze,

    # F981 CJK UNIFIED IDEOGRAPH F981
    # ->   5973 CJK UNIFIED IDEOGRAPH 5973
    "\u{F981}".freeze => "\u{5973}".freeze,

    # F982 CJK UNIFIED IDEOGRAPH F982
    # ->   5EEC CJK UNIFIED IDEOGRAPH 5EEC
    "\u{F982}".freeze => "\u{5EEC}".freeze,

    # F983 CJK UNIFIED IDEOGRAPH F983
    # ->   65C5 CJK UNIFIED IDEOGRAPH 65C5
    "\u{F983}".freeze => "\u{65C5}".freeze,

    # F984 CJK UNIFIED IDEOGRAPH F984
    # ->   6FFE CJK UNIFIED IDEOGRAPH 6FFE
    "\u{F984}".freeze => "\u{6FFE}".freeze,

    # F985 CJK UNIFIED IDEOGRAPH F985
    # ->   792A CJK UNIFIED IDEOGRAPH 792A
    "\u{F985}".freeze => "\u{792A}".freeze,

    # F986 CJK UNIFIED IDEOGRAPH F986
    # ->   95AD CJK UNIFIED IDEOGRAPH 95AD
    "\u{F986}".freeze => "\u{95AD}".freeze,

    # F987 CJK UNIFIED IDEOGRAPH F987
    # ->   9A6A CJK UNIFIED IDEOGRAPH 9A6A
    "\u{F987}".freeze => "\u{9A6A}".freeze,

    # F988 CJK UNIFIED IDEOGRAPH F988
    # ->   9E97 CJK UNIFIED IDEOGRAPH 9E97
    "\u{F988}".freeze => "\u{9E97}".freeze,

    # F989 CJK UNIFIED IDEOGRAPH F989
    # ->   9ECE CJK UNIFIED IDEOGRAPH 9ECE
    "\u{F989}".freeze => "\u{9ECE}".freeze,

    # F98A CJK UNIFIED IDEOGRAPH F98A
    # ->   529B CJK UNIFIED IDEOGRAPH 529B
    "\u{F98A}".freeze => "\u{529B}".freeze,

    # F98B CJK UNIFIED IDEOGRAPH F98B
    # ->   66C6 CJK UNIFIED IDEOGRAPH 66C6
    "\u{F98B}".freeze => "\u{66C6}".freeze,

    # F98C CJK UNIFIED IDEOGRAPH F98C
    # ->   6B77 CJK UNIFIED IDEOGRAPH 6B77
    "\u{F98C}".freeze => "\u{6B77}".freeze,

    # F98D CJK UNIFIED IDEOGRAPH F98D
    # ->   8F62 CJK UNIFIED IDEOGRAPH 8F62
    "\u{F98D}".freeze => "\u{8F62}".freeze,

    # F98E CJK UNIFIED IDEOGRAPH F98E
    # ->   5E74 CJK UNIFIED IDEOGRAPH 5E74
    "\u{F98E}".freeze => "\u{5E74}".freeze,

    # F98F CJK UNIFIED IDEOGRAPH F98F
    # ->   6190 CJK UNIFIED IDEOGRAPH 6190
    "\u{F98F}".freeze => "\u{6190}".freeze,

    # F990 CJK UNIFIED IDEOGRAPH F990
    # ->   6200 CJK UNIFIED IDEOGRAPH 6200
    "\u{F990}".freeze => "\u{6200}".freeze,

    # F991 CJK UNIFIED IDEOGRAPH F991
    # ->   649A CJK UNIFIED IDEOGRAPH 649A
    "\u{F991}".freeze => "\u{649A}".freeze,

    # F992 CJK UNIFIED IDEOGRAPH F992
    # ->   6F23 CJK UNIFIED IDEOGRAPH 6F23
    "\u{F992}".freeze => "\u{6F23}".freeze,

    # F993 CJK UNIFIED IDEOGRAPH F993
    # ->   7149 CJK UNIFIED IDEOGRAPH 7149
    "\u{F993}".freeze => "\u{7149}".freeze,

    # F994 CJK UNIFIED IDEOGRAPH F994
    # ->   7489 CJK UNIFIED IDEOGRAPH 7489
    "\u{F994}".freeze => "\u{7489}".freeze,

    # F995 CJK UNIFIED IDEOGRAPH F995
    # ->   79CA CJK UNIFIED IDEOGRAPH 79CA
    "\u{F995}".freeze => "\u{79CA}".freeze,

    # F996 CJK UNIFIED IDEOGRAPH F996
    # ->   7DF4 CJK UNIFIED IDEOGRAPH 7DF4
    "\u{F996}".freeze => "\u{7DF4}".freeze,

    # F997 CJK UNIFIED IDEOGRAPH F997
    # ->   806F CJK UNIFIED IDEOGRAPH 806F
    "\u{F997}".freeze => "\u{806F}".freeze,

    # F998 CJK UNIFIED IDEOGRAPH F998
    # ->   8F26 CJK UNIFIED IDEOGRAPH 8F26
    "\u{F998}".freeze => "\u{8F26}".freeze,

    # F999 CJK UNIFIED IDEOGRAPH F999
    # ->   84EE CJK UNIFIED IDEOGRAPH 84EE
    "\u{F999}".freeze => "\u{84EE}".freeze,

    # F99A CJK UNIFIED IDEOGRAPH F99A
    # ->   9023 CJK UNIFIED IDEOGRAPH 9023
    "\u{F99A}".freeze => "\u{9023}".freeze,

    # F99B CJK UNIFIED IDEOGRAPH F99B
    # ->   934A CJK UNIFIED IDEOGRAPH 934A
    "\u{F99B}".freeze => "\u{934A}".freeze,

    # F99C CJK UNIFIED IDEOGRAPH F99C
    # ->   5217 CJK UNIFIED IDEOGRAPH 5217
    "\u{F99C}".freeze => "\u{5217}".freeze,

    # F99D CJK UNIFIED IDEOGRAPH F99D
    # ->   52A3 CJK UNIFIED IDEOGRAPH 52A3
    "\u{F99D}".freeze => "\u{52A3}".freeze,

    # F99E CJK UNIFIED IDEOGRAPH F99E
    # ->   54BD CJK UNIFIED IDEOGRAPH 54BD
    "\u{F99E}".freeze => "\u{54BD}".freeze,

    # F99F CJK UNIFIED IDEOGRAPH F99F
    # ->   70C8 CJK UNIFIED IDEOGRAPH 70C8
    "\u{F99F}".freeze => "\u{70C8}".freeze,

    # F9A0 CJK UNIFIED IDEOGRAPH F9A0
    # ->   88C2 CJK UNIFIED IDEOGRAPH 88C2
    "\u{F9A0}".freeze => "\u{88C2}".freeze,

    # F9A1 CJK UNIFIED IDEOGRAPH F9A1
    # ->   8AAA CJK UNIFIED IDEOGRAPH 8AAA
    "\u{F9A1}".freeze => "\u{8AAA}".freeze,

    # F9A2 CJK UNIFIED IDEOGRAPH F9A2
    # ->   5EC9 CJK UNIFIED IDEOGRAPH 5EC9
    "\u{F9A2}".freeze => "\u{5EC9}".freeze,

    # F9A3 CJK UNIFIED IDEOGRAPH F9A3
    # ->   5FF5 CJK UNIFIED IDEOGRAPH 5FF5
    "\u{F9A3}".freeze => "\u{5FF5}".freeze,

    # F9A4 CJK UNIFIED IDEOGRAPH F9A4
    # ->   637B CJK UNIFIED IDEOGRAPH 637B
    "\u{F9A4}".freeze => "\u{637B}".freeze,

    # F9A5 CJK UNIFIED IDEOGRAPH F9A5
    # ->   6BAE CJK UNIFIED IDEOGRAPH 6BAE
    "\u{F9A5}".freeze => "\u{6BAE}".freeze,

    # F9A6 CJK UNIFIED IDEOGRAPH F9A6
    # ->   7C3E CJK UNIFIED IDEOGRAPH 7C3E
    "\u{F9A6}".freeze => "\u{7C3E}".freeze,

    # F9A7 CJK UNIFIED IDEOGRAPH F9A7
    # ->   7375 CJK UNIFIED IDEOGRAPH 7375
    "\u{F9A7}".freeze => "\u{7375}".freeze,

    # F9A8 CJK UNIFIED IDEOGRAPH F9A8
    # ->   4EE4 CJK UNIFIED IDEOGRAPH 4EE4
    "\u{F9A8}".freeze => "\u{4EE4}".freeze,

    # F9A9 CJK UNIFIED IDEOGRAPH F9A9
    # ->   56F9 CJK UNIFIED IDEOGRAPH 56F9
    "\u{F9A9}".freeze => "\u{56F9}".freeze,

    # F9AA CJK UNIFIED IDEOGRAPH F9AA
    # ->   5BE7 CJK UNIFIED IDEOGRAPH 5BE7
    "\u{F9AA}".freeze => "\u{5BE7}".freeze,

    # F9AB CJK UNIFIED IDEOGRAPH F9AB
    # ->   5DBA CJK UNIFIED IDEOGRAPH 5DBA
    "\u{F9AB}".freeze => "\u{5DBA}".freeze,

    # F9AC CJK UNIFIED IDEOGRAPH F9AC
    # ->   601C CJK UNIFIED IDEOGRAPH 601C
    "\u{F9AC}".freeze => "\u{601C}".freeze,

    # F9AD CJK UNIFIED IDEOGRAPH F9AD
    # ->   73B2 CJK UNIFIED IDEOGRAPH 73B2
    "\u{F9AD}".freeze => "\u{73B2}".freeze,

    # F9AE CJK UNIFIED IDEOGRAPH F9AE
    # ->   7469 CJK UNIFIED IDEOGRAPH 7469
    "\u{F9AE}".freeze => "\u{7469}".freeze,

    # F9AF CJK UNIFIED IDEOGRAPH F9AF
    # ->   7F9A CJK UNIFIED IDEOGRAPH 7F9A
    "\u{F9AF}".freeze => "\u{7F9A}".freeze,

    # F9B0 CJK UNIFIED IDEOGRAPH F9B0
    # ->   8046 CJK UNIFIED IDEOGRAPH 8046
    "\u{F9B0}".freeze => "\u{8046}".freeze,

    # F9B1 CJK UNIFIED IDEOGRAPH F9B1
    # ->   9234 CJK UNIFIED IDEOGRAPH 9234
    "\u{F9B1}".freeze => "\u{9234}".freeze,

    # F9B2 CJK UNIFIED IDEOGRAPH F9B2
    # ->   96F6 CJK UNIFIED IDEOGRAPH 96F6
    "\u{F9B2}".freeze => "\u{96F6}".freeze,

    # F9B3 CJK UNIFIED IDEOGRAPH F9B3
    # ->   9748 CJK UNIFIED IDEOGRAPH 9748
    "\u{F9B3}".freeze => "\u{9748}".freeze,

    # F9B4 CJK UNIFIED IDEOGRAPH F9B4
    # ->   9818 CJK UNIFIED IDEOGRAPH 9818
    "\u{F9B4}".freeze => "\u{9818}".freeze,

    # F9B5 CJK UNIFIED IDEOGRAPH F9B5
    # ->   4F8B CJK UNIFIED IDEOGRAPH 4F8B
    "\u{F9B5}".freeze => "\u{4F8B}".freeze,

    # F9B6 CJK UNIFIED IDEOGRAPH F9B6
    # ->   79AE CJK UNIFIED IDEOGRAPH 79AE
    "\u{F9B6}".freeze => "\u{79AE}".freeze,

    # F9B7 CJK UNIFIED IDEOGRAPH F9B7
    # ->   91B4 CJK UNIFIED IDEOGRAPH 91B4
    "\u{F9B7}".freeze => "\u{91B4}".freeze,

    # F9B8 CJK UNIFIED IDEOGRAPH F9B8
    # ->   96B8 CJK UNIFIED IDEOGRAPH 96B8
    "\u{F9B8}".freeze => "\u{96B8}".freeze,

    # F9B9 CJK UNIFIED IDEOGRAPH F9B9
    # ->   60E1 CJK UNIFIED IDEOGRAPH 60E1
    "\u{F9B9}".freeze => "\u{60E1}".freeze,

    # F9BA CJK UNIFIED IDEOGRAPH F9BA
    # ->   4E86 CJK UNIFIED IDEOGRAPH 4E86
    "\u{F9BA}".freeze => "\u{4E86}".freeze,

    # F9BB CJK UNIFIED IDEOGRAPH F9BB
    # ->   50DA CJK UNIFIED IDEOGRAPH 50DA
    "\u{F9BB}".freeze => "\u{50DA}".freeze,

    # F9BC CJK UNIFIED IDEOGRAPH F9BC
    # ->   5BEE CJK UNIFIED IDEOGRAPH 5BEE
    "\u{F9BC}".freeze => "\u{5BEE}".freeze,

    # F9BD CJK UNIFIED IDEOGRAPH F9BD
    # ->   5C3F CJK UNIFIED IDEOGRAPH 5C3F
    "\u{F9BD}".freeze => "\u{5C3F}".freeze,

    # F9BE CJK UNIFIED IDEOGRAPH F9BE
    # ->   6599 CJK UNIFIED IDEOGRAPH 6599
    "\u{F9BE}".freeze => "\u{6599}".freeze,

    # F9BF CJK UNIFIED IDEOGRAPH F9BF
    # ->   6A02 CJK UNIFIED IDEOGRAPH 6A02
    "\u{F9BF}".freeze => "\u{6A02}".freeze,

    # F9C0 CJK UNIFIED IDEOGRAPH F9C0
    # ->   71CE CJK UNIFIED IDEOGRAPH 71CE
    "\u{F9C0}".freeze => "\u{71CE}".freeze,

    # F9C1 CJK UNIFIED IDEOGRAPH F9C1
    # ->   7642 CJK UNIFIED IDEOGRAPH 7642
    "\u{F9C1}".freeze => "\u{7642}".freeze,

    # F9C2 CJK UNIFIED IDEOGRAPH F9C2
    # ->   84FC CJK UNIFIED IDEOGRAPH 84FC
    "\u{F9C2}".freeze => "\u{84FC}".freeze,

    # F9C3 CJK UNIFIED IDEOGRAPH F9C3
    # ->   907C CJK UNIFIED IDEOGRAPH 907C
    "\u{F9C3}".freeze => "\u{907C}".freeze,

    # F9C4 CJK UNIFIED IDEOGRAPH F9C4
    # ->   9F8D CJK UNIFIED IDEOGRAPH 9F8D
    "\u{F9C4}".freeze => "\u{9F8D}".freeze,

    # F9C5 CJK UNIFIED IDEOGRAPH F9C5
    # ->   6688 CJK UNIFIED IDEOGRAPH 6688
    "\u{F9C5}".freeze => "\u{6688}".freeze,

    # F9C6 CJK UNIFIED IDEOGRAPH F9C6
    # ->   962E CJK UNIFIED IDEOGRAPH 962E
    "\u{F9C6}".freeze => "\u{962E}".freeze,

    # F9C7 CJK UNIFIED IDEOGRAPH F9C7
    # ->   5289 CJK UNIFIED IDEOGRAPH 5289
    "\u{F9C7}".freeze => "\u{5289}".freeze,

    # F9C8 CJK UNIFIED IDEOGRAPH F9C8
    # ->   677B CJK UNIFIED IDEOGRAPH 677B
    "\u{F9C8}".freeze => "\u{677B}".freeze,

    # F9C9 CJK UNIFIED IDEOGRAPH F9C9
    # ->   67F3 CJK UNIFIED IDEOGRAPH 67F3
    "\u{F9C9}".freeze => "\u{67F3}".freeze,

    # F9CA CJK UNIFIED IDEOGRAPH F9CA
    # ->   6D41 CJK UNIFIED IDEOGRAPH 6D41
    "\u{F9CA}".freeze => "\u{6D41}".freeze,

    # F9CB CJK UNIFIED IDEOGRAPH F9CB
    # ->   6E9C CJK UNIFIED IDEOGRAPH 6E9C
    "\u{F9CB}".freeze => "\u{6E9C}".freeze,

    # F9CC CJK UNIFIED IDEOGRAPH F9CC
    # ->   7409 CJK UNIFIED IDEOGRAPH 7409
    "\u{F9CC}".freeze => "\u{7409}".freeze,

    # F9CD CJK UNIFIED IDEOGRAPH F9CD
    # ->   7559 CJK UNIFIED IDEOGRAPH 7559
    "\u{F9CD}".freeze => "\u{7559}".freeze,

    # F9CE CJK UNIFIED IDEOGRAPH F9CE
    # ->   786B CJK UNIFIED IDEOGRAPH 786B
    "\u{F9CE}".freeze => "\u{786B}".freeze,

    # F9CF CJK UNIFIED IDEOGRAPH F9CF
    # ->   7D10 CJK UNIFIED IDEOGRAPH 7D10
    "\u{F9CF}".freeze => "\u{7D10}".freeze,

    # F9D0 CJK UNIFIED IDEOGRAPH F9D0
    # ->   985E CJK UNIFIED IDEOGRAPH 985E
    "\u{F9D0}".freeze => "\u{985E}".freeze,

    # F9D1 CJK UNIFIED IDEOGRAPH F9D1
    # ->   516D CJK UNIFIED IDEOGRAPH 516D
    "\u{F9D1}".freeze => "\u{516D}".freeze,

    # F9D2 CJK UNIFIED IDEOGRAPH F9D2
    # ->   622E CJK UNIFIED IDEOGRAPH 622E
    "\u{F9D2}".freeze => "\u{622E}".freeze,

    # F9D3 CJK UNIFIED IDEOGRAPH F9D3
    # ->   9678 CJK UNIFIED IDEOGRAPH 9678
    "\u{F9D3}".freeze => "\u{9678}".freeze,

    # F9D4 CJK UNIFIED IDEOGRAPH F9D4
    # ->   502B CJK UNIFIED IDEOGRAPH 502B
    "\u{F9D4}".freeze => "\u{502B}".freeze,

    # F9D5 CJK UNIFIED IDEOGRAPH F9D5
    # ->   5D19 CJK UNIFIED IDEOGRAPH 5D19
    "\u{F9D5}".freeze => "\u{5D19}".freeze,

    # F9D6 CJK UNIFIED IDEOGRAPH F9D6
    # ->   6DEA CJK UNIFIED IDEOGRAPH 6DEA
    "\u{F9D6}".freeze => "\u{6DEA}".freeze,

    # F9D7 CJK UNIFIED IDEOGRAPH F9D7
    # ->   8F2A CJK UNIFIED IDEOGRAPH 8F2A
    "\u{F9D7}".freeze => "\u{8F2A}".freeze,

    # F9D8 CJK UNIFIED IDEOGRAPH F9D8
    # ->   5F8B CJK UNIFIED IDEOGRAPH 5F8B
    "\u{F9D8}".freeze => "\u{5F8B}".freeze,

    # F9D9 CJK UNIFIED IDEOGRAPH F9D9
    # ->   6144 CJK UNIFIED IDEOGRAPH 6144
    "\u{F9D9}".freeze => "\u{6144}".freeze,

    # F9DA CJK UNIFIED IDEOGRAPH F9DA
    # ->   6817 CJK UNIFIED IDEOGRAPH 6817
    "\u{F9DA}".freeze => "\u{6817}".freeze,

    # F9DB CJK UNIFIED IDEOGRAPH F9DB
    # ->   7387 CJK UNIFIED IDEOGRAPH 7387
    "\u{F9DB}".freeze => "\u{7387}".freeze,

    # F9DC CJK UNIFIED IDEOGRAPH F9DC
    # ->   9686 CJK UNIFIED IDEOGRAPH 9686
    "\u{F9DC}".freeze => "\u{9686}".freeze,

    # F9DD CJK UNIFIED IDEOGRAPH F9DD
    # ->   5229 CJK UNIFIED IDEOGRAPH 5229
    "\u{F9DD}".freeze => "\u{5229}".freeze,

    # F9DE CJK UNIFIED IDEOGRAPH F9DE
    # ->   540F CJK UNIFIED IDEOGRAPH 540F
    "\u{F9DE}".freeze => "\u{540F}".freeze,

    # F9DF CJK UNIFIED IDEOGRAPH F9DF
    # ->   5C65 CJK UNIFIED IDEOGRAPH 5C65
    "\u{F9DF}".freeze => "\u{5C65}".freeze,

    # F9E0 CJK UNIFIED IDEOGRAPH F9E0
    # ->   6613 CJK UNIFIED IDEOGRAPH 6613
    "\u{F9E0}".freeze => "\u{6613}".freeze,

    # F9E1 CJK UNIFIED IDEOGRAPH F9E1
    # ->   674E CJK UNIFIED IDEOGRAPH 674E
    "\u{F9E1}".freeze => "\u{674E}".freeze,

    # F9E2 CJK UNIFIED IDEOGRAPH F9E2
    # ->   68A8 CJK UNIFIED IDEOGRAPH 68A8
    "\u{F9E2}".freeze => "\u{68A8}".freeze,

    # F9E3 CJK UNIFIED IDEOGRAPH F9E3
    # ->   6CE5 CJK UNIFIED IDEOGRAPH 6CE5
    "\u{F9E3}".freeze => "\u{6CE5}".freeze,

    # F9E4 CJK UNIFIED IDEOGRAPH F9E4
    # ->   7406 CJK UNIFIED IDEOGRAPH 7406
    "\u{F9E4}".freeze => "\u{7406}".freeze,

    # F9E5 CJK UNIFIED IDEOGRAPH F9E5
    # ->   75E2 CJK UNIFIED IDEOGRAPH 75E2
    "\u{F9E5}".freeze => "\u{75E2}".freeze,

    # F9E6 CJK UNIFIED IDEOGRAPH F9E6
    # ->   7F79 CJK UNIFIED IDEOGRAPH 7F79
    "\u{F9E6}".freeze => "\u{7F79}".freeze,

    # F9E7 CJK UNIFIED IDEOGRAPH F9E7
    # ->   88CF CJK UNIFIED IDEOGRAPH 88CF
    "\u{F9E7}".freeze => "\u{88CF}".freeze,

    # F9E8 CJK UNIFIED IDEOGRAPH F9E8
    # ->   88E1 CJK UNIFIED IDEOGRAPH 88E1
    "\u{F9E8}".freeze => "\u{88E1}".freeze,

    # F9E9 CJK UNIFIED IDEOGRAPH F9E9
    # ->   91CC CJK UNIFIED IDEOGRAPH 91CC
    "\u{F9E9}".freeze => "\u{91CC}".freeze,

    # F9EA CJK UNIFIED IDEOGRAPH F9EA
    # ->   96E2 CJK UNIFIED IDEOGRAPH 96E2
    "\u{F9EA}".freeze => "\u{96E2}".freeze,

    # F9EB CJK UNIFIED IDEOGRAPH F9EB
    # ->   533F CJK UNIFIED IDEOGRAPH 533F
    "\u{F9EB}".freeze => "\u{533F}".freeze,

    # F9EC CJK UNIFIED IDEOGRAPH F9EC
    # ->   6EBA CJK UNIFIED IDEOGRAPH 6EBA
    "\u{F9EC}".freeze => "\u{6EBA}".freeze,

    # F9ED CJK UNIFIED IDEOGRAPH F9ED
    # ->   541D CJK UNIFIED IDEOGRAPH 541D
    "\u{F9ED}".freeze => "\u{541D}".freeze,

    # F9EE CJK UNIFIED IDEOGRAPH F9EE
    # ->   71D0 CJK UNIFIED IDEOGRAPH 71D0
    "\u{F9EE}".freeze => "\u{71D0}".freeze,

    # F9EF CJK UNIFIED IDEOGRAPH F9EF
    # ->   7498 CJK UNIFIED IDEOGRAPH 7498
    "\u{F9EF}".freeze => "\u{7498}".freeze,

    # F9F0 CJK UNIFIED IDEOGRAPH F9F0
    # ->   85FA CJK UNIFIED IDEOGRAPH 85FA
    "\u{F9F0}".freeze => "\u{85FA}".freeze,

    # F9F1 CJK UNIFIED IDEOGRAPH F9F1
    # ->   96A3 CJK UNIFIED IDEOGRAPH 96A3
    "\u{F9F1}".freeze => "\u{96A3}".freeze,

    # F9F2 CJK UNIFIED IDEOGRAPH F9F2
    # ->   9C57 CJK UNIFIED IDEOGRAPH 9C57
    "\u{F9F2}".freeze => "\u{9C57}".freeze,

    # F9F3 CJK UNIFIED IDEOGRAPH F9F3
    # ->   9E9F CJK UNIFIED IDEOGRAPH 9E9F
    "\u{F9F3}".freeze => "\u{9E9F}".freeze,

    # F9F4 CJK UNIFIED IDEOGRAPH F9F4
    # ->   6797 CJK UNIFIED IDEOGRAPH 6797
    "\u{F9F4}".freeze => "\u{6797}".freeze,

    # F9F5 CJK UNIFIED IDEOGRAPH F9F5
    # ->   6DCB CJK UNIFIED IDEOGRAPH 6DCB
    "\u{F9F5}".freeze => "\u{6DCB}".freeze,

    # F9F6 CJK UNIFIED IDEOGRAPH F9F6
    # ->   81E8 CJK UNIFIED IDEOGRAPH 81E8
    "\u{F9F6}".freeze => "\u{81E8}".freeze,

    # F9F7 CJK UNIFIED IDEOGRAPH F9F7
    # ->   7ACB CJK UNIFIED IDEOGRAPH 7ACB
    "\u{F9F7}".freeze => "\u{7ACB}".freeze,

    # F9F8 CJK UNIFIED IDEOGRAPH F9F8
    # ->   7B20 CJK UNIFIED IDEOGRAPH 7B20
    "\u{F9F8}".freeze => "\u{7B20}".freeze,

    # F9F9 CJK UNIFIED IDEOGRAPH F9F9
    # ->   7C92 CJK UNIFIED IDEOGRAPH 7C92
    "\u{F9F9}".freeze => "\u{7C92}".freeze,

    # F9FA CJK UNIFIED IDEOGRAPH F9FA
    # ->   72C0 CJK UNIFIED IDEOGRAPH 72C0
    "\u{F9FA}".freeze => "\u{72C0}".freeze,

    # F9FB CJK UNIFIED IDEOGRAPH F9FB
    # ->   7099 CJK UNIFIED IDEOGRAPH 7099
    "\u{F9FB}".freeze => "\u{7099}".freeze,

    # F9FC CJK UNIFIED IDEOGRAPH F9FC
    # ->   8B58 CJK UNIFIED IDEOGRAPH 8B58
    "\u{F9FC}".freeze => "\u{8B58}".freeze,

    # F9FD CJK UNIFIED IDEOGRAPH F9FD
    # ->   4EC0 CJK UNIFIED IDEOGRAPH 4EC0
    "\u{F9FD}".freeze => "\u{4EC0}".freeze,

    # F9FE CJK UNIFIED IDEOGRAPH F9FE
    # ->   8336 CJK UNIFIED IDEOGRAPH 8336
    "\u{F9FE}".freeze => "\u{8336}".freeze,

    # F9FF CJK UNIFIED IDEOGRAPH F9FF
    # ->   523A CJK UNIFIED IDEOGRAPH 523A
    "\u{F9FF}".freeze => "\u{523A}".freeze,

    # FA00 CJK UNIFIED IDEOGRAPH FA00
    # ->   5207 CJK UNIFIED IDEOGRAPH 5207
    "\u{FA00}".freeze => "\u{5207}".freeze,

    # FA01 CJK UNIFIED IDEOGRAPH FA01
    # ->   5EA6 CJK UNIFIED IDEOGRAPH 5EA6
    "\u{FA01}".freeze => "\u{5EA6}".freeze,

    # FA02 CJK UNIFIED IDEOGRAPH FA02
    # ->   62D3 CJK UNIFIED IDEOGRAPH 62D3
    "\u{FA02}".freeze => "\u{62D3}".freeze,

    # FA03 CJK UNIFIED IDEOGRAPH FA03
    # ->   7CD6 CJK UNIFIED IDEOGRAPH 7CD6
    "\u{FA03}".freeze => "\u{7CD6}".freeze,

    # FA04 CJK UNIFIED IDEOGRAPH FA04
    # ->   5B85 CJK UNIFIED IDEOGRAPH 5B85
    "\u{FA04}".freeze => "\u{5B85}".freeze,

    # FA05 CJK UNIFIED IDEOGRAPH FA05
    # ->   6D1E CJK UNIFIED IDEOGRAPH 6D1E
    "\u{FA05}".freeze => "\u{6D1E}".freeze,

    # FA06 CJK UNIFIED IDEOGRAPH FA06
    # ->   66B4 CJK UNIFIED IDEOGRAPH 66B4
    "\u{FA06}".freeze => "\u{66B4}".freeze,

    # FA07 CJK UNIFIED IDEOGRAPH FA07
    # ->   8F3B CJK UNIFIED IDEOGRAPH 8F3B
    "\u{FA07}".freeze => "\u{8F3B}".freeze,

    # FA08 CJK UNIFIED IDEOGRAPH FA08
    # ->   884C CJK UNIFIED IDEOGRAPH 884C
    "\u{FA08}".freeze => "\u{884C}".freeze,

    # FA09 CJK UNIFIED IDEOGRAPH FA09
    # ->   964D CJK UNIFIED IDEOGRAPH 964D
    "\u{FA09}".freeze => "\u{964D}".freeze,

    # FA0A CJK UNIFIED IDEOGRAPH FA0A
    # ->   898B CJK UNIFIED IDEOGRAPH 898B
    "\u{FA0A}".freeze => "\u{898B}".freeze,

    # FA0B CJK UNIFIED IDEOGRAPH FA0B
    # ->   5ED3 CJK UNIFIED IDEOGRAPH 5ED3
    "\u{FA0B}".freeze => "\u{5ED3}".freeze,

    # FA0C CJK UNIFIED IDEOGRAPH FA0C
    # ->   5140 CJK UNIFIED IDEOGRAPH 5140
    "\u{FA0C}".freeze => "\u{5140}".freeze,

    # FA0D CJK UNIFIED IDEOGRAPH FA0D
    # ->   55C0 CJK UNIFIED IDEOGRAPH 55C0
    "\u{FA0D}".freeze => "\u{55C0}".freeze,

    # FA10 CJK UNIFIED IDEOGRAPH FA10
    # ->   585A CJK UNIFIED IDEOGRAPH 585A
    "\u{FA10}".freeze => "\u{585A}".freeze,

    # FA12 CJK UNIFIED IDEOGRAPH FA12
    # ->   6674 CJK UNIFIED IDEOGRAPH 6674
    "\u{FA12}".freeze => "\u{6674}".freeze,

    # FA15 CJK UNIFIED IDEOGRAPH FA15
    # ->   51DE CJK UNIFIED IDEOGRAPH 51DE
    "\u{FA15}".freeze => "\u{51DE}".freeze,

    # FA16 CJK UNIFIED IDEOGRAPH FA16
    # ->   732A CJK UNIFIED IDEOGRAPH 732A
    "\u{FA16}".freeze => "\u{732A}".freeze,

    # FA17 CJK UNIFIED IDEOGRAPH FA17
    # ->   76CA CJK UNIFIED IDEOGRAPH 76CA
    "\u{FA17}".freeze => "\u{76CA}".freeze,

    # FA18 CJK UNIFIED IDEOGRAPH FA18
    # ->   793C CJK UNIFIED IDEOGRAPH 793C
    "\u{FA18}".freeze => "\u{793C}".freeze,

    # FA19 CJK UNIFIED IDEOGRAPH FA19
    # ->   795E CJK UNIFIED IDEOGRAPH 795E
    "\u{FA19}".freeze => "\u{795E}".freeze,

    # FA1A CJK UNIFIED IDEOGRAPH FA1A
    # ->   7965 CJK UNIFIED IDEOGRAPH 7965
    "\u{FA1A}".freeze => "\u{7965}".freeze,

    # FA1B CJK UNIFIED IDEOGRAPH FA1B
    # ->   798F CJK UNIFIED IDEOGRAPH 798F
    "\u{FA1B}".freeze => "\u{798F}".freeze,

    # FA1C CJK UNIFIED IDEOGRAPH FA1C
    # ->   9756 CJK UNIFIED IDEOGRAPH 9756
    "\u{FA1C}".freeze => "\u{9756}".freeze,

    # FA1D CJK UNIFIED IDEOGRAPH FA1D
    # ->   7CBE CJK UNIFIED IDEOGRAPH 7CBE
    "\u{FA1D}".freeze => "\u{7CBE}".freeze,

    # FA1E CJK UNIFIED IDEOGRAPH FA1E
    # ->   7FBD CJK UNIFIED IDEOGRAPH 7FBD
    "\u{FA1E}".freeze => "\u{7FBD}".freeze,

    # FA20 CJK UNIFIED IDEOGRAPH FA20
    # ->   8612 CJK UNIFIED IDEOGRAPH 8612
    "\u{FA20}".freeze => "\u{8612}".freeze,

    # FA22 CJK UNIFIED IDEOGRAPH FA22
    # ->   8AF8 CJK UNIFIED IDEOGRAPH 8AF8
    "\u{FA22}".freeze => "\u{8AF8}".freeze,

    # FA25 CJK UNIFIED IDEOGRAPH FA25
    # ->   9038 CJK UNIFIED IDEOGRAPH 9038
    "\u{FA25}".freeze => "\u{9038}".freeze,

    # FA26 CJK UNIFIED IDEOGRAPH FA26
    # ->   90FD CJK UNIFIED IDEOGRAPH 90FD
    "\u{FA26}".freeze => "\u{90FD}".freeze,

    # FA2A CJK UNIFIED IDEOGRAPH FA2A
    # ->   98EF CJK UNIFIED IDEOGRAPH 98EF
    "\u{FA2A}".freeze => "\u{98EF}".freeze,

    # FA2B CJK UNIFIED IDEOGRAPH FA2B
    # ->   98FC CJK UNIFIED IDEOGRAPH 98FC
    "\u{FA2B}".freeze => "\u{98FC}".freeze,

    # FA2C CJK UNIFIED IDEOGRAPH FA2C
    # ->   9928 CJK UNIFIED IDEOGRAPH 9928
    "\u{FA2C}".freeze => "\u{9928}".freeze,

    # FA2D CJK UNIFIED IDEOGRAPH FA2D
    # ->   9DB4 CJK UNIFIED IDEOGRAPH 9DB4
    "\u{FA2D}".freeze => "\u{9DB4}".freeze,

    # FA30 CJK UNIFIED IDEOGRAPH FA30
    # ->   4FAE CJK UNIFIED IDEOGRAPH 4FAE
    "\u{FA30}".freeze => "\u{4FAE}".freeze,

    # FA31 CJK UNIFIED IDEOGRAPH FA31
    # ->   50E7 CJK UNIFIED IDEOGRAPH 50E7
    "\u{FA31}".freeze => "\u{50E7}".freeze,

    # FA32 CJK UNIFIED IDEOGRAPH FA32
    # ->   514D CJK UNIFIED IDEOGRAPH 514D
    "\u{FA32}".freeze => "\u{514D}".freeze,

    # FA33 CJK UNIFIED IDEOGRAPH FA33
    # ->   52C9 CJK UNIFIED IDEOGRAPH 52C9
    "\u{FA33}".freeze => "\u{52C9}".freeze,

    # FA34 CJK UNIFIED IDEOGRAPH FA34
    # ->   52E4 CJK UNIFIED IDEOGRAPH 52E4
    "\u{FA34}".freeze => "\u{52E4}".freeze,

    # FA35 CJK UNIFIED IDEOGRAPH FA35
    # ->   5351 CJK UNIFIED IDEOGRAPH 5351
    "\u{FA35}".freeze => "\u{5351}".freeze,

    # FA36 CJK UNIFIED IDEOGRAPH FA36
    # ->   559D CJK UNIFIED IDEOGRAPH 559D
    "\u{FA36}".freeze => "\u{559D}".freeze,

    # FA37 CJK UNIFIED IDEOGRAPH FA37
    # ->   5606 CJK UNIFIED IDEOGRAPH 5606
    "\u{FA37}".freeze => "\u{5606}".freeze,

    # FA38 CJK UNIFIED IDEOGRAPH FA38
    # ->   5668 CJK UNIFIED IDEOGRAPH 5668
    "\u{FA38}".freeze => "\u{5668}".freeze,

    # FA39 CJK UNIFIED IDEOGRAPH FA39
    # ->   5840 CJK UNIFIED IDEOGRAPH 5840
    "\u{FA39}".freeze => "\u{5840}".freeze,

    # FA3A CJK UNIFIED IDEOGRAPH FA3A
    # ->   58A8 CJK UNIFIED IDEOGRAPH 58A8
    "\u{FA3A}".freeze => "\u{58A8}".freeze,

    # FA3B CJK UNIFIED IDEOGRAPH FA3B
    # ->   5C64 CJK UNIFIED IDEOGRAPH 5C64
    "\u{FA3B}".freeze => "\u{5C64}".freeze,

    # FA3C CJK UNIFIED IDEOGRAPH FA3C
    # ->   5C6E CJK UNIFIED IDEOGRAPH 5C6E
    "\u{FA3C}".freeze => "\u{5C6E}".freeze,

    # FA3D CJK UNIFIED IDEOGRAPH FA3D
    # ->   6094 CJK UNIFIED IDEOGRAPH 6094
    "\u{FA3D}".freeze => "\u{6094}".freeze,

    # FA3E CJK UNIFIED IDEOGRAPH FA3E
    # ->   6168 CJK UNIFIED IDEOGRAPH 6168
    "\u{FA3E}".freeze => "\u{6168}".freeze,

    # FA3F CJK UNIFIED IDEOGRAPH FA3F
    # ->   618E CJK UNIFIED IDEOGRAPH 618E
    "\u{FA3F}".freeze => "\u{618E}".freeze,

    # FA40 CJK UNIFIED IDEOGRAPH FA40
    # ->   61F2 CJK UNIFIED IDEOGRAPH 61F2
    "\u{FA40}".freeze => "\u{61F2}".freeze,

    # FA41 CJK UNIFIED IDEOGRAPH FA41
    # ->   654F CJK UNIFIED IDEOGRAPH 654F
    "\u{FA41}".freeze => "\u{654F}".freeze,

    # FA42 CJK UNIFIED IDEOGRAPH FA42
    # ->   65E2 CJK UNIFIED IDEOGRAPH 65E2
    "\u{FA42}".freeze => "\u{65E2}".freeze,

    # FA43 CJK UNIFIED IDEOGRAPH FA43
    # ->   6691 CJK UNIFIED IDEOGRAPH 6691
    "\u{FA43}".freeze => "\u{6691}".freeze,

    # FA44 CJK UNIFIED IDEOGRAPH FA44
    # ->   6885 CJK UNIFIED IDEOGRAPH 6885
    "\u{FA44}".freeze => "\u{6885}".freeze,

    # FA45 CJK UNIFIED IDEOGRAPH FA45
    # ->   6D77 CJK UNIFIED IDEOGRAPH 6D77
    "\u{FA45}".freeze => "\u{6D77}".freeze,

    # FA46 CJK UNIFIED IDEOGRAPH FA46
    # ->   6E1A CJK UNIFIED IDEOGRAPH 6E1A
    "\u{FA46}".freeze => "\u{6E1A}".freeze,

    # FA47 CJK UNIFIED IDEOGRAPH FA47
    # ->   6F22 CJK UNIFIED IDEOGRAPH 6F22
    "\u{FA47}".freeze => "\u{6F22}".freeze,

    # FA48 CJK UNIFIED IDEOGRAPH FA48
    # ->   716E CJK UNIFIED IDEOGRAPH 716E
    "\u{FA48}".freeze => "\u{716E}".freeze,

    # FA49 CJK UNIFIED IDEOGRAPH FA49
    # ->   722B CJK UNIFIED IDEOGRAPH 722B
    "\u{FA49}".freeze => "\u{722B}".freeze,

    # FA4A CJK UNIFIED IDEOGRAPH FA4A
    # ->   7422 CJK UNIFIED IDEOGRAPH 7422
    "\u{FA4A}".freeze => "\u{7422}".freeze,

    # FA4B CJK UNIFIED IDEOGRAPH FA4B
    # ->   7891 CJK UNIFIED IDEOGRAPH 7891
    "\u{FA4B}".freeze => "\u{7891}".freeze,

    # FA4C CJK UNIFIED IDEOGRAPH FA4C
    # ->   793E CJK UNIFIED IDEOGRAPH 793E
    "\u{FA4C}".freeze => "\u{793E}".freeze,

    # FA4D CJK UNIFIED IDEOGRAPH FA4D
    # ->   7949 CJK UNIFIED IDEOGRAPH 7949
    "\u{FA4D}".freeze => "\u{7949}".freeze,

    # FA4E CJK UNIFIED IDEOGRAPH FA4E
    # ->   7948 CJK UNIFIED IDEOGRAPH 7948
    "\u{FA4E}".freeze => "\u{7948}".freeze,

    # FA4F CJK UNIFIED IDEOGRAPH FA4F
    # ->   7950 CJK UNIFIED IDEOGRAPH 7950
    "\u{FA4F}".freeze => "\u{7950}".freeze,

    # FA50 CJK UNIFIED IDEOGRAPH FA50
    # ->   7956 CJK UNIFIED IDEOGRAPH 7956
    "\u{FA50}".freeze => "\u{7956}".freeze,

    # FA51 CJK UNIFIED IDEOGRAPH FA51
    # ->   795D CJK UNIFIED IDEOGRAPH 795D
    "\u{FA51}".freeze => "\u{795D}".freeze,

    # FA52 CJK UNIFIED IDEOGRAPH FA52
    # ->   798D CJK UNIFIED IDEOGRAPH 798D
    "\u{FA52}".freeze => "\u{798D}".freeze,

    # FA53 CJK UNIFIED IDEOGRAPH FA53
    # ->   798E CJK UNIFIED IDEOGRAPH 798E
    "\u{FA53}".freeze => "\u{798E}".freeze,

    # FA54 CJK UNIFIED IDEOGRAPH FA54
    # ->   7A40 CJK UNIFIED IDEOGRAPH 7A40
    "\u{FA54}".freeze => "\u{7A40}".freeze,

    # FA55 CJK UNIFIED IDEOGRAPH FA55
    # ->   7A81 CJK UNIFIED IDEOGRAPH 7A81
    "\u{FA55}".freeze => "\u{7A81}".freeze,

    # FA56 CJK UNIFIED IDEOGRAPH FA56
    # ->   7BC0 CJK UNIFIED IDEOGRAPH 7BC0
    "\u{FA56}".freeze => "\u{7BC0}".freeze,

    # FA57 CJK UNIFIED IDEOGRAPH FA57
    # ->   7DF4 CJK UNIFIED IDEOGRAPH 7DF4
    "\u{FA57}".freeze => "\u{7DF4}".freeze,

    # FA58 CJK UNIFIED IDEOGRAPH FA58
    # ->   7E09 CJK UNIFIED IDEOGRAPH 7E09
    "\u{FA58}".freeze => "\u{7E09}".freeze,

    # FA59 CJK UNIFIED IDEOGRAPH FA59
    # ->   7E41 CJK UNIFIED IDEOGRAPH 7E41
    "\u{FA59}".freeze => "\u{7E41}".freeze,

    # FA5A CJK UNIFIED IDEOGRAPH FA5A
    # ->   7F72 CJK UNIFIED IDEOGRAPH 7F72
    "\u{FA5A}".freeze => "\u{7F72}".freeze,

    # FA5B CJK UNIFIED IDEOGRAPH FA5B
    # ->   8005 CJK UNIFIED IDEOGRAPH 8005
    "\u{FA5B}".freeze => "\u{8005}".freeze,

    # FA5C CJK UNIFIED IDEOGRAPH FA5C
    # ->   81ED CJK UNIFIED IDEOGRAPH 81ED
    "\u{FA5C}".freeze => "\u{81ED}".freeze,

    # FA5D CJK UNIFIED IDEOGRAPH FA5D
    # ->   8279 CJK UNIFIED IDEOGRAPH 8279
    "\u{FA5D}".freeze => "\u{8279}".freeze,

    # FA5E CJK UNIFIED IDEOGRAPH FA5E
    # ->   8279 CJK UNIFIED IDEOGRAPH 8279
    "\u{FA5E}".freeze => "\u{8279}".freeze,

    # FA5F CJK UNIFIED IDEOGRAPH FA5F
    # ->   8457 CJK UNIFIED IDEOGRAPH 8457
    "\u{FA5F}".freeze => "\u{8457}".freeze,

    # FA60 CJK UNIFIED IDEOGRAPH FA60
    # ->   8910 CJK UNIFIED IDEOGRAPH 8910
    "\u{FA60}".freeze => "\u{8910}".freeze,

    # FA61 CJK UNIFIED IDEOGRAPH FA61
    # ->   8996 CJK UNIFIED IDEOGRAPH 8996
    "\u{FA61}".freeze => "\u{8996}".freeze,

    # FA62 CJK UNIFIED IDEOGRAPH FA62
    # ->   8B01 CJK UNIFIED IDEOGRAPH 8B01
    "\u{FA62}".freeze => "\u{8B01}".freeze,

    # FA63 CJK UNIFIED IDEOGRAPH FA63
    # ->   8B39 CJK UNIFIED IDEOGRAPH 8B39
    "\u{FA63}".freeze => "\u{8B39}".freeze,

    # FA64 CJK UNIFIED IDEOGRAPH FA64
    # ->   8CD3 CJK UNIFIED IDEOGRAPH 8CD3
    "\u{FA64}".freeze => "\u{8CD3}".freeze,

    # FA65 CJK UNIFIED IDEOGRAPH FA65
    # ->   8D08 CJK UNIFIED IDEOGRAPH 8D08
    "\u{FA65}".freeze => "\u{8D08}".freeze,

    # FA66 CJK UNIFIED IDEOGRAPH FA66
    # ->   8FB6 CJK UNIFIED IDEOGRAPH 8FB6
    "\u{FA66}".freeze => "\u{8FB6}".freeze,

    # FA67 CJK UNIFIED IDEOGRAPH FA67
    # ->   9038 CJK UNIFIED IDEOGRAPH 9038
    "\u{FA67}".freeze => "\u{9038}".freeze,

    # FA68 CJK UNIFIED IDEOGRAPH FA68
    # ->   96E3 CJK UNIFIED IDEOGRAPH 96E3
    "\u{FA68}".freeze => "\u{96E3}".freeze,

    # FA69 CJK UNIFIED IDEOGRAPH FA69
    # ->   97FF CJK UNIFIED IDEOGRAPH 97FF
    "\u{FA69}".freeze => "\u{97FF}".freeze,

    # FA6A CJK UNIFIED IDEOGRAPH FA6A
    # ->   983B CJK UNIFIED IDEOGRAPH 983B
    "\u{FA6A}".freeze => "\u{983B}".freeze,

    # FB00 LATIN SMALL LIGATURE FF
    # ->   0066 LATIN SMALL LETTER F
    #    + 0066 LATIN SMALL LETTER F
    "\u{FB00}".freeze => 'ff'.freeze,

    # FB01 LATIN SMALL LIGATURE FI
    # ->   0066 LATIN SMALL LETTER F
    #    + 0069 LATIN SMALL LETTER I
    "\u{FB01}".freeze => 'fi'.freeze,

    # FB02 LATIN SMALL LIGATURE FL
    # ->   0066 LATIN SMALL LETTER F
    #    + 006C LATIN SMALL LETTER L
    "\u{FB02}".freeze => 'fl'.freeze,

    # FB03 LATIN SMALL LIGATURE FFI
    # ->   0066 LATIN SMALL LETTER F
    #    + 0066 LATIN SMALL LETTER F
    #    + 0069 LATIN SMALL LETTER I
    "\u{FB03}".freeze => 'ffi'.freeze,

    # FB04 LATIN SMALL LIGATURE FFL
    # ->   0066 LATIN SMALL LETTER F
    #    + 0066 LATIN SMALL LETTER F
    #    + 006C LATIN SMALL LETTER L
    "\u{FB04}".freeze => 'ffl'.freeze,

    # FB05 LATIN SMALL LIGATURE LONG S T
    # ->   0074 LATIN SMALL LETTER T
    #    + 0073 LATIN SMALL LETTER S
    "\u{FB05}".freeze => 'ts'.freeze,

    # FB06 LATIN SMALL LIGATURE ST
    # ->   0073 LATIN SMALL LETTER S
    #    + 0074 LATIN SMALL LETTER T
    "\u{FB06}".freeze => 'st'.freeze,

    # FB13 ARMENIAN SMALL LIGATURE MEN NOW
    # ->   0574 ARMENIAN SMALL LETTER MEN
    #    + 0576 ARMENIAN SMALL LETTER NOW
    "\u{FB13}".freeze => "\u{0574}\u{0576}".freeze,

    # FB14 ARMENIAN SMALL LIGATURE MEN ECH
    # ->   0574 ARMENIAN SMALL LETTER MEN
    #    + 0565 ARMENIAN SMALL LETTER ECH
    "\u{FB14}".freeze => "\u{0574}\u{0565}".freeze,

    # FB15 ARMENIAN SMALL LIGATURE MEN INI
    # ->   0574 ARMENIAN SMALL LETTER MEN
    #    + 056B ARMENIAN SMALL LETTER INI
    "\u{FB15}".freeze => "\u{0574}\u{056B}".freeze,

    # FB16 ARMENIAN SMALL LIGATURE VEW NOW
    # ->   057E ARMENIAN SMALL LETTER VEW
    #    + 0576 ARMENIAN SMALL LETTER NOW
    "\u{FB16}".freeze => "\u{057E}\u{0576}".freeze,

    # FB17 ARMENIAN SMALL LIGATURE MEN XEH
    # ->   0574 ARMENIAN SMALL LETTER MEN
    #    + 056D ARMENIAN SMALL LETTER XEH
    "\u{FB17}".freeze => "\u{0574}\u{056D}".freeze,

    # FB1D HEBREW LETTER YOD WITH HIRIQ
    # ->   05D9 HEBREW LETTER YOD
    "\u{FB1D}".freeze => "\u{05D9}".freeze,

    # FB1F HEBREW LIGATURE YIDDISH YOD YOD PATAH
    # ->   05F2 HEBREW LIGATURE YIDDISH DOUBLE YOD
    "\u{FB1F}".freeze => "\u{05F2}".freeze,

    # FB20 HEBREW LETTER ALTERNATIVE AYIN
    # ->   05E2 HEBREW LETTER AYIN
    "\u{FB20}".freeze => "\u{05E2}".freeze,

    # FB21 HEBREW LETTER WIDE ALEF
    # ->   05D0 HEBREW LETTER ALEF
    "\u{FB21}".freeze => "\u{05D0}".freeze,

    # FB22 HEBREW LETTER WIDE DALET
    # ->   05D3 HEBREW LETTER DALET
    "\u{FB22}".freeze => "\u{05D3}".freeze,

    # FB23 HEBREW LETTER WIDE HE
    # ->   05D4 HEBREW LETTER HE
    "\u{FB23}".freeze => "\u{05D4}".freeze,

    # FB24 HEBREW LETTER WIDE KAF
    # ->   05DB HEBREW LETTER KAF
    "\u{FB24}".freeze => "\u{05DB}".freeze,

    # FB25 HEBREW LETTER WIDE LAMED
    # ->   05DC HEBREW LETTER LAMED
    "\u{FB25}".freeze => "\u{05DC}".freeze,

    # FB26 HEBREW LETTER WIDE FINAL MEM
    # ->   05DD HEBREW LETTER FINAL MEM
    "\u{FB26}".freeze => "\u{05DD}".freeze,

    # FB27 HEBREW LETTER WIDE RESH
    # ->   05E8 HEBREW LETTER RESH
    "\u{FB27}".freeze => "\u{05E8}".freeze,

    # FB28 HEBREW LETTER WIDE TAV
    # ->   05EA HEBREW LETTER TAV
    "\u{FB28}".freeze => "\u{05EA}".freeze,

    # FB29 HEBREW LETTER ALTERNATIVE PLUS SIGN
    # ->   002B PLUS SIGN
    "\u{FB29}".freeze => '+'.freeze,

    # FB2A HEBREW LETTER SHIN WITH SHIN DOT
    # ->   05E9 HEBREW LETTER SHIN
    "\u{FB2A}".freeze => "\u{05E9}".freeze,

    # FB2B HEBREW LETTER SHIN WITH SIN DOT
    # ->   05E9 HEBREW LETTER SHIN
    "\u{FB2B}".freeze => "\u{05E9}".freeze,

    # FB2C HEBREW LETTER SHIN WITH DAGESH AND SHIN DOT
    # ->   05E9 HEBREW LETTER SHIN
    "\u{FB2C}".freeze => "\u{05E9}".freeze,

    # FB2D HEBREW LETTER SHIN WITH DAGESH AND SIN DOT
    # ->   05E9 HEBREW LETTER SHIN
    "\u{FB2D}".freeze => "\u{05E9}".freeze,

    # FB2E HEBREW LETTER ALEF WITH PATAH
    # ->   05D0 HEBREW LETTER ALEF
    "\u{FB2E}".freeze => "\u{05D0}".freeze,

    # FB2F HEBREW LETTER ALEF WITH QAMATS
    # ->   05D0 HEBREW LETTER ALEF
    "\u{FB2F}".freeze => "\u{05D0}".freeze,

    # FB30 HEBREW LETTER ALEF WITH MAPIQ
    # ->   05D0 HEBREW LETTER ALEF
    "\u{FB30}".freeze => "\u{05D0}".freeze,

    # FB31 HEBREW LETTER BET WITH DAGESH
    # ->   05D1 HEBREW LETTER BET
    "\u{FB31}".freeze => "\u{05D1}".freeze,

    # FB32 HEBREW LETTER GIMEL WITH DAGESH
    # ->   05D2 HEBREW LETTER GIMEL
    "\u{FB32}".freeze => "\u{05D2}".freeze,

    # FB33 HEBREW LETTER DALET WITH DAGESH
    # ->   05D3 HEBREW LETTER DALET
    "\u{FB33}".freeze => "\u{05D3}".freeze,

    # FB34 HEBREW LETTER HE WITH MAPIQ
    # ->   05D4 HEBREW LETTER HE
    "\u{FB34}".freeze => "\u{05D4}".freeze,

    # FB35 HEBREW LETTER VAV WITH DAGESH
    # ->   05D5 HEBREW LETTER VAV
    "\u{FB35}".freeze => "\u{05D5}".freeze,

    # FB36 HEBREW LETTER ZAYIN WITH DAGESH
    # ->   05D6 HEBREW LETTER ZAYIN
    "\u{FB36}".freeze => "\u{05D6}".freeze,

    # FB38 HEBREW LETTER TET WITH DAGESH
    # ->   05D8 HEBREW LETTER TET
    "\u{FB38}".freeze => "\u{05D8}".freeze,

    # FB39 HEBREW LETTER YOD WITH DAGESH
    # ->   05D9 HEBREW LETTER YOD
    "\u{FB39}".freeze => "\u{05D9}".freeze,

    # FB3A HEBREW LETTER FINAL KAF WITH DAGESH
    # ->   05DA HEBREW LETTER FINAL KAF
    "\u{FB3A}".freeze => "\u{05DA}".freeze,

    # FB3B HEBREW LETTER KAF WITH DAGESH
    # ->   05DB HEBREW LETTER KAF
    "\u{FB3B}".freeze => "\u{05DB}".freeze,

    # FB3C HEBREW LETTER LAMED WITH DAGESH
    # ->   05DC HEBREW LETTER LAMED
    "\u{FB3C}".freeze => "\u{05DC}".freeze,

    # FB3E HEBREW LETTER MEM WITH DAGESH
    # ->   05DE HEBREW LETTER MEM
    "\u{FB3E}".freeze => "\u{05DE}".freeze,

    # FB40 HEBREW LETTER NUN WITH DAGESH
    # ->   05E0 HEBREW LETTER NUN
    "\u{FB40}".freeze => "\u{05E0}".freeze,

    # FB41 HEBREW LETTER SAMEKH WITH DAGESH
    # ->   05E1 HEBREW LETTER SAMEKH
    "\u{FB41}".freeze => "\u{05E1}".freeze,

    # FB43 HEBREW LETTER FINAL PE WITH DAGESH
    # ->   05E3 HEBREW LETTER FINAL PE
    "\u{FB43}".freeze => "\u{05E3}".freeze,

    # FB44 HEBREW LETTER PE WITH DAGESH
    # ->   05E4 HEBREW LETTER PE
    "\u{FB44}".freeze => "\u{05E4}".freeze,

    # FB46 HEBREW LETTER TSADI WITH DAGESH
    # ->   05E6 HEBREW LETTER TSADI
    "\u{FB46}".freeze => "\u{05E6}".freeze,

    # FB47 HEBREW LETTER QOF WITH DAGESH
    # ->   05E7 HEBREW LETTER QOF
    "\u{FB47}".freeze => "\u{05E7}".freeze,

    # FB48 HEBREW LETTER RESH WITH DAGESH
    # ->   05E8 HEBREW LETTER RESH
    "\u{FB48}".freeze => "\u{05E8}".freeze,

    # FB49 HEBREW LETTER SHIN WITH DAGESH
    # ->   05E9 HEBREW LETTER SHIN
    "\u{FB49}".freeze => "\u{05E9}".freeze,

    # FB4A HEBREW LETTER TAV WITH DAGESH
    # ->   05EA HEBREW LETTER TAV
    "\u{FB4A}".freeze => "\u{05EA}".freeze,

    # FB4B HEBREW LETTER VAV WITH HOLAM
    # ->   05D5 HEBREW LETTER VAV
    "\u{FB4B}".freeze => "\u{05D5}".freeze,

    # FB4C HEBREW LETTER BET WITH RAFE
    # ->   05D1 HEBREW LETTER BET
    "\u{FB4C}".freeze => "\u{05D1}".freeze,

    # FB4D HEBREW LETTER KAF WITH RAFE
    # ->   05DB HEBREW LETTER KAF
    "\u{FB4D}".freeze => "\u{05DB}".freeze,

    # FB4E HEBREW LETTER PE WITH RAFE
    # ->   05E4 HEBREW LETTER PE
    "\u{FB4E}".freeze => "\u{05E4}".freeze,

    # FB4F HEBREW LIGATURE ALEF LAMED
    # ->   05D0 HEBREW LETTER ALEF
    #    + 05DC HEBREW LETTER LAMED
    "\u{FB4F}".freeze => "\u{05D0}\u{05DC}".freeze,

    # FB50 ARABIC LETTER ALEF WASLA ISOLATED FORM
    # ->   0671 ARABIC LETTER ALEF WASLA
    "\u{FB50}".freeze => "\u{0671}".freeze,

    # FB51 ARABIC LETTER ALEF WASLA FINAL FORM
    # ->   0671 ARABIC LETTER ALEF WASLA
    "\u{FB51}".freeze => "\u{0671}".freeze,

    # FB52 ARABIC LETTER BEEH ISOLATED FORM
    # ->   067B ARABIC LETTER BEEH
    "\u{FB52}".freeze => "\u{067B}".freeze,

    # FB53 ARABIC LETTER BEEH FINAL FORM
    # ->   067B ARABIC LETTER BEEH
    "\u{FB53}".freeze => "\u{067B}".freeze,

    # FB54 ARABIC LETTER BEEH INITIAL FORM
    # ->   067B ARABIC LETTER BEEH
    "\u{FB54}".freeze => "\u{067B}".freeze,

    # FB55 ARABIC LETTER BEEH MEDIAL FORM
    # ->   067B ARABIC LETTER BEEH
    "\u{FB55}".freeze => "\u{067B}".freeze,

    # FB56 ARABIC LETTER PEH ISOLATED FORM
    # ->   067E ARABIC LETTER PEH
    "\u{FB56}".freeze => "\u{067E}".freeze,

    # FB57 ARABIC LETTER PEH FINAL FORM
    # ->   067E ARABIC LETTER PEH
    "\u{FB57}".freeze => "\u{067E}".freeze,

    # FB58 ARABIC LETTER PEH INITIAL FORM
    # ->   067E ARABIC LETTER PEH
    "\u{FB58}".freeze => "\u{067E}".freeze,

    # FB59 ARABIC LETTER PEH MEDIAL FORM
    # ->   067E ARABIC LETTER PEH
    "\u{FB59}".freeze => "\u{067E}".freeze,

    # FB5A ARABIC LETTER BEHEH ISOLATED FORM
    # ->   0680 ARABIC LETTER BEHEH
    "\u{FB5A}".freeze => "\u{0680}".freeze,

    # FB5B ARABIC LETTER BEHEH FINAL FORM
    # ->   0680 ARABIC LETTER BEHEH
    "\u{FB5B}".freeze => "\u{0680}".freeze,

    # FB5C ARABIC LETTER BEHEH INITIAL FORM
    # ->   0680 ARABIC LETTER BEHEH
    "\u{FB5C}".freeze => "\u{0680}".freeze,

    # FB5D ARABIC LETTER BEHEH MEDIAL FORM
    # ->   0680 ARABIC LETTER BEHEH
    "\u{FB5D}".freeze => "\u{0680}".freeze,

    # FB5E ARABIC LETTER TTEHEH ISOLATED FORM
    # ->   067A ARABIC LETTER TTEHEH
    "\u{FB5E}".freeze => "\u{067A}".freeze,

    # FB5F ARABIC LETTER TTEHEH FINAL FORM
    # ->   067A ARABIC LETTER TTEHEH
    "\u{FB5F}".freeze => "\u{067A}".freeze,

    # FB60 ARABIC LETTER TTEHEH INITIAL FORM
    # ->   067A ARABIC LETTER TTEHEH
    "\u{FB60}".freeze => "\u{067A}".freeze,

    # FB61 ARABIC LETTER TTEHEH MEDIAL FORM
    # ->   067A ARABIC LETTER TTEHEH
    "\u{FB61}".freeze => "\u{067A}".freeze,

    # FB62 ARABIC LETTER TEHEH ISOLATED FORM
    # ->   067F ARABIC LETTER TEHEH
    "\u{FB62}".freeze => "\u{067F}".freeze,

    # FB63 ARABIC LETTER TEHEH FINAL FORM
    # ->   067F ARABIC LETTER TEHEH
    "\u{FB63}".freeze => "\u{067F}".freeze,

    # FB64 ARABIC LETTER TEHEH INITIAL FORM
    # ->   067F ARABIC LETTER TEHEH
    "\u{FB64}".freeze => "\u{067F}".freeze,

    # FB65 ARABIC LETTER TEHEH MEDIAL FORM
    # ->   067F ARABIC LETTER TEHEH
    "\u{FB65}".freeze => "\u{067F}".freeze,

    # FB66 ARABIC LETTER TTEH ISOLATED FORM
    # ->   0679 ARABIC LETTER TTEH
    "\u{FB66}".freeze => "\u{0679}".freeze,

    # FB67 ARABIC LETTER TTEH FINAL FORM
    # ->   0679 ARABIC LETTER TTEH
    "\u{FB67}".freeze => "\u{0679}".freeze,

    # FB68 ARABIC LETTER TTEH INITIAL FORM
    # ->   0679 ARABIC LETTER TTEH
    "\u{FB68}".freeze => "\u{0679}".freeze,

    # FB69 ARABIC LETTER TTEH MEDIAL FORM
    # ->   0679 ARABIC LETTER TTEH
    "\u{FB69}".freeze => "\u{0679}".freeze,

    # FB6A ARABIC LETTER VEH ISOLATED FORM
    # ->   06A4 ARABIC LETTER VEH
    "\u{FB6A}".freeze => "\u{06A4}".freeze,

    # FB6B ARABIC LETTER VEH FINAL FORM
    # ->   06A4 ARABIC LETTER VEH
    "\u{FB6B}".freeze => "\u{06A4}".freeze,

    # FB6C ARABIC LETTER VEH INITIAL FORM
    # ->   06A4 ARABIC LETTER VEH
    "\u{FB6C}".freeze => "\u{06A4}".freeze,

    # FB6D ARABIC LETTER VEH MEDIAL FORM
    # ->   06A4 ARABIC LETTER VEH
    "\u{FB6D}".freeze => "\u{06A4}".freeze,

    # FB6E ARABIC LETTER PEHEH ISOLATED FORM
    # ->   06A6 ARABIC LETTER PEHEH
    "\u{FB6E}".freeze => "\u{06A6}".freeze,

    # FB6F ARABIC LETTER PEHEH FINAL FORM
    # ->   06A6 ARABIC LETTER PEHEH
    "\u{FB6F}".freeze => "\u{06A6}".freeze,

    # FB70 ARABIC LETTER PEHEH INITIAL FORM
    # ->   06A6 ARABIC LETTER PEHEH
    "\u{FB70}".freeze => "\u{06A6}".freeze,

    # FB71 ARABIC LETTER PEHEH MEDIAL FORM
    # ->   06A6 ARABIC LETTER PEHEH
    "\u{FB71}".freeze => "\u{06A6}".freeze,

    # FB72 ARABIC LETTER DYEH ISOLATED FORM
    # ->   0684 ARABIC LETTER DYEH
    "\u{FB72}".freeze => "\u{0684}".freeze,

    # FB73 ARABIC LETTER DYEH FINAL FORM
    # ->   0684 ARABIC LETTER DYEH
    "\u{FB73}".freeze => "\u{0684}".freeze,

    # FB74 ARABIC LETTER DYEH INITIAL FORM
    # ->   0684 ARABIC LETTER DYEH
    "\u{FB74}".freeze => "\u{0684}".freeze,

    # FB75 ARABIC LETTER DYEH MEDIAL FORM
    # ->   0684 ARABIC LETTER DYEH
    "\u{FB75}".freeze => "\u{0684}".freeze,

    # FB76 ARABIC LETTER NYEH ISOLATED FORM
    # ->   0683 ARABIC LETTER NYEH
    "\u{FB76}".freeze => "\u{0683}".freeze,

    # FB77 ARABIC LETTER NYEH FINAL FORM
    # ->   0683 ARABIC LETTER NYEH
    "\u{FB77}".freeze => "\u{0683}".freeze,

    # FB78 ARABIC LETTER NYEH INITIAL FORM
    # ->   0683 ARABIC LETTER NYEH
    "\u{FB78}".freeze => "\u{0683}".freeze,

    # FB79 ARABIC LETTER NYEH MEDIAL FORM
    # ->   0683 ARABIC LETTER NYEH
    "\u{FB79}".freeze => "\u{0683}".freeze,

    # FB7A ARABIC LETTER TCHEH ISOLATED FORM
    # ->   0686 ARABIC LETTER TCHEH
    "\u{FB7A}".freeze => "\u{0686}".freeze,

    # FB7B ARABIC LETTER TCHEH FINAL FORM
    # ->   0686 ARABIC LETTER TCHEH
    "\u{FB7B}".freeze => "\u{0686}".freeze,

    # FB7C ARABIC LETTER TCHEH INITIAL FORM
    # ->   0686 ARABIC LETTER TCHEH
    "\u{FB7C}".freeze => "\u{0686}".freeze,

    # FB7D ARABIC LETTER TCHEH MEDIAL FORM
    # ->   0686 ARABIC LETTER TCHEH
    "\u{FB7D}".freeze => "\u{0686}".freeze,

    # FB7E ARABIC LETTER TCHEHEH ISOLATED FORM
    # ->   0687 ARABIC LETTER TCHEHEH
    "\u{FB7E}".freeze => "\u{0687}".freeze,

    # FB7F ARABIC LETTER TCHEHEH FINAL FORM
    # ->   0687 ARABIC LETTER TCHEHEH
    "\u{FB7F}".freeze => "\u{0687}".freeze,

    # FB80 ARABIC LETTER TCHEHEH INITIAL FORM
    # ->   0687 ARABIC LETTER TCHEHEH
    "\u{FB80}".freeze => "\u{0687}".freeze,

    # FB81 ARABIC LETTER TCHEHEH MEDIAL FORM
    # ->   0687 ARABIC LETTER TCHEHEH
    "\u{FB81}".freeze => "\u{0687}".freeze,

    # FB82 ARABIC LETTER DDAHAL ISOLATED FORM
    # ->   068D ARABIC LETTER DDAHAL
    "\u{FB82}".freeze => "\u{068D}".freeze,

    # FB83 ARABIC LETTER DDAHAL FINAL FORM
    # ->   068D ARABIC LETTER DDAHAL
    "\u{FB83}".freeze => "\u{068D}".freeze,

    # FB84 ARABIC LETTER DAHAL ISOLATED FORM
    # ->   068C ARABIC LETTER DAHAL
    "\u{FB84}".freeze => "\u{068C}".freeze,

    # FB85 ARABIC LETTER DAHAL FINAL FORM
    # ->   068C ARABIC LETTER DAHAL
    "\u{FB85}".freeze => "\u{068C}".freeze,

    # FB86 ARABIC LETTER DUL ISOLATED FORM
    # ->   068E ARABIC LETTER DUL
    "\u{FB86}".freeze => "\u{068E}".freeze,

    # FB87 ARABIC LETTER DUL FINAL FORM
    # ->   068E ARABIC LETTER DUL
    "\u{FB87}".freeze => "\u{068E}".freeze,

    # FB88 ARABIC LETTER DDAL ISOLATED FORM
    # ->   0688 ARABIC LETTER DDAL
    "\u{FB88}".freeze => "\u{0688}".freeze,

    # FB89 ARABIC LETTER DDAL FINAL FORM
    # ->   0688 ARABIC LETTER DDAL
    "\u{FB89}".freeze => "\u{0688}".freeze,

    # FB8A ARABIC LETTER JEH ISOLATED FORM
    # ->   0698 ARABIC LETTER JEH
    "\u{FB8A}".freeze => "\u{0698}".freeze,

    # FB8B ARABIC LETTER JEH FINAL FORM
    # ->   0698 ARABIC LETTER JEH
    "\u{FB8B}".freeze => "\u{0698}".freeze,

    # FB8C ARABIC LETTER RREH ISOLATED FORM
    # ->   0691 ARABIC LETTER RREH
    "\u{FB8C}".freeze => "\u{0691}".freeze,

    # FB8D ARABIC LETTER RREH FINAL FORM
    # ->   0691 ARABIC LETTER RREH
    "\u{FB8D}".freeze => "\u{0691}".freeze,

    # FB8E ARABIC LETTER KEHEH ISOLATED FORM
    # ->   06A9 ARABIC LETTER KEHEH
    "\u{FB8E}".freeze => "\u{06A9}".freeze,

    # FB8F ARABIC LETTER KEHEH FINAL FORM
    # ->   06A9 ARABIC LETTER KEHEH
    "\u{FB8F}".freeze => "\u{06A9}".freeze,

    # FB90 ARABIC LETTER KEHEH INITIAL FORM
    # ->   06A9 ARABIC LETTER KEHEH
    "\u{FB90}".freeze => "\u{06A9}".freeze,

    # FB91 ARABIC LETTER KEHEH MEDIAL FORM
    # ->   06A9 ARABIC LETTER KEHEH
    "\u{FB91}".freeze => "\u{06A9}".freeze,

    # FB92 ARABIC LETTER GAF ISOLATED FORM
    # ->   06AF ARABIC LETTER GAF
    "\u{FB92}".freeze => "\u{06AF}".freeze,

    # FB93 ARABIC LETTER GAF FINAL FORM
    # ->   06AF ARABIC LETTER GAF
    "\u{FB93}".freeze => "\u{06AF}".freeze,

    # FB94 ARABIC LETTER GAF INITIAL FORM
    # ->   06AF ARABIC LETTER GAF
    "\u{FB94}".freeze => "\u{06AF}".freeze,

    # FB95 ARABIC LETTER GAF MEDIAL FORM
    # ->   06AF ARABIC LETTER GAF
    "\u{FB95}".freeze => "\u{06AF}".freeze,

    # FB96 ARABIC LETTER GUEH ISOLATED FORM
    # ->   06B3 ARABIC LETTER GUEH
    "\u{FB96}".freeze => "\u{06B3}".freeze,

    # FB97 ARABIC LETTER GUEH FINAL FORM
    # ->   06B3 ARABIC LETTER GUEH
    "\u{FB97}".freeze => "\u{06B3}".freeze,

    # FB98 ARABIC LETTER GUEH INITIAL FORM
    # ->   06B3 ARABIC LETTER GUEH
    "\u{FB98}".freeze => "\u{06B3}".freeze,

    # FB99 ARABIC LETTER GUEH MEDIAL FORM
    # ->   06B3 ARABIC LETTER GUEH
    "\u{FB99}".freeze => "\u{06B3}".freeze,

    # FB9A ARABIC LETTER NGOEH ISOLATED FORM
    # ->   06B1 ARABIC LETTER NGOEH
    "\u{FB9A}".freeze => "\u{06B1}".freeze,

    # FB9B ARABIC LETTER NGOEH FINAL FORM
    # ->   06B1 ARABIC LETTER NGOEH
    "\u{FB9B}".freeze => "\u{06B1}".freeze,

    # FB9C ARABIC LETTER NGOEH INITIAL FORM
    # ->   06B1 ARABIC LETTER NGOEH
    "\u{FB9C}".freeze => "\u{06B1}".freeze,

    # FB9D ARABIC LETTER NGOEH MEDIAL FORM
    # ->   06B1 ARABIC LETTER NGOEH
    "\u{FB9D}".freeze => "\u{06B1}".freeze,

    # FB9E ARABIC LETTER NOON GHUNNA ISOLATED FORM
    # ->   06BA ARABIC LETTER NOON GHUNNA
    "\u{FB9E}".freeze => "\u{06BA}".freeze,

    # FB9F ARABIC LETTER NOON GHUNNA FINAL FORM
    # ->   06BA ARABIC LETTER NOON GHUNNA
    "\u{FB9F}".freeze => "\u{06BA}".freeze,

    # FBA0 ARABIC LETTER RNOON ISOLATED FORM
    # ->   06BB ARABIC LETTER RNOON
    "\u{FBA0}".freeze => "\u{06BB}".freeze,

    # FBA1 ARABIC LETTER RNOON FINAL FORM
    # ->   06BB ARABIC LETTER RNOON
    "\u{FBA1}".freeze => "\u{06BB}".freeze,

    # FBA2 ARABIC LETTER RNOON INITIAL FORM
    # ->   06BB ARABIC LETTER RNOON
    "\u{FBA2}".freeze => "\u{06BB}".freeze,

    # FBA3 ARABIC LETTER RNOON MEDIAL FORM
    # ->   06BB ARABIC LETTER RNOON
    "\u{FBA3}".freeze => "\u{06BB}".freeze,

    # FBA4 ARABIC LETTER HEH WITH YEH ABOVE ISOLATED FORM
    # ->   06D5 ARABIC LETTER AE
    "\u{FBA4}".freeze => "\u{06D5}".freeze,

    # FBA5 ARABIC LETTER HEH WITH YEH ABOVE FINAL FORM
    # ->   06D5 ARABIC LETTER AE
    "\u{FBA5}".freeze => "\u{06D5}".freeze,

    # FBA6 ARABIC LETTER HEH GOAL ISOLATED FORM
    # ->   06C1 ARABIC LETTER HEH GOAL
    "\u{FBA6}".freeze => "\u{06C1}".freeze,

    # FBA7 ARABIC LETTER HEH GOAL FINAL FORM
    # ->   06C1 ARABIC LETTER HEH GOAL
    "\u{FBA7}".freeze => "\u{06C1}".freeze,

    # FBA8 ARABIC LETTER HEH GOAL INITIAL FORM
    # ->   06C1 ARABIC LETTER HEH GOAL
    "\u{FBA8}".freeze => "\u{06C1}".freeze,

    # FBA9 ARABIC LETTER HEH GOAL MEDIAL FORM
    # ->   06C1 ARABIC LETTER HEH GOAL
    "\u{FBA9}".freeze => "\u{06C1}".freeze,

    # FBAA ARABIC LETTER HEH DOACHASHMEE ISOLATED FORM
    # ->   06BE ARABIC LETTER HEH DOACHASHMEE
    "\u{FBAA}".freeze => "\u{06BE}".freeze,

    # FBAB ARABIC LETTER HEH DOACHASHMEE FINAL FORM
    # ->   06BE ARABIC LETTER HEH DOACHASHMEE
    "\u{FBAB}".freeze => "\u{06BE}".freeze,

    # FBAC ARABIC LETTER HEH DOACHASHMEE INITIAL FORM
    # ->   06BE ARABIC LETTER HEH DOACHASHMEE
    "\u{FBAC}".freeze => "\u{06BE}".freeze,

    # FBAD ARABIC LETTER HEH DOACHASHMEE MEDIAL FORM
    # ->   06BE ARABIC LETTER HEH DOACHASHMEE
    "\u{FBAD}".freeze => "\u{06BE}".freeze,

    # FBAE ARABIC LETTER YEH BARREE ISOLATED FORM
    # ->   06D2 ARABIC LETTER YEH BARREE
    "\u{FBAE}".freeze => "\u{06D2}".freeze,

    # FBAF ARABIC LETTER YEH BARREE FINAL FORM
    # ->   06D2 ARABIC LETTER YEH BARREE
    "\u{FBAF}".freeze => "\u{06D2}".freeze,

    # FBB0 ARABIC LETTER YEH BARREE WITH HAMZA ABOVE ISOLATED FORM
    # ->   06D2 ARABIC LETTER YEH BARREE
    "\u{FBB0}".freeze => "\u{06D2}".freeze,

    # FBB1 ARABIC LETTER YEH BARREE WITH HAMZA ABOVE FINAL FORM
    # ->   06D2 ARABIC LETTER YEH BARREE
    "\u{FBB1}".freeze => "\u{06D2}".freeze,

    # FBD3 ARABIC LETTER NG ISOLATED FORM
    # ->   06AD ARABIC LETTER NG
    "\u{FBD3}".freeze => "\u{06AD}".freeze,

    # FBD4 ARABIC LETTER NG FINAL FORM
    # ->   06AD ARABIC LETTER NG
    "\u{FBD4}".freeze => "\u{06AD}".freeze,

    # FBD5 ARABIC LETTER NG INITIAL FORM
    # ->   06AD ARABIC LETTER NG
    "\u{FBD5}".freeze => "\u{06AD}".freeze,

    # FBD6 ARABIC LETTER NG MEDIAL FORM
    # ->   06AD ARABIC LETTER NG
    "\u{FBD6}".freeze => "\u{06AD}".freeze,

    # FBD7 ARABIC LETTER U ISOLATED FORM
    # ->   06C7 ARABIC LETTER U
    "\u{FBD7}".freeze => "\u{06C7}".freeze,

    # FBD8 ARABIC LETTER U FINAL FORM
    # ->   06C7 ARABIC LETTER U
    "\u{FBD8}".freeze => "\u{06C7}".freeze,

    # FBD9 ARABIC LETTER OE ISOLATED FORM
    # ->   06C6 ARABIC LETTER OE
    "\u{FBD9}".freeze => "\u{06C6}".freeze,

    # FBDA ARABIC LETTER OE FINAL FORM
    # ->   06C6 ARABIC LETTER OE
    "\u{FBDA}".freeze => "\u{06C6}".freeze,

    # FBDB ARABIC LETTER YU ISOLATED FORM
    # ->   06C8 ARABIC LETTER YU
    "\u{FBDB}".freeze => "\u{06C8}".freeze,

    # FBDC ARABIC LETTER YU FINAL FORM
    # ->   06C8 ARABIC LETTER YU
    "\u{FBDC}".freeze => "\u{06C8}".freeze,

    # FBDD ARABIC LETTER U WITH HAMZA ABOVE ISOLATED FORM
    # ->   06C7 ARABIC LETTER U
    #    + 0674 ARABIC LETTER HIGH HAMZA
    "\u{FBDD}".freeze => "\u{06C7}\u{0674}".freeze,

    # FBDE ARABIC LETTER VE ISOLATED FORM
    # ->   06CB ARABIC LETTER VE
    "\u{FBDE}".freeze => "\u{06CB}".freeze,

    # FBDF ARABIC LETTER VE FINAL FORM
    # ->   06CB ARABIC LETTER VE
    "\u{FBDF}".freeze => "\u{06CB}".freeze,

    # FBE0 ARABIC LETTER KIRGHIZ OE ISOLATED FORM
    # ->   06C5 ARABIC LETTER KIRGHIZ OE
    "\u{FBE0}".freeze => "\u{06C5}".freeze,

    # FBE1 ARABIC LETTER KIRGHIZ OE FINAL FORM
    # ->   06C5 ARABIC LETTER KIRGHIZ OE
    "\u{FBE1}".freeze => "\u{06C5}".freeze,

    # FBE2 ARABIC LETTER KIRGHIZ YU ISOLATED FORM
    # ->   06C9 ARABIC LETTER KIRGHIZ YU
    "\u{FBE2}".freeze => "\u{06C9}".freeze,

    # FBE3 ARABIC LETTER KIRGHIZ YU FINAL FORM
    # ->   06C9 ARABIC LETTER KIRGHIZ YU
    "\u{FBE3}".freeze => "\u{06C9}".freeze,

    # FBE4 ARABIC LETTER E ISOLATED FORM
    # ->   06D0 ARABIC LETTER E
    "\u{FBE4}".freeze => "\u{06D0}".freeze,

    # FBE5 ARABIC LETTER E FINAL FORM
    # ->   06D0 ARABIC LETTER E
    "\u{FBE5}".freeze => "\u{06D0}".freeze,

    # FBE6 ARABIC LETTER E INITIAL FORM
    # ->   06D0 ARABIC LETTER E
    "\u{FBE6}".freeze => "\u{06D0}".freeze,

    # FBE7 ARABIC LETTER E MEDIAL FORM
    # ->   06D0 ARABIC LETTER E
    "\u{FBE7}".freeze => "\u{06D0}".freeze,

    # FBE8 ARABIC LETTER UIGHUR KAZAKH KIRGHIZ ALEF MAKSURA INITIAL FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    "\u{FBE8}".freeze => "\u{0649}".freeze,

    # FBE9 ARABIC LETTER UIGHUR KAZAKH KIRGHIZ ALEF MAKSURA MEDIAL FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    "\u{FBE9}".freeze => "\u{0649}".freeze,

    # FBEA ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH ALEF ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    #    + 064A ARABIC LETTER YEH
    "\u{FBEA}".freeze => "\u{0627}\u{064A}".freeze,

    # FBEB ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH ALEF FINAL FORM
    # ->   0627 ARABIC LETTER ALEF
    #    + 064A ARABIC LETTER YEH
    "\u{FBEB}".freeze => "\u{0627}\u{064A}".freeze,

    # FBEC ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH AE ISOLATED FORM
    # ->   06D5 ARABIC LETTER AE
    #    + 064A ARABIC LETTER YEH
    "\u{FBEC}".freeze => "\u{06D5}\u{064A}".freeze,

    # FBED ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH AE FINAL FORM
    # ->   06D5 ARABIC LETTER AE
    #    + 064A ARABIC LETTER YEH
    "\u{FBED}".freeze => "\u{06D5}\u{064A}".freeze,

    # FBEE ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH WAW ISOLATED FORM
    # ->   0648 ARABIC LETTER WAW
    #    + 064A ARABIC LETTER YEH
    "\u{FBEE}".freeze => "\u{0648}\u{064A}".freeze,

    # FBEF ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH WAW FINAL FORM
    # ->   0648 ARABIC LETTER WAW
    #    + 064A ARABIC LETTER YEH
    "\u{FBEF}".freeze => "\u{0648}\u{064A}".freeze,

    # FBF0 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH U ISOLATED FORM
    # ->   06C7 ARABIC LETTER U
    #    + 064A ARABIC LETTER YEH
    "\u{FBF0}".freeze => "\u{06C7}\u{064A}".freeze,

    # FBF1 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH U FINAL FORM
    # ->   06C7 ARABIC LETTER U
    #    + 064A ARABIC LETTER YEH
    "\u{FBF1}".freeze => "\u{06C7}\u{064A}".freeze,

    # FBF2 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH OE ISOLATED FORM
    # ->   06C6 ARABIC LETTER OE
    #    + 064A ARABIC LETTER YEH
    "\u{FBF2}".freeze => "\u{06C6}\u{064A}".freeze,

    # FBF3 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH OE FINAL FORM
    # ->   06C6 ARABIC LETTER OE
    #    + 064A ARABIC LETTER YEH
    "\u{FBF3}".freeze => "\u{06C6}\u{064A}".freeze,

    # FBF4 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH YU ISOLATED FORM
    # ->   06C8 ARABIC LETTER YU
    #    + 064A ARABIC LETTER YEH
    "\u{FBF4}".freeze => "\u{06C8}\u{064A}".freeze,

    # FBF5 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH YU FINAL FORM
    # ->   06C8 ARABIC LETTER YU
    #    + 064A ARABIC LETTER YEH
    "\u{FBF5}".freeze => "\u{06C8}\u{064A}".freeze,

    # FBF6 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH E ISOLATED FORM
    # ->   06D0 ARABIC LETTER E
    #    + 064A ARABIC LETTER YEH
    "\u{FBF6}".freeze => "\u{06D0}\u{064A}".freeze,

    # FBF7 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH E FINAL FORM
    # ->   06D0 ARABIC LETTER E
    #    + 064A ARABIC LETTER YEH
    "\u{FBF7}".freeze => "\u{06D0}\u{064A}".freeze,

    # FBF8 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH E INITIAL FORM
    # ->   06D0 ARABIC LETTER E
    #    + 064A ARABIC LETTER YEH
    "\u{FBF8}".freeze => "\u{06D0}\u{064A}".freeze,

    # FBF9 ARABIC LIGATURE UIGHUR KIRGHIZ YEH WITH HAMZA ABOVE WITH ALEF MAKSURA ISOLATED FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    #    + 064A ARABIC LETTER YEH
    "\u{FBF9}".freeze => "\u{0649}\u{064A}".freeze,

    # FBFA ARABIC LIGATURE UIGHUR KIRGHIZ YEH WITH HAMZA ABOVE WITH ALEF MAKSURA FINAL FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    #    + 064A ARABIC LETTER YEH
    "\u{FBFA}".freeze => "\u{0649}\u{064A}".freeze,

    # FBFB ARABIC LIGATURE UIGHUR KIRGHIZ YEH WITH HAMZA ABOVE WITH ALEF MAKSURA INITIAL FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    #    + 064A ARABIC LETTER YEH
    "\u{FBFB}".freeze => "\u{0649}\u{064A}".freeze,

    # FBFC ARABIC LETTER FARSI YEH ISOLATED FORM
    # ->   06CC ARABIC LETTER FARSI YEH
    "\u{FBFC}".freeze => "\u{06CC}".freeze,

    # FBFD ARABIC LETTER FARSI YEH FINAL FORM
    # ->   06CC ARABIC LETTER FARSI YEH
    "\u{FBFD}".freeze => "\u{06CC}".freeze,

    # FBFE ARABIC LETTER FARSI YEH INITIAL FORM
    # ->   06CC ARABIC LETTER FARSI YEH
    "\u{FBFE}".freeze => "\u{06CC}".freeze,

    # FBFF ARABIC LETTER FARSI YEH MEDIAL FORM
    # ->   06CC ARABIC LETTER FARSI YEH
    "\u{FBFF}".freeze => "\u{06CC}".freeze,

    # FC00 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH JEEM ISOLATED FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FC00}".freeze => "\u{062C}\u{064A}".freeze,

    # FC01 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH HAH ISOLATED FORM
    # ->   062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FC01}".freeze => "\u{062D}\u{064A}".freeze,

    # FC02 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH MEEM ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FC02}".freeze => "\u{0645}\u{064A}".freeze,

    # FC03 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH ALEF MAKSURA ISOLATED FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    #    + 064A ARABIC LETTER YEH
    "\u{FC03}".freeze => "\u{0649}\u{064A}".freeze,

    # FC04 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH YEH ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC04}".freeze => "\u{064A}\u{064A}".freeze,

    # FC05 ARABIC LIGATURE BEH WITH JEEM ISOLATED FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC05}".freeze => "\u{0628}\u{062C}".freeze,

    # FC06 ARABIC LIGATURE BEH WITH HAH ISOLATED FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062D ARABIC LETTER HAH
    "\u{FC06}".freeze => "\u{0628}\u{062D}".freeze,

    # FC07 ARABIC LIGATURE BEH WITH KHAH ISOLATED FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FC07}".freeze => "\u{0628}\u{062E}".freeze,

    # FC08 ARABIC LIGATURE BEH WITH MEEM ISOLATED FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC08}".freeze => "\u{0628}\u{0645}".freeze,

    # FC09 ARABIC LIGATURE BEH WITH ALEF MAKSURA ISOLATED FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC09}".freeze => "\u{0628}\u{0649}".freeze,

    # FC0A ARABIC LIGATURE BEH WITH YEH ISOLATED FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC0A}".freeze => "\u{0628}\u{064A}".freeze,

    # FC0B ARABIC LIGATURE TEH WITH JEEM ISOLATED FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC0B}".freeze => "\u{062A}\u{062C}".freeze,

    # FC0C ARABIC LIGATURE TEH WITH HAH ISOLATED FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062D ARABIC LETTER HAH
    "\u{FC0C}".freeze => "\u{062A}\u{062D}".freeze,

    # FC0D ARABIC LIGATURE TEH WITH KHAH ISOLATED FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FC0D}".freeze => "\u{062A}\u{062E}".freeze,

    # FC0E ARABIC LIGATURE TEH WITH MEEM ISOLATED FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC0E}".freeze => "\u{062A}\u{0645}".freeze,

    # FC0F ARABIC LIGATURE TEH WITH ALEF MAKSURA ISOLATED FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC0F}".freeze => "\u{062A}\u{0649}".freeze,

    # FC10 ARABIC LIGATURE TEH WITH YEH ISOLATED FORM
    # ->   062A ARABIC LETTER TEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC10}".freeze => "\u{062A}\u{064A}".freeze,

    # FC11 ARABIC LIGATURE THEH WITH JEEM ISOLATED FORM
    # ->   062B ARABIC LETTER THEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC11}".freeze => "\u{062B}\u{062C}".freeze,

    # FC12 ARABIC LIGATURE THEH WITH MEEM ISOLATED FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC12}".freeze => "\u{062B}\u{0645}".freeze,

    # FC13 ARABIC LIGATURE THEH WITH ALEF MAKSURA ISOLATED FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC13}".freeze => "\u{062B}\u{0649}".freeze,

    # FC14 ARABIC LIGATURE THEH WITH YEH ISOLATED FORM
    # ->   062B ARABIC LETTER THEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC14}".freeze => "\u{062B}\u{064A}".freeze,

    # FC15 ARABIC LIGATURE JEEM WITH HAH ISOLATED FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FC15}".freeze => "\u{062C}\u{062D}".freeze,

    # FC16 ARABIC LIGATURE JEEM WITH MEEM ISOLATED FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC16}".freeze => "\u{062C}\u{0645}".freeze,

    # FC17 ARABIC LIGATURE HAH WITH JEEM ISOLATED FORM
    # ->   062D ARABIC LETTER HAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC17}".freeze => "\u{062D}\u{062C}".freeze,

    # FC18 ARABIC LIGATURE HAH WITH MEEM ISOLATED FORM
    # ->   062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC18}".freeze => "\u{062D}\u{0645}".freeze,

    # FC19 ARABIC LIGATURE KHAH WITH JEEM ISOLATED FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC19}".freeze => "\u{062E}\u{062C}".freeze,

    # FC1A ARABIC LIGATURE KHAH WITH HAH ISOLATED FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 062D ARABIC LETTER HAH
    "\u{FC1A}".freeze => "\u{062E}\u{062D}".freeze,

    # FC1B ARABIC LIGATURE KHAH WITH MEEM ISOLATED FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC1B}".freeze => "\u{062E}\u{0645}".freeze,

    # FC1C ARABIC LIGATURE SEEN WITH JEEM ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062C ARABIC LETTER JEEM
    "\u{FC1C}".freeze => "\u{0633}\u{062C}".freeze,

    # FC1D ARABIC LIGATURE SEEN WITH HAH ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062D ARABIC LETTER HAH
    "\u{FC1D}".freeze => "\u{0633}\u{062D}".freeze,

    # FC1E ARABIC LIGATURE SEEN WITH KHAH ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062E ARABIC LETTER KHAH
    "\u{FC1E}".freeze => "\u{0633}\u{062E}".freeze,

    # FC1F ARABIC LIGATURE SEEN WITH MEEM ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC1F}".freeze => "\u{0633}\u{0645}".freeze,

    # FC20 ARABIC LIGATURE SAD WITH HAH ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 062D ARABIC LETTER HAH
    "\u{FC20}".freeze => "\u{0635}\u{062D}".freeze,

    # FC21 ARABIC LIGATURE SAD WITH MEEM ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC21}".freeze => "\u{0635}\u{0645}".freeze,

    # FC22 ARABIC LIGATURE DAD WITH JEEM ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062C ARABIC LETTER JEEM
    "\u{FC22}".freeze => "\u{0636}\u{062C}".freeze,

    # FC23 ARABIC LIGATURE DAD WITH HAH ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062D ARABIC LETTER HAH
    "\u{FC23}".freeze => "\u{0636}\u{062D}".freeze,

    # FC24 ARABIC LIGATURE DAD WITH KHAH ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062E ARABIC LETTER KHAH
    "\u{FC24}".freeze => "\u{0636}\u{062E}".freeze,

    # FC25 ARABIC LIGATURE DAD WITH MEEM ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC25}".freeze => "\u{0636}\u{0645}".freeze,

    # FC26 ARABIC LIGATURE TAH WITH HAH ISOLATED FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 062D ARABIC LETTER HAH
    "\u{FC26}".freeze => "\u{0637}\u{062D}".freeze,

    # FC27 ARABIC LIGATURE TAH WITH MEEM ISOLATED FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC27}".freeze => "\u{0637}\u{0645}".freeze,

    # FC28 ARABIC LIGATURE ZAH WITH MEEM ISOLATED FORM
    # ->   0638 ARABIC LETTER ZAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC28}".freeze => "\u{0638}\u{0645}".freeze,

    # FC29 ARABIC LIGATURE AIN WITH JEEM ISOLATED FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 062C ARABIC LETTER JEEM
    "\u{FC29}".freeze => "\u{0639}\u{062C}".freeze,

    # FC2A ARABIC LIGATURE AIN WITH MEEM ISOLATED FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC2A}".freeze => "\u{0639}\u{0645}".freeze,

    # FC2B ARABIC LIGATURE GHAIN WITH JEEM ISOLATED FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 062C ARABIC LETTER JEEM
    "\u{FC2B}".freeze => "\u{063A}\u{062C}".freeze,

    # FC2C ARABIC LIGATURE GHAIN WITH MEEM ISOLATED FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC2C}".freeze => "\u{063A}\u{0645}".freeze,

    # FC2D ARABIC LIGATURE FEH WITH JEEM ISOLATED FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC2D}".freeze => "\u{0641}\u{062C}".freeze,

    # FC2E ARABIC LIGATURE FEH WITH HAH ISOLATED FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062D ARABIC LETTER HAH
    "\u{FC2E}".freeze => "\u{0641}\u{062D}".freeze,

    # FC2F ARABIC LIGATURE FEH WITH KHAH ISOLATED FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FC2F}".freeze => "\u{0641}\u{062E}".freeze,

    # FC30 ARABIC LIGATURE FEH WITH MEEM ISOLATED FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC30}".freeze => "\u{0641}\u{0645}".freeze,

    # FC31 ARABIC LIGATURE FEH WITH ALEF MAKSURA ISOLATED FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC31}".freeze => "\u{0641}\u{0649}".freeze,

    # FC32 ARABIC LIGATURE FEH WITH YEH ISOLATED FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC32}".freeze => "\u{0641}\u{064A}".freeze,

    # FC33 ARABIC LIGATURE QAF WITH HAH ISOLATED FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 062D ARABIC LETTER HAH
    "\u{FC33}".freeze => "\u{0642}\u{062D}".freeze,

    # FC34 ARABIC LIGATURE QAF WITH MEEM ISOLATED FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC34}".freeze => "\u{0642}\u{0645}".freeze,

    # FC35 ARABIC LIGATURE QAF WITH ALEF MAKSURA ISOLATED FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC35}".freeze => "\u{0642}\u{0649}".freeze,

    # FC36 ARABIC LIGATURE QAF WITH YEH ISOLATED FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 064A ARABIC LETTER YEH
    "\u{FC36}".freeze => "\u{0642}\u{064A}".freeze,

    # FC37 ARABIC LIGATURE KAF WITH ALEF ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0627 ARABIC LETTER ALEF
    "\u{FC37}".freeze => "\u{0643}\u{0627}".freeze,

    # FC38 ARABIC LIGATURE KAF WITH JEEM ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 062C ARABIC LETTER JEEM
    "\u{FC38}".freeze => "\u{0643}\u{062C}".freeze,

    # FC39 ARABIC LIGATURE KAF WITH HAH ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 062D ARABIC LETTER HAH
    "\u{FC39}".freeze => "\u{0643}\u{062D}".freeze,

    # FC3A ARABIC LIGATURE KAF WITH KHAH ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 062E ARABIC LETTER KHAH
    "\u{FC3A}".freeze => "\u{0643}\u{062E}".freeze,

    # FC3B ARABIC LIGATURE KAF WITH LAM ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0644 ARABIC LETTER LAM
    "\u{FC3B}".freeze => "\u{0643}\u{0644}".freeze,

    # FC3C ARABIC LIGATURE KAF WITH MEEM ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC3C}".freeze => "\u{0643}\u{0645}".freeze,

    # FC3D ARABIC LIGATURE KAF WITH ALEF MAKSURA ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC3D}".freeze => "\u{0643}\u{0649}".freeze,

    # FC3E ARABIC LIGATURE KAF WITH YEH ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 064A ARABIC LETTER YEH
    "\u{FC3E}".freeze => "\u{0643}\u{064A}".freeze,

    # FC3F ARABIC LIGATURE LAM WITH JEEM ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062C ARABIC LETTER JEEM
    "\u{FC3F}".freeze => "\u{0644}\u{062C}".freeze,

    # FC40 ARABIC LIGATURE LAM WITH HAH ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062D ARABIC LETTER HAH
    "\u{FC40}".freeze => "\u{0644}\u{062D}".freeze,

    # FC41 ARABIC LIGATURE LAM WITH KHAH ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062E ARABIC LETTER KHAH
    "\u{FC41}".freeze => "\u{0644}\u{062E}".freeze,

    # FC42 ARABIC LIGATURE LAM WITH MEEM ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC42}".freeze => "\u{0644}\u{0645}".freeze,

    # FC43 ARABIC LIGATURE LAM WITH ALEF MAKSURA ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC43}".freeze => "\u{0644}\u{0649}".freeze,

    # FC44 ARABIC LIGATURE LAM WITH YEH ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 064A ARABIC LETTER YEH
    "\u{FC44}".freeze => "\u{0644}\u{064A}".freeze,

    # FC45 ARABIC LIGATURE MEEM WITH JEEM ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    "\u{FC45}".freeze => "\u{0645}\u{062C}".freeze,

    # FC46 ARABIC LIGATURE MEEM WITH HAH ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FC46}".freeze => "\u{0645}\u{062D}".freeze,

    # FC47 ARABIC LIGATURE MEEM WITH KHAH ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    "\u{FC47}".freeze => "\u{0645}\u{062E}".freeze,

    # FC48 ARABIC LIGATURE MEEM WITH MEEM ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC48}".freeze => "\u{0645}\u{0645}".freeze,

    # FC49 ARABIC LIGATURE MEEM WITH ALEF MAKSURA ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC49}".freeze => "\u{0645}\u{0649}".freeze,

    # FC4A ARABIC LIGATURE MEEM WITH YEH ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FC4A}".freeze => "\u{0645}\u{064A}".freeze,

    # FC4B ARABIC LIGATURE NOON WITH JEEM ISOLATED FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    "\u{FC4B}".freeze => "\u{0646}\u{062C}".freeze,

    # FC4C ARABIC LIGATURE NOON WITH HAH ISOLATED FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062D ARABIC LETTER HAH
    "\u{FC4C}".freeze => "\u{0646}\u{062D}".freeze,

    # FC4D ARABIC LIGATURE NOON WITH KHAH ISOLATED FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062E ARABIC LETTER KHAH
    "\u{FC4D}".freeze => "\u{0646}\u{062E}".freeze,

    # FC4E ARABIC LIGATURE NOON WITH MEEM ISOLATED FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC4E}".freeze => "\u{0646}\u{0645}".freeze,

    # FC4F ARABIC LIGATURE NOON WITH ALEF MAKSURA ISOLATED FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC4F}".freeze => "\u{0646}\u{0649}".freeze,

    # FC50 ARABIC LIGATURE NOON WITH YEH ISOLATED FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 064A ARABIC LETTER YEH
    "\u{FC50}".freeze => "\u{0646}\u{064A}".freeze,

    # FC51 ARABIC LIGATURE HEH WITH JEEM ISOLATED FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC51}".freeze => "\u{0647}\u{062C}".freeze,

    # FC52 ARABIC LIGATURE HEH WITH MEEM ISOLATED FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC52}".freeze => "\u{0647}\u{0645}".freeze,

    # FC53 ARABIC LIGATURE HEH WITH ALEF MAKSURA ISOLATED FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC53}".freeze => "\u{0647}\u{0649}".freeze,

    # FC54 ARABIC LIGATURE HEH WITH YEH ISOLATED FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC54}".freeze => "\u{0647}\u{064A}".freeze,

    # FC55 ARABIC LIGATURE YEH WITH JEEM ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC55}".freeze => "\u{064A}\u{062C}".freeze,

    # FC56 ARABIC LIGATURE YEH WITH HAH ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062D ARABIC LETTER HAH
    "\u{FC56}".freeze => "\u{064A}\u{062D}".freeze,

    # FC57 ARABIC LIGATURE YEH WITH KHAH ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FC57}".freeze => "\u{064A}\u{062E}".freeze,

    # FC58 ARABIC LIGATURE YEH WITH MEEM ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC58}".freeze => "\u{064A}\u{0645}".freeze,

    # FC59 ARABIC LIGATURE YEH WITH ALEF MAKSURA ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC59}".freeze => "\u{064A}\u{0649}".freeze,

    # FC5A ARABIC LIGATURE YEH WITH YEH ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC5A}".freeze => "\u{064A}\u{064A}".freeze,

    # FC5B ARABIC LIGATURE THAL WITH SUPERSCRIPT ALEF ISOLATED FORM
    # ->   0630 ARABIC LETTER THAL
    "\u{FC5B}".freeze => "\u{0630}".freeze,

    # FC5C ARABIC LIGATURE REH WITH SUPERSCRIPT ALEF ISOLATED FORM
    # ->   0631 ARABIC LETTER REH
    "\u{FC5C}".freeze => "\u{0631}".freeze,

    # FC5D ARABIC LIGATURE ALEF MAKSURA WITH SUPERSCRIPT ALEF ISOLATED FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC5D}".freeze => "\u{0649}".freeze,

    # FC5E ARABIC LIGATURE SHADDA WITH DAMMATAN ISOLATED FORM
    # ->   0020 SPACE
    "\u{FC5E}".freeze => ' '.freeze,

    # FC5F ARABIC LIGATURE SHADDA WITH KASRATAN ISOLATED FORM
    # ->   0020 SPACE
    "\u{FC5F}".freeze => ' '.freeze,

    # FC60 ARABIC LIGATURE SHADDA WITH FATHA ISOLATED FORM
    # ->   0020 SPACE
    "\u{FC60}".freeze => ' '.freeze,

    # FC61 ARABIC LIGATURE SHADDA WITH DAMMA ISOLATED FORM
    # ->   0020 SPACE
    "\u{FC61}".freeze => ' '.freeze,

    # FC62 ARABIC LIGATURE SHADDA WITH KASRA ISOLATED FORM
    # ->   0020 SPACE
    "\u{FC62}".freeze => ' '.freeze,

    # FC63 ARABIC LIGATURE SHADDA WITH SUPERSCRIPT ALEF ISOLATED FORM
    # ->   0020 SPACE
    "\u{FC63}".freeze => ' '.freeze,

    # FC64 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH REH FINAL FORM
    # ->   0631 ARABIC LETTER REH
    #    + 064A ARABIC LETTER YEH
    "\u{FC64}".freeze => "\u{0631}\u{064A}".freeze,

    # FC65 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH ZAIN FINAL FORM
    # ->   0632 ARABIC LETTER ZAIN
    #    + 064A ARABIC LETTER YEH
    "\u{FC65}".freeze => "\u{0632}\u{064A}".freeze,

    # FC66 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH MEEM FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FC66}".freeze => "\u{0645}\u{064A}".freeze,

    # FC67 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH NOON FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 064A ARABIC LETTER YEH
    "\u{FC67}".freeze => "\u{0646}\u{064A}".freeze,

    # FC68 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH ALEF MAKSURA FINAL FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    #    + 064A ARABIC LETTER YEH
    "\u{FC68}".freeze => "\u{0649}\u{064A}".freeze,

    # FC69 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH YEH FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC69}".freeze => "\u{064A}\u{064A}".freeze,

    # FC6A ARABIC LIGATURE BEH WITH REH FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0631 ARABIC LETTER REH
    "\u{FC6A}".freeze => "\u{0628}\u{0631}".freeze,

    # FC6B ARABIC LIGATURE BEH WITH ZAIN FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0632 ARABIC LETTER ZAIN
    "\u{FC6B}".freeze => "\u{0628}\u{0632}".freeze,

    # FC6C ARABIC LIGATURE BEH WITH MEEM FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC6C}".freeze => "\u{0628}\u{0645}".freeze,

    # FC6D ARABIC LIGATURE BEH WITH NOON FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0646 ARABIC LETTER NOON
    "\u{FC6D}".freeze => "\u{0628}\u{0646}".freeze,

    # FC6E ARABIC LIGATURE BEH WITH ALEF MAKSURA FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC6E}".freeze => "\u{0628}\u{0649}".freeze,

    # FC6F ARABIC LIGATURE BEH WITH YEH FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC6F}".freeze => "\u{0628}\u{064A}".freeze,

    # FC70 ARABIC LIGATURE TEH WITH REH FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0631 ARABIC LETTER REH
    "\u{FC70}".freeze => "\u{062A}\u{0631}".freeze,

    # FC71 ARABIC LIGATURE TEH WITH ZAIN FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0632 ARABIC LETTER ZAIN
    "\u{FC71}".freeze => "\u{062A}\u{0632}".freeze,

    # FC72 ARABIC LIGATURE TEH WITH MEEM FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC72}".freeze => "\u{062A}\u{0645}".freeze,

    # FC73 ARABIC LIGATURE TEH WITH NOON FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0646 ARABIC LETTER NOON
    "\u{FC73}".freeze => "\u{062A}\u{0646}".freeze,

    # FC74 ARABIC LIGATURE TEH WITH ALEF MAKSURA FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC74}".freeze => "\u{062A}\u{0649}".freeze,

    # FC75 ARABIC LIGATURE TEH WITH YEH FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC75}".freeze => "\u{062A}\u{064A}".freeze,

    # FC76 ARABIC LIGATURE THEH WITH REH FINAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0631 ARABIC LETTER REH
    "\u{FC76}".freeze => "\u{062B}\u{0631}".freeze,

    # FC77 ARABIC LIGATURE THEH WITH ZAIN FINAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0632 ARABIC LETTER ZAIN
    "\u{FC77}".freeze => "\u{062B}\u{0632}".freeze,

    # FC78 ARABIC LIGATURE THEH WITH MEEM FINAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC78}".freeze => "\u{062B}\u{0645}".freeze,

    # FC79 ARABIC LIGATURE THEH WITH NOON FINAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0646 ARABIC LETTER NOON
    "\u{FC79}".freeze => "\u{062B}\u{0646}".freeze,

    # FC7A ARABIC LIGATURE THEH WITH ALEF MAKSURA FINAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC7A}".freeze => "\u{062B}\u{0649}".freeze,

    # FC7B ARABIC LIGATURE THEH WITH YEH FINAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC7B}".freeze => "\u{062B}\u{064A}".freeze,

    # FC7C ARABIC LIGATURE FEH WITH ALEF MAKSURA FINAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC7C}".freeze => "\u{0641}\u{0649}".freeze,

    # FC7D ARABIC LIGATURE FEH WITH YEH FINAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC7D}".freeze => "\u{0641}\u{064A}".freeze,

    # FC7E ARABIC LIGATURE QAF WITH ALEF MAKSURA FINAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC7E}".freeze => "\u{0642}\u{0649}".freeze,

    # FC7F ARABIC LIGATURE QAF WITH YEH FINAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 064A ARABIC LETTER YEH
    "\u{FC7F}".freeze => "\u{0642}\u{064A}".freeze,

    # FC80 ARABIC LIGATURE KAF WITH ALEF FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0627 ARABIC LETTER ALEF
    "\u{FC80}".freeze => "\u{0643}\u{0627}".freeze,

    # FC81 ARABIC LIGATURE KAF WITH LAM FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0644 ARABIC LETTER LAM
    "\u{FC81}".freeze => "\u{0643}\u{0644}".freeze,

    # FC82 ARABIC LIGATURE KAF WITH MEEM FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC82}".freeze => "\u{0643}\u{0645}".freeze,

    # FC83 ARABIC LIGATURE KAF WITH ALEF MAKSURA FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC83}".freeze => "\u{0643}\u{0649}".freeze,

    # FC84 ARABIC LIGATURE KAF WITH YEH FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 064A ARABIC LETTER YEH
    "\u{FC84}".freeze => "\u{0643}\u{064A}".freeze,

    # FC85 ARABIC LIGATURE LAM WITH MEEM FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC85}".freeze => "\u{0644}\u{0645}".freeze,

    # FC86 ARABIC LIGATURE LAM WITH ALEF MAKSURA FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC86}".freeze => "\u{0644}\u{0649}".freeze,

    # FC87 ARABIC LIGATURE LAM WITH YEH FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 064A ARABIC LETTER YEH
    "\u{FC87}".freeze => "\u{0644}\u{064A}".freeze,

    # FC88 ARABIC LIGATURE MEEM WITH ALEF FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FC88}".freeze => "\u{0645}\u{0627}".freeze,

    # FC89 ARABIC LIGATURE MEEM WITH MEEM FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC89}".freeze => "\u{0645}\u{0645}".freeze,

    # FC8A ARABIC LIGATURE NOON WITH REH FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0631 ARABIC LETTER REH
    "\u{FC8A}".freeze => "\u{0646}\u{0631}".freeze,

    # FC8B ARABIC LIGATURE NOON WITH ZAIN FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0632 ARABIC LETTER ZAIN
    "\u{FC8B}".freeze => "\u{0646}\u{0632}".freeze,

    # FC8C ARABIC LIGATURE NOON WITH MEEM FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC8C}".freeze => "\u{0646}\u{0645}".freeze,

    # FC8D ARABIC LIGATURE NOON WITH NOON FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0646 ARABIC LETTER NOON
    "\u{FC8D}".freeze => "\u{0646}\u{0646}".freeze,

    # FC8E ARABIC LIGATURE NOON WITH ALEF MAKSURA FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC8E}".freeze => "\u{0646}\u{0649}".freeze,

    # FC8F ARABIC LIGATURE NOON WITH YEH FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 064A ARABIC LETTER YEH
    "\u{FC8F}".freeze => "\u{0646}\u{064A}".freeze,

    # FC90 ARABIC LIGATURE ALEF MAKSURA WITH SUPERSCRIPT ALEF FINAL FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC90}".freeze => "\u{0649}".freeze,

    # FC91 ARABIC LIGATURE YEH WITH REH FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0631 ARABIC LETTER REH
    "\u{FC91}".freeze => "\u{064A}\u{0631}".freeze,

    # FC92 ARABIC LIGATURE YEH WITH ZAIN FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0632 ARABIC LETTER ZAIN
    "\u{FC92}".freeze => "\u{064A}\u{0632}".freeze,

    # FC93 ARABIC LIGATURE YEH WITH MEEM FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC93}".freeze => "\u{064A}\u{0645}".freeze,

    # FC94 ARABIC LIGATURE YEH WITH NOON FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0646 ARABIC LETTER NOON
    "\u{FC94}".freeze => "\u{064A}\u{0646}".freeze,

    # FC95 ARABIC LIGATURE YEH WITH ALEF MAKSURA FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FC95}".freeze => "\u{064A}\u{0649}".freeze,

    # FC96 ARABIC LIGATURE YEH WITH YEH FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC96}".freeze => "\u{064A}\u{064A}".freeze,

    # FC97 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH JEEM INITIAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FC97}".freeze => "\u{062C}\u{064A}".freeze,

    # FC98 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH HAH INITIAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FC98}".freeze => "\u{062D}\u{064A}".freeze,

    # FC99 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH KHAH INITIAL FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 064A ARABIC LETTER YEH
    "\u{FC99}".freeze => "\u{062E}\u{064A}".freeze,

    # FC9A ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH MEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FC9A}".freeze => "\u{0645}\u{064A}".freeze,

    # FC9B ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH HEH INITIAL FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 064A ARABIC LETTER YEH
    "\u{FC9B}".freeze => "\u{0647}\u{064A}".freeze,

    # FC9C ARABIC LIGATURE BEH WITH JEEM INITIAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FC9C}".freeze => "\u{0628}\u{062C}".freeze,

    # FC9D ARABIC LIGATURE BEH WITH HAH INITIAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062D ARABIC LETTER HAH
    "\u{FC9D}".freeze => "\u{0628}\u{062D}".freeze,

    # FC9E ARABIC LIGATURE BEH WITH KHAH INITIAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FC9E}".freeze => "\u{0628}\u{062E}".freeze,

    # FC9F ARABIC LIGATURE BEH WITH MEEM INITIAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FC9F}".freeze => "\u{0628}\u{0645}".freeze,

    # FCA0 ARABIC LIGATURE BEH WITH HEH INITIAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FCA0}".freeze => "\u{0628}\u{0647}".freeze,

    # FCA1 ARABIC LIGATURE TEH WITH JEEM INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FCA1}".freeze => "\u{062A}\u{062C}".freeze,

    # FCA2 ARABIC LIGATURE TEH WITH HAH INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062D ARABIC LETTER HAH
    "\u{FCA2}".freeze => "\u{062A}\u{062D}".freeze,

    # FCA3 ARABIC LIGATURE TEH WITH KHAH INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FCA3}".freeze => "\u{062A}\u{062E}".freeze,

    # FCA4 ARABIC LIGATURE TEH WITH MEEM INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCA4}".freeze => "\u{062A}\u{0645}".freeze,

    # FCA5 ARABIC LIGATURE TEH WITH HEH INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FCA5}".freeze => "\u{062A}\u{0647}".freeze,

    # FCA6 ARABIC LIGATURE THEH WITH MEEM INITIAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCA6}".freeze => "\u{062B}\u{0645}".freeze,

    # FCA7 ARABIC LIGATURE JEEM WITH HAH INITIAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FCA7}".freeze => "\u{062C}\u{062D}".freeze,

    # FCA8 ARABIC LIGATURE JEEM WITH MEEM INITIAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCA8}".freeze => "\u{062C}\u{0645}".freeze,

    # FCA9 ARABIC LIGATURE HAH WITH JEEM INITIAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FCA9}".freeze => "\u{062D}\u{062C}".freeze,

    # FCAA ARABIC LIGATURE HAH WITH MEEM INITIAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCAA}".freeze => "\u{062D}\u{0645}".freeze,

    # FCAB ARABIC LIGATURE KHAH WITH JEEM INITIAL FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FCAB}".freeze => "\u{062E}\u{062C}".freeze,

    # FCAC ARABIC LIGATURE KHAH WITH MEEM INITIAL FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCAC}".freeze => "\u{062E}\u{0645}".freeze,

    # FCAD ARABIC LIGATURE SEEN WITH JEEM INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062C ARABIC LETTER JEEM
    "\u{FCAD}".freeze => "\u{0633}\u{062C}".freeze,

    # FCAE ARABIC LIGATURE SEEN WITH HAH INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062D ARABIC LETTER HAH
    "\u{FCAE}".freeze => "\u{0633}\u{062D}".freeze,

    # FCAF ARABIC LIGATURE SEEN WITH KHAH INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062E ARABIC LETTER KHAH
    "\u{FCAF}".freeze => "\u{0633}\u{062E}".freeze,

    # FCB0 ARABIC LIGATURE SEEN WITH MEEM INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCB0}".freeze => "\u{0633}\u{0645}".freeze,

    # FCB1 ARABIC LIGATURE SAD WITH HAH INITIAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 062D ARABIC LETTER HAH
    "\u{FCB1}".freeze => "\u{0635}\u{062D}".freeze,

    # FCB2 ARABIC LIGATURE SAD WITH KHAH INITIAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 062E ARABIC LETTER KHAH
    "\u{FCB2}".freeze => "\u{0635}\u{062E}".freeze,

    # FCB3 ARABIC LIGATURE SAD WITH MEEM INITIAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCB3}".freeze => "\u{0635}\u{0645}".freeze,

    # FCB4 ARABIC LIGATURE DAD WITH JEEM INITIAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062C ARABIC LETTER JEEM
    "\u{FCB4}".freeze => "\u{0636}\u{062C}".freeze,

    # FCB5 ARABIC LIGATURE DAD WITH HAH INITIAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062D ARABIC LETTER HAH
    "\u{FCB5}".freeze => "\u{0636}\u{062D}".freeze,

    # FCB6 ARABIC LIGATURE DAD WITH KHAH INITIAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062E ARABIC LETTER KHAH
    "\u{FCB6}".freeze => "\u{0636}\u{062E}".freeze,

    # FCB7 ARABIC LIGATURE DAD WITH MEEM INITIAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCB7}".freeze => "\u{0636}\u{0645}".freeze,

    # FCB8 ARABIC LIGATURE TAH WITH HAH INITIAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 062D ARABIC LETTER HAH
    "\u{FCB8}".freeze => "\u{0637}\u{062D}".freeze,

    # FCB9 ARABIC LIGATURE ZAH WITH MEEM INITIAL FORM
    # ->   0638 ARABIC LETTER ZAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCB9}".freeze => "\u{0638}\u{0645}".freeze,

    # FCBA ARABIC LIGATURE AIN WITH JEEM INITIAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 062C ARABIC LETTER JEEM
    "\u{FCBA}".freeze => "\u{0639}\u{062C}".freeze,

    # FCBB ARABIC LIGATURE AIN WITH MEEM INITIAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCBB}".freeze => "\u{0639}\u{0645}".freeze,

    # FCBC ARABIC LIGATURE GHAIN WITH JEEM INITIAL FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 062C ARABIC LETTER JEEM
    "\u{FCBC}".freeze => "\u{063A}\u{062C}".freeze,

    # FCBD ARABIC LIGATURE GHAIN WITH MEEM INITIAL FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCBD}".freeze => "\u{063A}\u{0645}".freeze,

    # FCBE ARABIC LIGATURE FEH WITH JEEM INITIAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FCBE}".freeze => "\u{0641}\u{062C}".freeze,

    # FCBF ARABIC LIGATURE FEH WITH HAH INITIAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062D ARABIC LETTER HAH
    "\u{FCBF}".freeze => "\u{0641}\u{062D}".freeze,

    # FCC0 ARABIC LIGATURE FEH WITH KHAH INITIAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FCC0}".freeze => "\u{0641}\u{062E}".freeze,

    # FCC1 ARABIC LIGATURE FEH WITH MEEM INITIAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCC1}".freeze => "\u{0641}\u{0645}".freeze,

    # FCC2 ARABIC LIGATURE QAF WITH HAH INITIAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 062D ARABIC LETTER HAH
    "\u{FCC2}".freeze => "\u{0642}\u{062D}".freeze,

    # FCC3 ARABIC LIGATURE QAF WITH MEEM INITIAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCC3}".freeze => "\u{0642}\u{0645}".freeze,

    # FCC4 ARABIC LIGATURE KAF WITH JEEM INITIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 062C ARABIC LETTER JEEM
    "\u{FCC4}".freeze => "\u{0643}\u{062C}".freeze,

    # FCC5 ARABIC LIGATURE KAF WITH HAH INITIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 062D ARABIC LETTER HAH
    "\u{FCC5}".freeze => "\u{0643}\u{062D}".freeze,

    # FCC6 ARABIC LIGATURE KAF WITH KHAH INITIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 062E ARABIC LETTER KHAH
    "\u{FCC6}".freeze => "\u{0643}\u{062E}".freeze,

    # FCC7 ARABIC LIGATURE KAF WITH LAM INITIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0644 ARABIC LETTER LAM
    "\u{FCC7}".freeze => "\u{0643}\u{0644}".freeze,

    # FCC8 ARABIC LIGATURE KAF WITH MEEM INITIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCC8}".freeze => "\u{0643}\u{0645}".freeze,

    # FCC9 ARABIC LIGATURE LAM WITH JEEM INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062C ARABIC LETTER JEEM
    "\u{FCC9}".freeze => "\u{0644}\u{062C}".freeze,

    # FCCA ARABIC LIGATURE LAM WITH HAH INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062D ARABIC LETTER HAH
    "\u{FCCA}".freeze => "\u{0644}\u{062D}".freeze,

    # FCCB ARABIC LIGATURE LAM WITH KHAH INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062E ARABIC LETTER KHAH
    "\u{FCCB}".freeze => "\u{0644}\u{062E}".freeze,

    # FCCC ARABIC LIGATURE LAM WITH MEEM INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCCC}".freeze => "\u{0644}\u{0645}".freeze,

    # FCCD ARABIC LIGATURE LAM WITH HEH INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0647 ARABIC LETTER HEH
    "\u{FCCD}".freeze => "\u{0644}\u{0647}".freeze,

    # FCCE ARABIC LIGATURE MEEM WITH JEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    "\u{FCCE}".freeze => "\u{0645}\u{062C}".freeze,

    # FCCF ARABIC LIGATURE MEEM WITH HAH INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FCCF}".freeze => "\u{0645}\u{062D}".freeze,

    # FCD0 ARABIC LIGATURE MEEM WITH KHAH INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    "\u{FCD0}".freeze => "\u{0645}\u{062E}".freeze,

    # FCD1 ARABIC LIGATURE MEEM WITH MEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCD1}".freeze => "\u{0645}\u{0645}".freeze,

    # FCD2 ARABIC LIGATURE NOON WITH JEEM INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    "\u{FCD2}".freeze => "\u{0646}\u{062C}".freeze,

    # FCD3 ARABIC LIGATURE NOON WITH HAH INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062D ARABIC LETTER HAH
    "\u{FCD3}".freeze => "\u{0646}\u{062D}".freeze,

    # FCD4 ARABIC LIGATURE NOON WITH KHAH INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062E ARABIC LETTER KHAH
    "\u{FCD4}".freeze => "\u{0646}\u{062E}".freeze,

    # FCD5 ARABIC LIGATURE NOON WITH MEEM INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCD5}".freeze => "\u{0646}\u{0645}".freeze,

    # FCD6 ARABIC LIGATURE NOON WITH HEH INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0647 ARABIC LETTER HEH
    "\u{FCD6}".freeze => "\u{0646}\u{0647}".freeze,

    # FCD7 ARABIC LIGATURE HEH WITH JEEM INITIAL FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FCD7}".freeze => "\u{0647}\u{062C}".freeze,

    # FCD8 ARABIC LIGATURE HEH WITH MEEM INITIAL FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCD8}".freeze => "\u{0647}\u{0645}".freeze,

    # FCD9 ARABIC LIGATURE HEH WITH SUPERSCRIPT ALEF INITIAL FORM
    # ->   0647 ARABIC LETTER HEH
    "\u{FCD9}".freeze => "\u{0647}".freeze,

    # FCDA ARABIC LIGATURE YEH WITH JEEM INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062C ARABIC LETTER JEEM
    "\u{FCDA}".freeze => "\u{064A}\u{062C}".freeze,

    # FCDB ARABIC LIGATURE YEH WITH HAH INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062D ARABIC LETTER HAH
    "\u{FCDB}".freeze => "\u{064A}\u{062D}".freeze,

    # FCDC ARABIC LIGATURE YEH WITH KHAH INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062E ARABIC LETTER KHAH
    "\u{FCDC}".freeze => "\u{064A}\u{062E}".freeze,

    # FCDD ARABIC LIGATURE YEH WITH MEEM INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCDD}".freeze => "\u{064A}\u{0645}".freeze,

    # FCDE ARABIC LIGATURE YEH WITH HEH INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FCDE}".freeze => "\u{064A}\u{0647}".freeze,

    # FCDF ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH MEEM MEDIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FCDF}".freeze => "\u{0645}\u{064A}".freeze,

    # FCE0 ARABIC LIGATURE YEH WITH HAMZA ABOVE WITH HEH MEDIAL FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 064A ARABIC LETTER YEH
    "\u{FCE0}".freeze => "\u{0647}\u{064A}".freeze,

    # FCE1 ARABIC LIGATURE BEH WITH MEEM MEDIAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCE1}".freeze => "\u{0628}\u{0645}".freeze,

    # FCE2 ARABIC LIGATURE BEH WITH HEH MEDIAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FCE2}".freeze => "\u{0628}\u{0647}".freeze,

    # FCE3 ARABIC LIGATURE TEH WITH MEEM MEDIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCE3}".freeze => "\u{062A}\u{0645}".freeze,

    # FCE4 ARABIC LIGATURE TEH WITH HEH MEDIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FCE4}".freeze => "\u{062A}\u{0647}".freeze,

    # FCE5 ARABIC LIGATURE THEH WITH MEEM MEDIAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCE5}".freeze => "\u{062B}\u{0645}".freeze,

    # FCE6 ARABIC LIGATURE THEH WITH HEH MEDIAL FORM
    # ->   062B ARABIC LETTER THEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FCE6}".freeze => "\u{062B}\u{0647}".freeze,

    # FCE7 ARABIC LIGATURE SEEN WITH MEEM MEDIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCE7}".freeze => "\u{0633}\u{0645}".freeze,

    # FCE8 ARABIC LIGATURE SEEN WITH HEH MEDIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0647 ARABIC LETTER HEH
    "\u{FCE8}".freeze => "\u{0633}\u{0647}".freeze,

    # FCE9 ARABIC LIGATURE SHEEN WITH MEEM MEDIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCE9}".freeze => "\u{0634}\u{0645}".freeze,

    # FCEA ARABIC LIGATURE SHEEN WITH HEH MEDIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0647 ARABIC LETTER HEH
    "\u{FCEA}".freeze => "\u{0634}\u{0647}".freeze,

    # FCEB ARABIC LIGATURE KAF WITH LAM MEDIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0644 ARABIC LETTER LAM
    "\u{FCEB}".freeze => "\u{0643}\u{0644}".freeze,

    # FCEC ARABIC LIGATURE KAF WITH MEEM MEDIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCEC}".freeze => "\u{0643}\u{0645}".freeze,

    # FCED ARABIC LIGATURE LAM WITH MEEM MEDIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCED}".freeze => "\u{0644}\u{0645}".freeze,

    # FCEE ARABIC LIGATURE NOON WITH MEEM MEDIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCEE}".freeze => "\u{0646}\u{0645}".freeze,

    # FCEF ARABIC LIGATURE NOON WITH HEH MEDIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0647 ARABIC LETTER HEH
    "\u{FCEF}".freeze => "\u{0646}\u{0647}".freeze,

    # FCF0 ARABIC LIGATURE YEH WITH MEEM MEDIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FCF0}".freeze => "\u{064A}\u{0645}".freeze,

    # FCF1 ARABIC LIGATURE YEH WITH HEH MEDIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FCF1}".freeze => "\u{064A}\u{0647}".freeze,

    # FCF2 ARABIC LIGATURE SHADDA WITH FATHA MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FCF2}".freeze => "\u{0640}".freeze,

    # FCF3 ARABIC LIGATURE SHADDA WITH DAMMA MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FCF3}".freeze => "\u{0640}".freeze,

    # FCF4 ARABIC LIGATURE SHADDA WITH KASRA MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FCF4}".freeze => "\u{0640}".freeze,

    # FCF5 ARABIC LIGATURE TAH WITH ALEF MAKSURA ISOLATED FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FCF5}".freeze => "\u{0637}\u{0649}".freeze,

    # FCF6 ARABIC LIGATURE TAH WITH YEH ISOLATED FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 064A ARABIC LETTER YEH
    "\u{FCF6}".freeze => "\u{0637}\u{064A}".freeze,

    # FCF7 ARABIC LIGATURE AIN WITH ALEF MAKSURA ISOLATED FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FCF7}".freeze => "\u{0639}\u{0649}".freeze,

    # FCF8 ARABIC LIGATURE AIN WITH YEH ISOLATED FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 064A ARABIC LETTER YEH
    "\u{FCF8}".freeze => "\u{0639}\u{064A}".freeze,

    # FCF9 ARABIC LIGATURE GHAIN WITH ALEF MAKSURA ISOLATED FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FCF9}".freeze => "\u{063A}\u{0649}".freeze,

    # FCFA ARABIC LIGATURE GHAIN WITH YEH ISOLATED FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 064A ARABIC LETTER YEH
    "\u{FCFA}".freeze => "\u{063A}\u{064A}".freeze,

    # FCFB ARABIC LIGATURE SEEN WITH ALEF MAKSURA ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FCFB}".freeze => "\u{0633}\u{0649}".freeze,

    # FCFC ARABIC LIGATURE SEEN WITH YEH ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 064A ARABIC LETTER YEH
    "\u{FCFC}".freeze => "\u{0633}\u{064A}".freeze,

    # FCFD ARABIC LIGATURE SHEEN WITH ALEF MAKSURA ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FCFD}".freeze => "\u{0634}\u{0649}".freeze,

    # FCFE ARABIC LIGATURE SHEEN WITH YEH ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 064A ARABIC LETTER YEH
    "\u{FCFE}".freeze => "\u{0634}\u{064A}".freeze,

    # FCFF ARABIC LIGATURE HAH WITH ALEF MAKSURA ISOLATED FORM
    # ->   062D ARABIC LETTER HAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FCFF}".freeze => "\u{062D}\u{0649}".freeze,

    # FD00 ARABIC LIGATURE HAH WITH YEH ISOLATED FORM
    # ->   062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD00}".freeze => "\u{062D}\u{064A}".freeze,

    # FD01 ARABIC LIGATURE JEEM WITH ALEF MAKSURA ISOLATED FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD01}".freeze => "\u{062C}\u{0649}".freeze,

    # FD02 ARABIC LIGATURE JEEM WITH YEH ISOLATED FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD02}".freeze => "\u{062C}\u{064A}".freeze,

    # FD03 ARABIC LIGATURE KHAH WITH ALEF MAKSURA ISOLATED FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD03}".freeze => "\u{062E}\u{0649}".freeze,

    # FD04 ARABIC LIGATURE KHAH WITH YEH ISOLATED FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD04}".freeze => "\u{062E}\u{064A}".freeze,

    # FD05 ARABIC LIGATURE SAD WITH ALEF MAKSURA ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD05}".freeze => "\u{0635}\u{0649}".freeze,

    # FD06 ARABIC LIGATURE SAD WITH YEH ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 064A ARABIC LETTER YEH
    "\u{FD06}".freeze => "\u{0635}\u{064A}".freeze,

    # FD07 ARABIC LIGATURE DAD WITH ALEF MAKSURA ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD07}".freeze => "\u{0636}\u{0649}".freeze,

    # FD08 ARABIC LIGATURE DAD WITH YEH ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 064A ARABIC LETTER YEH
    "\u{FD08}".freeze => "\u{0636}\u{064A}".freeze,

    # FD09 ARABIC LIGATURE SHEEN WITH JEEM ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062C ARABIC LETTER JEEM
    "\u{FD09}".freeze => "\u{0634}\u{062C}".freeze,

    # FD0A ARABIC LIGATURE SHEEN WITH HAH ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062D ARABIC LETTER HAH
    "\u{FD0A}".freeze => "\u{0634}\u{062D}".freeze,

    # FD0B ARABIC LIGATURE SHEEN WITH KHAH ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062E ARABIC LETTER KHAH
    "\u{FD0B}".freeze => "\u{0634}\u{062E}".freeze,

    # FD0C ARABIC LIGATURE SHEEN WITH MEEM ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD0C}".freeze => "\u{0634}\u{0645}".freeze,

    # FD0D ARABIC LIGATURE SHEEN WITH REH ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0631 ARABIC LETTER REH
    "\u{FD0D}".freeze => "\u{0634}\u{0631}".freeze,

    # FD0E ARABIC LIGATURE SEEN WITH REH ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0631 ARABIC LETTER REH
    "\u{FD0E}".freeze => "\u{0633}\u{0631}".freeze,

    # FD0F ARABIC LIGATURE SAD WITH REH ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0631 ARABIC LETTER REH
    "\u{FD0F}".freeze => "\u{0635}\u{0631}".freeze,

    # FD10 ARABIC LIGATURE DAD WITH REH ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 0631 ARABIC LETTER REH
    "\u{FD10}".freeze => "\u{0636}\u{0631}".freeze,

    # FD11 ARABIC LIGATURE TAH WITH ALEF MAKSURA FINAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD11}".freeze => "\u{0637}\u{0649}".freeze,

    # FD12 ARABIC LIGATURE TAH WITH YEH FINAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD12}".freeze => "\u{0637}\u{064A}".freeze,

    # FD13 ARABIC LIGATURE AIN WITH ALEF MAKSURA FINAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD13}".freeze => "\u{0639}\u{0649}".freeze,

    # FD14 ARABIC LIGATURE AIN WITH YEH FINAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 064A ARABIC LETTER YEH
    "\u{FD14}".freeze => "\u{0639}\u{064A}".freeze,

    # FD15 ARABIC LIGATURE GHAIN WITH ALEF MAKSURA FINAL FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD15}".freeze => "\u{063A}\u{0649}".freeze,

    # FD16 ARABIC LIGATURE GHAIN WITH YEH FINAL FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 064A ARABIC LETTER YEH
    "\u{FD16}".freeze => "\u{063A}\u{064A}".freeze,

    # FD17 ARABIC LIGATURE SEEN WITH ALEF MAKSURA FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD17}".freeze => "\u{0633}\u{0649}".freeze,

    # FD18 ARABIC LIGATURE SEEN WITH YEH FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 064A ARABIC LETTER YEH
    "\u{FD18}".freeze => "\u{0633}\u{064A}".freeze,

    # FD19 ARABIC LIGATURE SHEEN WITH ALEF MAKSURA FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD19}".freeze => "\u{0634}\u{0649}".freeze,

    # FD1A ARABIC LIGATURE SHEEN WITH YEH FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 064A ARABIC LETTER YEH
    "\u{FD1A}".freeze => "\u{0634}\u{064A}".freeze,

    # FD1B ARABIC LIGATURE HAH WITH ALEF MAKSURA FINAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD1B}".freeze => "\u{062D}\u{0649}".freeze,

    # FD1C ARABIC LIGATURE HAH WITH YEH FINAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD1C}".freeze => "\u{062D}\u{064A}".freeze,

    # FD1D ARABIC LIGATURE JEEM WITH ALEF MAKSURA FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD1D}".freeze => "\u{062C}\u{0649}".freeze,

    # FD1E ARABIC LIGATURE JEEM WITH YEH FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD1E}".freeze => "\u{062C}\u{064A}".freeze,

    # FD1F ARABIC LIGATURE KHAH WITH ALEF MAKSURA FINAL FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD1F}".freeze => "\u{062E}\u{0649}".freeze,

    # FD20 ARABIC LIGATURE KHAH WITH YEH FINAL FORM
    # ->   062E ARABIC LETTER KHAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD20}".freeze => "\u{062E}\u{064A}".freeze,

    # FD21 ARABIC LIGATURE SAD WITH ALEF MAKSURA FINAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD21}".freeze => "\u{0635}\u{0649}".freeze,

    # FD22 ARABIC LIGATURE SAD WITH YEH FINAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 064A ARABIC LETTER YEH
    "\u{FD22}".freeze => "\u{0635}\u{064A}".freeze,

    # FD23 ARABIC LIGATURE DAD WITH ALEF MAKSURA FINAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD23}".freeze => "\u{0636}\u{0649}".freeze,

    # FD24 ARABIC LIGATURE DAD WITH YEH FINAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 064A ARABIC LETTER YEH
    "\u{FD24}".freeze => "\u{0636}\u{064A}".freeze,

    # FD25 ARABIC LIGATURE SHEEN WITH JEEM FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062C ARABIC LETTER JEEM
    "\u{FD25}".freeze => "\u{0634}\u{062C}".freeze,

    # FD26 ARABIC LIGATURE SHEEN WITH HAH FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062D ARABIC LETTER HAH
    "\u{FD26}".freeze => "\u{0634}\u{062D}".freeze,

    # FD27 ARABIC LIGATURE SHEEN WITH KHAH FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062E ARABIC LETTER KHAH
    "\u{FD27}".freeze => "\u{0634}\u{062E}".freeze,

    # FD28 ARABIC LIGATURE SHEEN WITH MEEM FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD28}".freeze => "\u{0634}\u{0645}".freeze,

    # FD29 ARABIC LIGATURE SHEEN WITH REH FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0631 ARABIC LETTER REH
    "\u{FD29}".freeze => "\u{0634}\u{0631}".freeze,

    # FD2A ARABIC LIGATURE SEEN WITH REH FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0631 ARABIC LETTER REH
    "\u{FD2A}".freeze => "\u{0633}\u{0631}".freeze,

    # FD2B ARABIC LIGATURE SAD WITH REH FINAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0631 ARABIC LETTER REH
    "\u{FD2B}".freeze => "\u{0635}\u{0631}".freeze,

    # FD2C ARABIC LIGATURE DAD WITH REH FINAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 0631 ARABIC LETTER REH
    "\u{FD2C}".freeze => "\u{0636}\u{0631}".freeze,

    # FD2D ARABIC LIGATURE SHEEN WITH JEEM INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062C ARABIC LETTER JEEM
    "\u{FD2D}".freeze => "\u{0634}\u{062C}".freeze,

    # FD2E ARABIC LIGATURE SHEEN WITH HAH INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062D ARABIC LETTER HAH
    "\u{FD2E}".freeze => "\u{0634}\u{062D}".freeze,

    # FD2F ARABIC LIGATURE SHEEN WITH KHAH INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062E ARABIC LETTER KHAH
    "\u{FD2F}".freeze => "\u{0634}\u{062E}".freeze,

    # FD30 ARABIC LIGATURE SHEEN WITH MEEM INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD30}".freeze => "\u{0634}\u{0645}".freeze,

    # FD31 ARABIC LIGATURE SEEN WITH HEH INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0647 ARABIC LETTER HEH
    "\u{FD31}".freeze => "\u{0633}\u{0647}".freeze,

    # FD32 ARABIC LIGATURE SHEEN WITH HEH INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0647 ARABIC LETTER HEH
    "\u{FD32}".freeze => "\u{0634}\u{0647}".freeze,

    # FD33 ARABIC LIGATURE TAH WITH MEEM INITIAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD33}".freeze => "\u{0637}\u{0645}".freeze,

    # FD34 ARABIC LIGATURE SEEN WITH JEEM MEDIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062C ARABIC LETTER JEEM
    "\u{FD34}".freeze => "\u{0633}\u{062C}".freeze,

    # FD35 ARABIC LIGATURE SEEN WITH HAH MEDIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062D ARABIC LETTER HAH
    "\u{FD35}".freeze => "\u{0633}\u{062D}".freeze,

    # FD36 ARABIC LIGATURE SEEN WITH KHAH MEDIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062E ARABIC LETTER KHAH
    "\u{FD36}".freeze => "\u{0633}\u{062E}".freeze,

    # FD37 ARABIC LIGATURE SHEEN WITH JEEM MEDIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062C ARABIC LETTER JEEM
    "\u{FD37}".freeze => "\u{0634}\u{062C}".freeze,

    # FD38 ARABIC LIGATURE SHEEN WITH HAH MEDIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062D ARABIC LETTER HAH
    "\u{FD38}".freeze => "\u{0634}\u{062D}".freeze,

    # FD39 ARABIC LIGATURE SHEEN WITH KHAH MEDIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062E ARABIC LETTER KHAH
    "\u{FD39}".freeze => "\u{0634}\u{062E}".freeze,

    # FD3A ARABIC LIGATURE TAH WITH MEEM MEDIAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD3A}".freeze => "\u{0637}\u{0645}".freeze,

    # FD3B ARABIC LIGATURE ZAH WITH MEEM MEDIAL FORM
    # ->   0638 ARABIC LETTER ZAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD3B}".freeze => "\u{0638}\u{0645}".freeze,

    # FD3C ARABIC LIGATURE ALEF WITH FATHATAN FINAL FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FD3C}".freeze => "\u{0627}".freeze,

    # FD3D ARABIC LIGATURE ALEF WITH FATHATAN ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FD3D}".freeze => "\u{0627}".freeze,

    # FD50 ARABIC LIGATURE TEH WITH JEEM WITH MEEM INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD50}".freeze => "\u{062A}\u{062C}\u{0645}".freeze,

    # FD51 ARABIC LIGATURE TEH WITH HAH WITH JEEM FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062D ARABIC LETTER HAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FD51}".freeze => "\u{062A}\u{062D}\u{062C}".freeze,

    # FD52 ARABIC LIGATURE TEH WITH HAH WITH JEEM INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062D ARABIC LETTER HAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FD52}".freeze => "\u{062A}\u{062D}\u{062C}".freeze,

    # FD53 ARABIC LIGATURE TEH WITH HAH WITH MEEM INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD53}".freeze => "\u{062A}\u{062D}\u{0645}".freeze,

    # FD54 ARABIC LIGATURE TEH WITH KHAH WITH MEEM INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD54}".freeze => "\u{062A}\u{062E}\u{0645}".freeze,

    # FD55 ARABIC LIGATURE TEH WITH MEEM WITH JEEM INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    "\u{FD55}".freeze => "\u{062A}\u{0645}\u{062C}".freeze,

    # FD56 ARABIC LIGATURE TEH WITH MEEM WITH HAH INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD56}".freeze => "\u{062A}\u{0645}\u{062D}".freeze,

    # FD57 ARABIC LIGATURE TEH WITH MEEM WITH KHAH INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    "\u{FD57}".freeze => "\u{062A}\u{0645}\u{062E}".freeze,

    # FD58 ARABIC LIGATURE JEEM WITH MEEM WITH HAH FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD58}".freeze => "\u{062C}\u{0645}\u{062D}".freeze,

    # FD59 ARABIC LIGATURE JEEM WITH MEEM WITH HAH INITIAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD59}".freeze => "\u{062C}\u{0645}\u{062D}".freeze,

    # FD5A ARABIC LIGATURE HAH WITH MEEM WITH YEH FINAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD5A}".freeze => "\u{062D}\u{0645}\u{064A}".freeze,

    # FD5B ARABIC LIGATURE HAH WITH MEEM WITH ALEF MAKSURA FINAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD5B}".freeze => "\u{062D}\u{0645}\u{0649}".freeze,

    # FD5C ARABIC LIGATURE SEEN WITH HAH WITH JEEM INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062D ARABIC LETTER HAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FD5C}".freeze => "\u{0633}\u{062D}\u{062C}".freeze,

    # FD5D ARABIC LIGATURE SEEN WITH JEEM WITH HAH INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD5D}".freeze => "\u{0633}\u{062C}\u{062D}".freeze,

    # FD5E ARABIC LIGATURE SEEN WITH JEEM WITH ALEF MAKSURA FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062C ARABIC LETTER JEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD5E}".freeze => "\u{0633}\u{062C}\u{0649}".freeze,

    # FD5F ARABIC LIGATURE SEEN WITH MEEM WITH HAH FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD5F}".freeze => "\u{0633}\u{0645}\u{062D}".freeze,

    # FD60 ARABIC LIGATURE SEEN WITH MEEM WITH HAH INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD60}".freeze => "\u{0633}\u{0645}\u{062D}".freeze,

    # FD61 ARABIC LIGATURE SEEN WITH MEEM WITH JEEM INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    "\u{FD61}".freeze => "\u{0633}\u{0645}\u{062C}".freeze,

    # FD62 ARABIC LIGATURE SEEN WITH MEEM WITH MEEM FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD62}".freeze => "\u{0633}\u{0645}\u{0645}".freeze,

    # FD63 ARABIC LIGATURE SEEN WITH MEEM WITH MEEM INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD63}".freeze => "\u{0633}\u{0645}\u{0645}".freeze,

    # FD64 ARABIC LIGATURE SAD WITH HAH WITH HAH FINAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 062D ARABIC LETTER HAH
    #    + 062D ARABIC LETTER HAH
    "\u{FD64}".freeze => "\u{0635}\u{062D}\u{062D}".freeze,

    # FD65 ARABIC LIGATURE SAD WITH HAH WITH HAH INITIAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 062D ARABIC LETTER HAH
    #    + 062D ARABIC LETTER HAH
    "\u{FD65}".freeze => "\u{0635}\u{062D}\u{062D}".freeze,

    # FD66 ARABIC LIGATURE SAD WITH MEEM WITH MEEM FINAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD66}".freeze => "\u{0635}\u{0645}\u{0645}".freeze,

    # FD67 ARABIC LIGATURE SHEEN WITH HAH WITH MEEM FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD67}".freeze => "\u{0634}\u{062D}\u{0645}".freeze,

    # FD68 ARABIC LIGATURE SHEEN WITH HAH WITH MEEM INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD68}".freeze => "\u{0634}\u{062D}\u{0645}".freeze,

    # FD69 ARABIC LIGATURE SHEEN WITH JEEM WITH YEH FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD69}".freeze => "\u{0634}\u{062C}\u{064A}".freeze,

    # FD6A ARABIC LIGATURE SHEEN WITH MEEM WITH KHAH FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    "\u{FD6A}".freeze => "\u{0634}\u{0645}\u{062E}".freeze,

    # FD6B ARABIC LIGATURE SHEEN WITH MEEM WITH KHAH INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    "\u{FD6B}".freeze => "\u{0634}\u{0645}\u{062E}".freeze,

    # FD6C ARABIC LIGATURE SHEEN WITH MEEM WITH MEEM FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD6C}".freeze => "\u{0634}\u{0645}\u{0645}".freeze,

    # FD6D ARABIC LIGATURE SHEEN WITH MEEM WITH MEEM INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD6D}".freeze => "\u{0634}\u{0645}\u{0645}".freeze,

    # FD6E ARABIC LIGATURE DAD WITH HAH WITH ALEF MAKSURA FINAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062D ARABIC LETTER HAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD6E}".freeze => "\u{0636}\u{062D}\u{0649}".freeze,

    # FD6F ARABIC LIGATURE DAD WITH KHAH WITH MEEM FINAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD6F}".freeze => "\u{0636}\u{062E}\u{0645}".freeze,

    # FD70 ARABIC LIGATURE DAD WITH KHAH WITH MEEM INITIAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD70}".freeze => "\u{0636}\u{062E}\u{0645}".freeze,

    # FD71 ARABIC LIGATURE TAH WITH MEEM WITH HAH FINAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD71}".freeze => "\u{0637}\u{0645}\u{062D}".freeze,

    # FD72 ARABIC LIGATURE TAH WITH MEEM WITH HAH INITIAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD72}".freeze => "\u{0637}\u{0645}\u{062D}".freeze,

    # FD73 ARABIC LIGATURE TAH WITH MEEM WITH MEEM INITIAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD73}".freeze => "\u{0637}\u{0645}\u{0645}".freeze,

    # FD74 ARABIC LIGATURE TAH WITH MEEM WITH YEH FINAL FORM
    # ->   0637 ARABIC LETTER TAH
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD74}".freeze => "\u{0637}\u{0645}\u{064A}".freeze,

    # FD75 ARABIC LIGATURE AIN WITH JEEM WITH MEEM FINAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD75}".freeze => "\u{0639}\u{062C}\u{0645}".freeze,

    # FD76 ARABIC LIGATURE AIN WITH MEEM WITH MEEM FINAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD76}".freeze => "\u{0639}\u{0645}\u{0645}".freeze,

    # FD77 ARABIC LIGATURE AIN WITH MEEM WITH MEEM INITIAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD77}".freeze => "\u{0639}\u{0645}\u{0645}".freeze,

    # FD78 ARABIC LIGATURE AIN WITH MEEM WITH ALEF MAKSURA FINAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD78}".freeze => "\u{0639}\u{0645}\u{0649}".freeze,

    # FD79 ARABIC LIGATURE GHAIN WITH MEEM WITH MEEM FINAL FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD79}".freeze => "\u{063A}\u{0645}\u{0645}".freeze,

    # FD7A ARABIC LIGATURE GHAIN WITH MEEM WITH YEH FINAL FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD7A}".freeze => "\u{063A}\u{0645}\u{064A}".freeze,

    # FD7B ARABIC LIGATURE GHAIN WITH MEEM WITH ALEF MAKSURA FINAL FORM
    # ->   063A ARABIC LETTER GHAIN
    #    + 0645 ARABIC LETTER MEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD7B}".freeze => "\u{063A}\u{0645}\u{0649}".freeze,

    # FD7C ARABIC LIGATURE FEH WITH KHAH WITH MEEM FINAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD7C}".freeze => "\u{0641}\u{062E}\u{0645}".freeze,

    # FD7D ARABIC LIGATURE FEH WITH KHAH WITH MEEM INITIAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD7D}".freeze => "\u{0641}\u{062E}\u{0645}".freeze,

    # FD7E ARABIC LIGATURE QAF WITH MEEM WITH HAH FINAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD7E}".freeze => "\u{0642}\u{0645}\u{062D}".freeze,

    # FD7F ARABIC LIGATURE QAF WITH MEEM WITH MEEM FINAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD7F}".freeze => "\u{0642}\u{0645}\u{0645}".freeze,

    # FD80 ARABIC LIGATURE LAM WITH HAH WITH MEEM FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD80}".freeze => "\u{0644}\u{062D}\u{0645}".freeze,

    # FD81 ARABIC LIGATURE LAM WITH HAH WITH YEH FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD81}".freeze => "\u{0644}\u{062D}\u{064A}".freeze,

    # FD82 ARABIC LIGATURE LAM WITH HAH WITH ALEF MAKSURA FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062D ARABIC LETTER HAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD82}".freeze => "\u{0644}\u{062D}\u{0649}".freeze,

    # FD83 ARABIC LIGATURE LAM WITH JEEM WITH JEEM INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062C ARABIC LETTER JEEM
    #    + 062C ARABIC LETTER JEEM
    "\u{FD83}".freeze => "\u{0644}\u{062C}\u{062C}".freeze,

    # FD84 ARABIC LIGATURE LAM WITH JEEM WITH JEEM FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062C ARABIC LETTER JEEM
    #    + 062C ARABIC LETTER JEEM
    "\u{FD84}".freeze => "\u{0644}\u{062C}\u{062C}".freeze,

    # FD85 ARABIC LIGATURE LAM WITH KHAH WITH MEEM FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD85}".freeze => "\u{0644}\u{062E}\u{0645}".freeze,

    # FD86 ARABIC LIGATURE LAM WITH KHAH WITH MEEM INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD86}".freeze => "\u{0644}\u{062E}\u{0645}".freeze,

    # FD87 ARABIC LIGATURE LAM WITH MEEM WITH HAH FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD87}".freeze => "\u{0644}\u{0645}\u{062D}".freeze,

    # FD88 ARABIC LIGATURE LAM WITH MEEM WITH HAH INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD88}".freeze => "\u{0644}\u{0645}\u{062D}".freeze,

    # FD89 ARABIC LIGATURE MEEM WITH HAH WITH JEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FD89}".freeze => "\u{0645}\u{062D}\u{062C}".freeze,

    # FD8A ARABIC LIGATURE MEEM WITH HAH WITH MEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD8A}".freeze => "\u{0645}\u{062D}\u{0645}".freeze,

    # FD8B ARABIC LIGATURE MEEM WITH HAH WITH YEH FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD8B}".freeze => "\u{0645}\u{062D}\u{064A}".freeze,

    # FD8C ARABIC LIGATURE MEEM WITH JEEM WITH HAH INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FD8C}".freeze => "\u{0645}\u{062C}\u{062D}".freeze,

    # FD8D ARABIC LIGATURE MEEM WITH JEEM WITH MEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD8D}".freeze => "\u{0645}\u{062C}\u{0645}".freeze,

    # FD8E ARABIC LIGATURE MEEM WITH KHAH WITH JEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    #    + 062C ARABIC LETTER JEEM
    "\u{FD8E}".freeze => "\u{0645}\u{062E}\u{062C}".freeze,

    # FD8F ARABIC LIGATURE MEEM WITH KHAH WITH MEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD8F}".freeze => "\u{0645}\u{062E}\u{0645}".freeze,

    # FD92 ARABIC LIGATURE MEEM WITH JEEM WITH KHAH INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    #    + 062E ARABIC LETTER KHAH
    "\u{FD92}".freeze => "\u{0645}\u{062C}\u{062E}".freeze,

    # FD93 ARABIC LIGATURE HEH WITH MEEM WITH JEEM INITIAL FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    "\u{FD93}".freeze => "\u{0647}\u{0645}\u{062C}".freeze,

    # FD94 ARABIC LIGATURE HEH WITH MEEM WITH MEEM INITIAL FORM
    # ->   0647 ARABIC LETTER HEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD94}".freeze => "\u{0647}\u{0645}\u{0645}".freeze,

    # FD95 ARABIC LIGATURE NOON WITH HAH WITH MEEM INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD95}".freeze => "\u{0646}\u{062D}\u{0645}".freeze,

    # FD96 ARABIC LIGATURE NOON WITH HAH WITH ALEF MAKSURA FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062D ARABIC LETTER HAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD96}".freeze => "\u{0646}\u{062D}\u{0649}".freeze,

    # FD97 ARABIC LIGATURE NOON WITH JEEM WITH MEEM FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD97}".freeze => "\u{0646}\u{062C}\u{0645}".freeze,

    # FD98 ARABIC LIGATURE NOON WITH JEEM WITH MEEM INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD98}".freeze => "\u{0646}\u{062C}\u{0645}".freeze,

    # FD99 ARABIC LIGATURE NOON WITH JEEM WITH ALEF MAKSURA FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD99}".freeze => "\u{0646}\u{062C}\u{0649}".freeze,

    # FD9A ARABIC LIGATURE NOON WITH MEEM WITH YEH FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD9A}".freeze => "\u{0646}\u{0645}\u{064A}".freeze,

    # FD9B ARABIC LIGATURE NOON WITH MEEM WITH ALEF MAKSURA FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 0645 ARABIC LETTER MEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FD9B}".freeze => "\u{0646}\u{0645}\u{0649}".freeze,

    # FD9C ARABIC LIGATURE YEH WITH MEEM WITH MEEM FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD9C}".freeze => "\u{064A}\u{0645}\u{0645}".freeze,

    # FD9D ARABIC LIGATURE YEH WITH MEEM WITH MEEM INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FD9D}".freeze => "\u{064A}\u{0645}\u{0645}".freeze,

    # FD9E ARABIC LIGATURE BEH WITH KHAH WITH YEH FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062E ARABIC LETTER KHAH
    #    + 064A ARABIC LETTER YEH
    "\u{FD9E}".freeze => "\u{0628}\u{062E}\u{064A}".freeze,

    # FD9F ARABIC LIGATURE TEH WITH JEEM WITH YEH FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FD9F}".freeze => "\u{062A}\u{062C}\u{064A}".freeze,

    # FDA0 ARABIC LIGATURE TEH WITH JEEM WITH ALEF MAKSURA FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062C ARABIC LETTER JEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FDA0}".freeze => "\u{062A}\u{062C}\u{0649}".freeze,

    # FDA1 ARABIC LIGATURE TEH WITH KHAH WITH YEH FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062E ARABIC LETTER KHAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDA1}".freeze => "\u{062A}\u{062E}\u{064A}".freeze,

    # FDA2 ARABIC LIGATURE TEH WITH KHAH WITH ALEF MAKSURA FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 062E ARABIC LETTER KHAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FDA2}".freeze => "\u{062A}\u{062E}\u{0649}".freeze,

    # FDA3 ARABIC LIGATURE TEH WITH MEEM WITH YEH FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDA3}".freeze => "\u{062A}\u{0645}\u{064A}".freeze,

    # FDA4 ARABIC LIGATURE TEH WITH MEEM WITH ALEF MAKSURA FINAL FORM
    # ->   062A ARABIC LETTER TEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FDA4}".freeze => "\u{062A}\u{0645}\u{0649}".freeze,

    # FDA5 ARABIC LIGATURE JEEM WITH MEEM WITH YEH FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDA5}".freeze => "\u{062C}\u{0645}\u{064A}".freeze,

    # FDA6 ARABIC LIGATURE JEEM WITH HAH WITH ALEF MAKSURA FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FDA6}".freeze => "\u{062C}\u{062D}\u{0649}".freeze,

    # FDA7 ARABIC LIGATURE JEEM WITH MEEM WITH ALEF MAKSURA FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FDA7}".freeze => "\u{062C}\u{0645}\u{0649}".freeze,

    # FDA8 ARABIC LIGATURE SEEN WITH KHAH WITH ALEF MAKSURA FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062E ARABIC LETTER KHAH
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FDA8}".freeze => "\u{0633}\u{062E}\u{0649}".freeze,

    # FDA9 ARABIC LIGATURE SAD WITH HAH WITH YEH FINAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDA9}".freeze => "\u{0635}\u{062D}\u{064A}".freeze,

    # FDAA ARABIC LIGATURE SHEEN WITH HAH WITH YEH FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDAA}".freeze => "\u{0634}\u{062D}\u{064A}".freeze,

    # FDAB ARABIC LIGATURE DAD WITH HAH WITH YEH FINAL FORM
    # ->   0636 ARABIC LETTER DAD
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDAB}".freeze => "\u{0636}\u{062D}\u{064A}".freeze,

    # FDAC ARABIC LIGATURE LAM WITH JEEM WITH YEH FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDAC}".freeze => "\u{0644}\u{062C}\u{064A}".freeze,

    # FDAD ARABIC LIGATURE LAM WITH MEEM WITH YEH FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDAD}".freeze => "\u{0644}\u{0645}\u{064A}".freeze,

    # FDAE ARABIC LIGATURE YEH WITH HAH WITH YEH FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDAE}".freeze => "\u{064A}\u{062D}\u{064A}".freeze,

    # FDAF ARABIC LIGATURE YEH WITH JEEM WITH YEH FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDAF}".freeze => "\u{064A}\u{062C}\u{064A}".freeze,

    # FDB0 ARABIC LIGATURE YEH WITH MEEM WITH YEH FINAL FORM
    # ->   064A ARABIC LETTER YEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDB0}".freeze => "\u{064A}\u{0645}\u{064A}".freeze,

    # FDB1 ARABIC LIGATURE MEEM WITH MEEM WITH YEH FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDB1}".freeze => "\u{0645}\u{0645}\u{064A}".freeze,

    # FDB2 ARABIC LIGATURE QAF WITH MEEM WITH YEH FINAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDB2}".freeze => "\u{0642}\u{0645}\u{064A}".freeze,

    # FDB3 ARABIC LIGATURE NOON WITH HAH WITH YEH FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDB3}".freeze => "\u{0646}\u{062D}\u{064A}".freeze,

    # FDB4 ARABIC LIGATURE QAF WITH MEEM WITH HAH INITIAL FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FDB4}".freeze => "\u{0642}\u{0645}\u{062D}".freeze,

    # FDB5 ARABIC LIGATURE LAM WITH HAH WITH MEEM INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDB5}".freeze => "\u{0644}\u{062D}\u{0645}".freeze,

    # FDB6 ARABIC LIGATURE AIN WITH MEEM WITH YEH FINAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDB6}".freeze => "\u{0639}\u{0645}\u{064A}".freeze,

    # FDB7 ARABIC LIGATURE KAF WITH MEEM WITH YEH FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDB7}".freeze => "\u{0643}\u{0645}\u{064A}".freeze,

    # FDB8 ARABIC LIGATURE NOON WITH JEEM WITH HAH INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FDB8}".freeze => "\u{0646}\u{062C}\u{062D}".freeze,

    # FDB9 ARABIC LIGATURE MEEM WITH KHAH WITH YEH FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062E ARABIC LETTER KHAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDB9}".freeze => "\u{0645}\u{062E}\u{064A}".freeze,

    # FDBA ARABIC LIGATURE LAM WITH JEEM WITH MEEM INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDBA}".freeze => "\u{0644}\u{062C}\u{0645}".freeze,

    # FDBB ARABIC LIGATURE KAF WITH MEEM WITH MEEM FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDBB}".freeze => "\u{0643}\u{0645}\u{0645}".freeze,

    # FDBC ARABIC LIGATURE LAM WITH JEEM WITH MEEM FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDBC}".freeze => "\u{0644}\u{062C}\u{0645}".freeze,

    # FDBD ARABIC LIGATURE NOON WITH JEEM WITH HAH FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    "\u{FDBD}".freeze => "\u{0646}\u{062C}\u{062D}".freeze,

    # FDBE ARABIC LIGATURE JEEM WITH HAH WITH YEH FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDBE}".freeze => "\u{062C}\u{062D}\u{064A}".freeze,

    # FDBF ARABIC LIGATURE HAH WITH JEEM WITH YEH FINAL FORM
    # ->   062D ARABIC LETTER HAH
    #    + 062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDBF}".freeze => "\u{062D}\u{062C}\u{064A}".freeze,

    # FDC0 ARABIC LIGATURE MEEM WITH JEEM WITH YEH FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDC0}".freeze => "\u{0645}\u{062C}\u{064A}".freeze,

    # FDC1 ARABIC LIGATURE FEH WITH MEEM WITH YEH FINAL FORM
    # ->   0641 ARABIC LETTER FEH
    #    + 0645 ARABIC LETTER MEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDC1}".freeze => "\u{0641}\u{0645}\u{064A}".freeze,

    # FDC2 ARABIC LIGATURE BEH WITH HAH WITH YEH FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    #    + 062D ARABIC LETTER HAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDC2}".freeze => "\u{0628}\u{062D}\u{064A}".freeze,

    # FDC3 ARABIC LIGATURE KAF WITH MEEM WITH MEEM INITIAL FORM
    # ->   0643 ARABIC LETTER KAF
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDC3}".freeze => "\u{0643}\u{0645}\u{0645}".freeze,

    # FDC4 ARABIC LIGATURE AIN WITH JEEM WITH MEEM INITIAL FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 062C ARABIC LETTER JEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDC4}".freeze => "\u{0639}\u{062C}\u{0645}".freeze,

    # FDC5 ARABIC LIGATURE SAD WITH MEEM WITH MEEM INITIAL FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0645 ARABIC LETTER MEEM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDC5}".freeze => "\u{0635}\u{0645}\u{0645}".freeze,

    # FDC6 ARABIC LIGATURE SEEN WITH KHAH WITH YEH FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    #    + 062E ARABIC LETTER KHAH
    #    + 064A ARABIC LETTER YEH
    "\u{FDC6}".freeze => "\u{0633}\u{062E}\u{064A}".freeze,

    # FDC7 ARABIC LIGATURE NOON WITH JEEM WITH YEH FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    #    + 062C ARABIC LETTER JEEM
    #    + 064A ARABIC LETTER YEH
    "\u{FDC7}".freeze => "\u{0646}\u{062C}\u{064A}".freeze,

    # FDF0 ARABIC LIGATURE SALLA USED AS KORANIC STOP SIGN ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0644 ARABIC LETTER LAM
    #    + 06D2 ARABIC LETTER YEH BARREE
    "\u{FDF0}".freeze => "\u{0635}\u{0644}\u{06D2}".freeze,

    # FDF1 ARABIC LIGATURE QALA USED AS KORANIC STOP SIGN ISOLATED FORM
    # ->   0642 ARABIC LETTER QAF
    #    + 0644 ARABIC LETTER LAM
    #    + 06D2 ARABIC LETTER YEH BARREE
    "\u{FDF1}".freeze => "\u{0642}\u{0644}\u{06D2}".freeze,

    # FDF2 ARABIC LIGATURE ALLAH ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    #    + 0644 ARABIC LETTER LAM
    #    + 0644 ARABIC LETTER LAM
    #    + 0647 ARABIC LETTER HEH
    "\u{FDF2}".freeze => "\u{0627}\u{0644}\u{0644}\u{0647}".freeze,

    # FDF3 ARABIC LIGATURE AKBAR ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    #    + 0643 ARABIC LETTER KAF
    #    + 0628 ARABIC LETTER BEH
    #    + 0631 ARABIC LETTER REH
    "\u{FDF3}".freeze => "\u{0627}\u{0643}\u{0628}\u{0631}".freeze,

    # FDF4 ARABIC LIGATURE MOHAMMAD ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    #    + 062D ARABIC LETTER HAH
    #    + 0645 ARABIC LETTER MEEM
    #    + 062F ARABIC LETTER DAL
    "\u{FDF4}".freeze => "\u{0645}\u{062D}\u{0645}\u{062F}".freeze,

    # FDF5 ARABIC LIGATURE SALAM ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0644 ARABIC LETTER LAM
    #    + 0639 ARABIC LETTER AIN
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDF5}".freeze => "\u{0635}\u{0644}\u{0639}\u{0645}".freeze,

    # FDF6 ARABIC LIGATURE RASOUL ISOLATED FORM
    # ->   0631 ARABIC LETTER REH
    #    + 0633 ARABIC LETTER SEEN
    #    + 0648 ARABIC LETTER WAW
    #    + 0644 ARABIC LETTER LAM
    "\u{FDF6}".freeze => "\u{0631}\u{0633}\u{0648}\u{0644}".freeze,

    # FDF7 ARABIC LIGATURE ALAYHE ISOLATED FORM
    # ->   0639 ARABIC LETTER AIN
    #    + 0644 ARABIC LETTER LAM
    #    + 064A ARABIC LETTER YEH
    #    + 0647 ARABIC LETTER HEH
    "\u{FDF7}".freeze => "\u{0639}\u{0644}\u{064A}\u{0647}".freeze,

    # FDF8 ARABIC LIGATURE WASALLAM ISOLATED FORM
    # ->   0648 ARABIC LETTER WAW
    #    + 0633 ARABIC LETTER SEEN
    #    + 0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDF8}".freeze => "\u{0648}\u{0633}\u{0644}\u{0645}".freeze,

    # FDF9 ARABIC LIGATURE SALLA ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    #    + 0644 ARABIC LETTER LAM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    "\u{FDF9}".freeze => "\u{0635}\u{0644}\u{0649}".freeze,

    # FDFA ARABIC LIGATURE SALLALLAHOU ALAYHE WASALLAM
    # ->   0635 ARABIC LETTER SAD
    #    + 0644 ARABIC LETTER LAM
    #    + 0649 ARABIC LETTER ALEF MAKSURA
    #    + 0020 SPACE
    #    + 0627 ARABIC LETTER ALEF
    #    + 0644 ARABIC LETTER LAM
    #    + 0644 ARABIC LETTER LAM
    #    + 0647 ARABIC LETTER HEH
    #    + 0020 SPACE
    #    + 0639 ARABIC LETTER AIN
    #    + 0644 ARABIC LETTER LAM
    #    + 064A ARABIC LETTER YEH
    #    + 0647 ARABIC LETTER HEH
    #    + 0020 SPACE
    #    + 0648 ARABIC LETTER WAW
    #    + 0633 ARABIC LETTER SEEN
    #    + 0644 ARABIC LETTER LAM
    #    + 0645 ARABIC LETTER MEEM
    "\u{FDFA}".freeze => "\u{0635}\u{0644}\u{0649} \u{0627}\u{0644}\u{0644}\u{0647} \u{0639}\u{0644}\u{064A}\u{0647} \u{0648}\u{0633}\u{0644}\u{0645}".freeze,

    # FDFB ARABIC LIGATURE JALLAJALALOUHOU
    # ->   062C ARABIC LETTER JEEM
    #    + 0644 ARABIC LETTER LAM
    #    + 0020 SPACE
    #    + 062C ARABIC LETTER JEEM
    #    + 0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    #    + 0644 ARABIC LETTER LAM
    #    + 0647 ARABIC LETTER HEH
    "\u{FDFB}".freeze => "\u{062C}\u{0644} \u{062C}\u{0644}\u{0627}\u{0644}\u{0647}".freeze,

    # FDFC RIAL SIGN
    # ->   0631 ARABIC LETTER REH
    #    + 06CC ARABIC LETTER FARSI YEH
    #    + 0627 ARABIC LETTER ALEF
    #    + 0644 ARABIC LETTER LAM
    "\u{FDFC}".freeze => "\u{0631}\u{06CC}\u{0627}\u{0644}".freeze,

    # FE30 PRESENTATION FORM FOR VERTICAL TWO DOT LEADER
    # ->   002E FULL STOP
    #    + 002E FULL STOP
    "\u{FE30}".freeze => '..'.freeze,

    # FE31 PRESENTATION FORM FOR VERTICAL EM DASH
    # ->   2014 EM DASH
    "\u{FE31}".freeze => "\u{2014}".freeze,

    # FE32 PRESENTATION FORM FOR VERTICAL EN DASH
    # ->   2013 EN DASH
    "\u{FE32}".freeze => "\u{2013}".freeze,

    # FE33 PRESENTATION FORM FOR VERTICAL LOW LINE
    # ->   005F LOW LINE
    "\u{FE33}".freeze => '_'.freeze,

    # FE34 PRESENTATION FORM FOR VERTICAL WAVY LOW LINE
    # ->   005F LOW LINE
    "\u{FE34}".freeze => '_'.freeze,

    # FE35 PRESENTATION FORM FOR VERTICAL LEFT PARENTHESIS
    # ->   0028 LEFT PARENTHESIS
    "\u{FE35}".freeze => '('.freeze,

    # FE36 PRESENTATION FORM FOR VERTICAL RIGHT PARENTHESIS
    # ->   0029 RIGHT PARENTHESIS
    "\u{FE36}".freeze => ')'.freeze,

    # FE37 PRESENTATION FORM FOR VERTICAL LEFT CURLY BRACKET
    # ->   007B LEFT CURLY BRACKET
    "\u{FE37}".freeze => '{'.freeze,

    # FE38 PRESENTATION FORM FOR VERTICAL RIGHT CURLY BRACKET
    # ->   007D RIGHT CURLY BRACKET
    "\u{FE38}".freeze => '}'.freeze,

    # FE39 PRESENTATION FORM FOR VERTICAL LEFT TORTOISE SHELL BRACKET
    # ->   3014 LEFT TORTOISE SHELL BRACKET
    "\u{FE39}".freeze => "\u{3014}".freeze,

    # FE3A PRESENTATION FORM FOR VERTICAL RIGHT TORTOISE SHELL BRACKET
    # ->   3015 RIGHT TORTOISE SHELL BRACKET
    "\u{FE3A}".freeze => "\u{3015}".freeze,

    # FE3B PRESENTATION FORM FOR VERTICAL LEFT BLACK LENTICULAR BRACKET
    # ->   3010 LEFT BLACK LENTICULAR BRACKET
    "\u{FE3B}".freeze => "\u{3010}".freeze,

    # FE3C PRESENTATION FORM FOR VERTICAL RIGHT BLACK LENTICULAR BRACKET
    # ->   3011 RIGHT BLACK LENTICULAR BRACKET
    "\u{FE3C}".freeze => "\u{3011}".freeze,

    # FE3D PRESENTATION FORM FOR VERTICAL LEFT DOUBLE ANGLE BRACKET
    # ->   300A LEFT DOUBLE ANGLE BRACKET
    "\u{FE3D}".freeze => "\u{300A}".freeze,

    # FE3E PRESENTATION FORM FOR VERTICAL RIGHT DOUBLE ANGLE BRACKET
    # ->   300B RIGHT DOUBLE ANGLE BRACKET
    "\u{FE3E}".freeze => "\u{300B}".freeze,

    # FE3F PRESENTATION FORM FOR VERTICAL LEFT ANGLE BRACKET
    # ->   3008 LEFT ANGLE BRACKET
    "\u{FE3F}".freeze => "\u{3008}".freeze,

    # FE40 PRESENTATION FORM FOR VERTICAL RIGHT ANGLE BRACKET
    # ->   3009 RIGHT ANGLE BRACKET
    "\u{FE40}".freeze => "\u{3009}".freeze,

    # FE41 PRESENTATION FORM FOR VERTICAL LEFT CORNER BRACKET
    # ->   300C LEFT CORNER BRACKET
    "\u{FE41}".freeze => "\u{300C}".freeze,

    # FE42 PRESENTATION FORM FOR VERTICAL RIGHT CORNER BRACKET
    # ->   300D RIGHT CORNER BRACKET
    "\u{FE42}".freeze => "\u{300D}".freeze,

    # FE43 PRESENTATION FORM FOR VERTICAL LEFT WHITE CORNER BRACKET
    # ->   300E LEFT WHITE CORNER BRACKET
    "\u{FE43}".freeze => "\u{300E}".freeze,

    # FE44 PRESENTATION FORM FOR VERTICAL RIGHT WHITE CORNER BRACKET
    # ->   300F RIGHT WHITE CORNER BRACKET
    "\u{FE44}".freeze => "\u{300F}".freeze,

    # FE47 PRESENTATION FORM FOR VERTICAL LEFT SQUARE BRACKET
    # ->   005B LEFT SQUARE BRACKET
    "\u{FE47}".freeze => '['.freeze,

    # FE48 PRESENTATION FORM FOR VERTICAL RIGHT SQUARE BRACKET
    # ->   005D RIGHT SQUARE BRACKET
    "\u{FE48}".freeze => ']'.freeze,

    # FE49 DASHED OVERLINE
    # ->   0020 SPACE
    "\u{FE49}".freeze => ' '.freeze,

    # FE4A CENTRELINE OVERLINE
    # ->   0020 SPACE
    "\u{FE4A}".freeze => ' '.freeze,

    # FE4B WAVY OVERLINE
    # ->   0020 SPACE
    "\u{FE4B}".freeze => ' '.freeze,

    # FE4C DOUBLE WAVY OVERLINE
    # ->   0020 SPACE
    "\u{FE4C}".freeze => ' '.freeze,

    # FE4D DASHED LOW LINE
    # ->   005F LOW LINE
    "\u{FE4D}".freeze => '_'.freeze,

    # FE4E CENTRELINE LOW LINE
    # ->   005F LOW LINE
    "\u{FE4E}".freeze => '_'.freeze,

    # FE4F WAVY LOW LINE
    # ->   005F LOW LINE
    "\u{FE4F}".freeze => '_'.freeze,

    # FE50 SMALL COMMA
    # ->   002C COMMA
    "\u{FE50}".freeze => ','.freeze,

    # FE51 SMALL IDEOGRAPHIC COMMA
    # ->   3001 IDEOGRAPHIC COMMA
    "\u{FE51}".freeze => "\u{3001}".freeze,

    # FE52 SMALL FULL STOP
    # ->   002E FULL STOP
    "\u{FE52}".freeze => '.'.freeze,

    # FE54 SMALL SEMICOLON
    # ->   003B SEMICOLON
    "\u{FE54}".freeze => ';'.freeze,

    # FE55 SMALL COLON
    # ->   003A COLON
    "\u{FE55}".freeze => ':'.freeze,

    # FE56 SMALL QUESTION MARK
    # ->   003F QUESTION MARK
    "\u{FE56}".freeze => '?'.freeze,

    # FE57 SMALL EXCLAMATION MARK
    # ->   0021 EXCLAMATION MARK
    "\u{FE57}".freeze => '!'.freeze,

    # FE58 SMALL EM DASH
    # ->   2014 EM DASH
    "\u{FE58}".freeze => "\u{2014}".freeze,

    # FE59 SMALL LEFT PARENTHESIS
    # ->   0028 LEFT PARENTHESIS
    "\u{FE59}".freeze => '('.freeze,

    # FE5A SMALL RIGHT PARENTHESIS
    # ->   0029 RIGHT PARENTHESIS
    "\u{FE5A}".freeze => ')'.freeze,

    # FE5B SMALL LEFT CURLY BRACKET
    # ->   007B LEFT CURLY BRACKET
    "\u{FE5B}".freeze => '{'.freeze,

    # FE5C SMALL RIGHT CURLY BRACKET
    # ->   007D RIGHT CURLY BRACKET
    "\u{FE5C}".freeze => '}'.freeze,

    # FE5D SMALL LEFT TORTOISE SHELL BRACKET
    # ->   3014 LEFT TORTOISE SHELL BRACKET
    "\u{FE5D}".freeze => "\u{3014}".freeze,

    # FE5E SMALL RIGHT TORTOISE SHELL BRACKET
    # ->   3015 RIGHT TORTOISE SHELL BRACKET
    "\u{FE5E}".freeze => "\u{3015}".freeze,

    # FE5F SMALL NUMBER SIGN
    # ->   0023 NUMBER SIGN
    "\u{FE5F}".freeze => '#'.freeze,

    # FE60 SMALL AMPERSAND
    # ->   0026 AMPERSAND
    "\u{FE60}".freeze => '&'.freeze,

    # FE61 SMALL ASTERISK
    # ->   002A ASTERISK
    "\u{FE61}".freeze => '*'.freeze,

    # FE62 SMALL PLUS SIGN
    # ->   002B PLUS SIGN
    "\u{FE62}".freeze => '+'.freeze,

    # FE63 SMALL HYPHEN-MINUS
    # ->   002D HYPHEN-MINUS
    "\u{FE63}".freeze => '-'.freeze,

    # FE64 SMALL LESS-THAN SIGN
    # ->   003C LESS-THAN SIGN
    "\u{FE64}".freeze => '<'.freeze,

    # FE65 SMALL GREATER-THAN SIGN
    # ->   003E GREATER-THAN SIGN
    "\u{FE65}".freeze => '>'.freeze,

    # FE66 SMALL EQUALS SIGN
    # ->   003D EQUALS SIGN
    "\u{FE66}".freeze => '='.freeze,

    # FE68 SMALL REVERSE SOLIDUS
    # ->   005C REVERSE SOLIDUS
    "\u{FE68}".freeze => "\\".freeze,

    # FE69 SMALL DOLLAR SIGN
    # ->   0024 DOLLAR SIGN
    "\u{FE69}".freeze => "\$".freeze,

    # FE6A SMALL PERCENT SIGN
    # ->   0025 PERCENT SIGN
    "\u{FE6A}".freeze => '%'.freeze,

    # FE6B SMALL COMMERCIAL AT
    # ->   0040 COMMERCIAL AT
    "\u{FE6B}".freeze => '@'.freeze,

    # FE70 ARABIC FATHATAN ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE70}".freeze => ' '.freeze,

    # FE71 ARABIC TATWEEL WITH FATHATAN ABOVE
    # ->   0640 ARABIC TATWEEL
    "\u{FE71}".freeze => "\u{0640}".freeze,

    # FE72 ARABIC DAMMATAN ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE72}".freeze => ' '.freeze,

    # FE74 ARABIC KASRATAN ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE74}".freeze => ' '.freeze,

    # FE76 ARABIC FATHA ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE76}".freeze => ' '.freeze,

    # FE77 ARABIC FATHA MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FE77}".freeze => "\u{0640}".freeze,

    # FE78 ARABIC DAMMA ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE78}".freeze => ' '.freeze,

    # FE79 ARABIC DAMMA MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FE79}".freeze => "\u{0640}".freeze,

    # FE7A ARABIC KASRA ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE7A}".freeze => ' '.freeze,

    # FE7B ARABIC KASRA MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FE7B}".freeze => "\u{0640}".freeze,

    # FE7C ARABIC SHADDA ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE7C}".freeze => ' '.freeze,

    # FE7D ARABIC SHADDA MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FE7D}".freeze => "\u{0640}".freeze,

    # FE7E ARABIC SUKUN ISOLATED FORM
    # ->   0020 SPACE
    "\u{FE7E}".freeze => ' '.freeze,

    # FE7F ARABIC SUKUN MEDIAL FORM
    # ->   0640 ARABIC TATWEEL
    "\u{FE7F}".freeze => "\u{0640}".freeze,

    # FE80 ARABIC LETTER HAMZA ISOLATED FORM
    # ->   0621 ARABIC LETTER HAMZA
    "\u{FE80}".freeze => "\u{0621}".freeze,

    # FE81 ARABIC LETTER ALEF WITH MADDA ABOVE ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE81}".freeze => "\u{0627}".freeze,

    # FE82 ARABIC LETTER ALEF WITH MADDA ABOVE FINAL FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE82}".freeze => "\u{0627}".freeze,

    # FE83 ARABIC LETTER ALEF WITH HAMZA ABOVE ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE83}".freeze => "\u{0627}".freeze,

    # FE84 ARABIC LETTER ALEF WITH HAMZA ABOVE FINAL FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE84}".freeze => "\u{0627}".freeze,

    # FE85 ARABIC LETTER WAW WITH HAMZA ABOVE ISOLATED FORM
    # ->   0648 ARABIC LETTER WAW
    "\u{FE85}".freeze => "\u{0648}".freeze,

    # FE86 ARABIC LETTER WAW WITH HAMZA ABOVE FINAL FORM
    # ->   0648 ARABIC LETTER WAW
    "\u{FE86}".freeze => "\u{0648}".freeze,

    # FE87 ARABIC LETTER ALEF WITH HAMZA BELOW ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE87}".freeze => "\u{0627}".freeze,

    # FE88 ARABIC LETTER ALEF WITH HAMZA BELOW FINAL FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE88}".freeze => "\u{0627}".freeze,

    # FE89 ARABIC LETTER YEH WITH HAMZA ABOVE ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FE89}".freeze => "\u{064A}".freeze,

    # FE8A ARABIC LETTER YEH WITH HAMZA ABOVE FINAL FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FE8A}".freeze => "\u{064A}".freeze,

    # FE8B ARABIC LETTER YEH WITH HAMZA ABOVE INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FE8B}".freeze => "\u{064A}".freeze,

    # FE8C ARABIC LETTER YEH WITH HAMZA ABOVE MEDIAL FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FE8C}".freeze => "\u{064A}".freeze,

    # FE8D ARABIC LETTER ALEF ISOLATED FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE8D}".freeze => "\u{0627}".freeze,

    # FE8E ARABIC LETTER ALEF FINAL FORM
    # ->   0627 ARABIC LETTER ALEF
    "\u{FE8E}".freeze => "\u{0627}".freeze,

    # FE8F ARABIC LETTER BEH ISOLATED FORM
    # ->   0628 ARABIC LETTER BEH
    "\u{FE8F}".freeze => "\u{0628}".freeze,

    # FE90 ARABIC LETTER BEH FINAL FORM
    # ->   0628 ARABIC LETTER BEH
    "\u{FE90}".freeze => "\u{0628}".freeze,

    # FE91 ARABIC LETTER BEH INITIAL FORM
    # ->   0628 ARABIC LETTER BEH
    "\u{FE91}".freeze => "\u{0628}".freeze,

    # FE92 ARABIC LETTER BEH MEDIAL FORM
    # ->   0628 ARABIC LETTER BEH
    "\u{FE92}".freeze => "\u{0628}".freeze,

    # FE93 ARABIC LETTER TEH MARBUTA ISOLATED FORM
    # ->   0629 ARABIC LETTER TEH MARBUTA
    "\u{FE93}".freeze => "\u{0629}".freeze,

    # FE94 ARABIC LETTER TEH MARBUTA FINAL FORM
    # ->   0629 ARABIC LETTER TEH MARBUTA
    "\u{FE94}".freeze => "\u{0629}".freeze,

    # FE95 ARABIC LETTER TEH ISOLATED FORM
    # ->   062A ARABIC LETTER TEH
    "\u{FE95}".freeze => "\u{062A}".freeze,

    # FE96 ARABIC LETTER TEH FINAL FORM
    # ->   062A ARABIC LETTER TEH
    "\u{FE96}".freeze => "\u{062A}".freeze,

    # FE97 ARABIC LETTER TEH INITIAL FORM
    # ->   062A ARABIC LETTER TEH
    "\u{FE97}".freeze => "\u{062A}".freeze,

    # FE98 ARABIC LETTER TEH MEDIAL FORM
    # ->   062A ARABIC LETTER TEH
    "\u{FE98}".freeze => "\u{062A}".freeze,

    # FE99 ARABIC LETTER THEH ISOLATED FORM
    # ->   062B ARABIC LETTER THEH
    "\u{FE99}".freeze => "\u{062B}".freeze,

    # FE9A ARABIC LETTER THEH FINAL FORM
    # ->   062B ARABIC LETTER THEH
    "\u{FE9A}".freeze => "\u{062B}".freeze,

    # FE9B ARABIC LETTER THEH INITIAL FORM
    # ->   062B ARABIC LETTER THEH
    "\u{FE9B}".freeze => "\u{062B}".freeze,

    # FE9C ARABIC LETTER THEH MEDIAL FORM
    # ->   062B ARABIC LETTER THEH
    "\u{FE9C}".freeze => "\u{062B}".freeze,

    # FE9D ARABIC LETTER JEEM ISOLATED FORM
    # ->   062C ARABIC LETTER JEEM
    "\u{FE9D}".freeze => "\u{062C}".freeze,

    # FE9E ARABIC LETTER JEEM FINAL FORM
    # ->   062C ARABIC LETTER JEEM
    "\u{FE9E}".freeze => "\u{062C}".freeze,

    # FE9F ARABIC LETTER JEEM INITIAL FORM
    # ->   062C ARABIC LETTER JEEM
    "\u{FE9F}".freeze => "\u{062C}".freeze,

    # FEA0 ARABIC LETTER JEEM MEDIAL FORM
    # ->   062C ARABIC LETTER JEEM
    "\u{FEA0}".freeze => "\u{062C}".freeze,

    # FEA1 ARABIC LETTER HAH ISOLATED FORM
    # ->   062D ARABIC LETTER HAH
    "\u{FEA1}".freeze => "\u{062D}".freeze,

    # FEA2 ARABIC LETTER HAH FINAL FORM
    # ->   062D ARABIC LETTER HAH
    "\u{FEA2}".freeze => "\u{062D}".freeze,

    # FEA3 ARABIC LETTER HAH INITIAL FORM
    # ->   062D ARABIC LETTER HAH
    "\u{FEA3}".freeze => "\u{062D}".freeze,

    # FEA4 ARABIC LETTER HAH MEDIAL FORM
    # ->   062D ARABIC LETTER HAH
    "\u{FEA4}".freeze => "\u{062D}".freeze,

    # FEA5 ARABIC LETTER KHAH ISOLATED FORM
    # ->   062E ARABIC LETTER KHAH
    "\u{FEA5}".freeze => "\u{062E}".freeze,

    # FEA6 ARABIC LETTER KHAH FINAL FORM
    # ->   062E ARABIC LETTER KHAH
    "\u{FEA6}".freeze => "\u{062E}".freeze,

    # FEA7 ARABIC LETTER KHAH INITIAL FORM
    # ->   062E ARABIC LETTER KHAH
    "\u{FEA7}".freeze => "\u{062E}".freeze,

    # FEA8 ARABIC LETTER KHAH MEDIAL FORM
    # ->   062E ARABIC LETTER KHAH
    "\u{FEA8}".freeze => "\u{062E}".freeze,

    # FEA9 ARABIC LETTER DAL ISOLATED FORM
    # ->   062F ARABIC LETTER DAL
    "\u{FEA9}".freeze => "\u{062F}".freeze,

    # FEAA ARABIC LETTER DAL FINAL FORM
    # ->   062F ARABIC LETTER DAL
    "\u{FEAA}".freeze => "\u{062F}".freeze,

    # FEAB ARABIC LETTER THAL ISOLATED FORM
    # ->   0630 ARABIC LETTER THAL
    "\u{FEAB}".freeze => "\u{0630}".freeze,

    # FEAC ARABIC LETTER THAL FINAL FORM
    # ->   0630 ARABIC LETTER THAL
    "\u{FEAC}".freeze => "\u{0630}".freeze,

    # FEAD ARABIC LETTER REH ISOLATED FORM
    # ->   0631 ARABIC LETTER REH
    "\u{FEAD}".freeze => "\u{0631}".freeze,

    # FEAE ARABIC LETTER REH FINAL FORM
    # ->   0631 ARABIC LETTER REH
    "\u{FEAE}".freeze => "\u{0631}".freeze,

    # FEAF ARABIC LETTER ZAIN ISOLATED FORM
    # ->   0632 ARABIC LETTER ZAIN
    "\u{FEAF}".freeze => "\u{0632}".freeze,

    # FEB0 ARABIC LETTER ZAIN FINAL FORM
    # ->   0632 ARABIC LETTER ZAIN
    "\u{FEB0}".freeze => "\u{0632}".freeze,

    # FEB1 ARABIC LETTER SEEN ISOLATED FORM
    # ->   0633 ARABIC LETTER SEEN
    "\u{FEB1}".freeze => "\u{0633}".freeze,

    # FEB2 ARABIC LETTER SEEN FINAL FORM
    # ->   0633 ARABIC LETTER SEEN
    "\u{FEB2}".freeze => "\u{0633}".freeze,

    # FEB3 ARABIC LETTER SEEN INITIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    "\u{FEB3}".freeze => "\u{0633}".freeze,

    # FEB4 ARABIC LETTER SEEN MEDIAL FORM
    # ->   0633 ARABIC LETTER SEEN
    "\u{FEB4}".freeze => "\u{0633}".freeze,

    # FEB5 ARABIC LETTER SHEEN ISOLATED FORM
    # ->   0634 ARABIC LETTER SHEEN
    "\u{FEB5}".freeze => "\u{0634}".freeze,

    # FEB6 ARABIC LETTER SHEEN FINAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    "\u{FEB6}".freeze => "\u{0634}".freeze,

    # FEB7 ARABIC LETTER SHEEN INITIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    "\u{FEB7}".freeze => "\u{0634}".freeze,

    # FEB8 ARABIC LETTER SHEEN MEDIAL FORM
    # ->   0634 ARABIC LETTER SHEEN
    "\u{FEB8}".freeze => "\u{0634}".freeze,

    # FEB9 ARABIC LETTER SAD ISOLATED FORM
    # ->   0635 ARABIC LETTER SAD
    "\u{FEB9}".freeze => "\u{0635}".freeze,

    # FEBA ARABIC LETTER SAD FINAL FORM
    # ->   0635 ARABIC LETTER SAD
    "\u{FEBA}".freeze => "\u{0635}".freeze,

    # FEBB ARABIC LETTER SAD INITIAL FORM
    # ->   0635 ARABIC LETTER SAD
    "\u{FEBB}".freeze => "\u{0635}".freeze,

    # FEBC ARABIC LETTER SAD MEDIAL FORM
    # ->   0635 ARABIC LETTER SAD
    "\u{FEBC}".freeze => "\u{0635}".freeze,

    # FEBD ARABIC LETTER DAD ISOLATED FORM
    # ->   0636 ARABIC LETTER DAD
    "\u{FEBD}".freeze => "\u{0636}".freeze,

    # FEBE ARABIC LETTER DAD FINAL FORM
    # ->   0636 ARABIC LETTER DAD
    "\u{FEBE}".freeze => "\u{0636}".freeze,

    # FEBF ARABIC LETTER DAD INITIAL FORM
    # ->   0636 ARABIC LETTER DAD
    "\u{FEBF}".freeze => "\u{0636}".freeze,

    # FEC0 ARABIC LETTER DAD MEDIAL FORM
    # ->   0636 ARABIC LETTER DAD
    "\u{FEC0}".freeze => "\u{0636}".freeze,

    # FEC1 ARABIC LETTER TAH ISOLATED FORM
    # ->   0637 ARABIC LETTER TAH
    "\u{FEC1}".freeze => "\u{0637}".freeze,

    # FEC2 ARABIC LETTER TAH FINAL FORM
    # ->   0637 ARABIC LETTER TAH
    "\u{FEC2}".freeze => "\u{0637}".freeze,

    # FEC3 ARABIC LETTER TAH INITIAL FORM
    # ->   0637 ARABIC LETTER TAH
    "\u{FEC3}".freeze => "\u{0637}".freeze,

    # FEC4 ARABIC LETTER TAH MEDIAL FORM
    # ->   0637 ARABIC LETTER TAH
    "\u{FEC4}".freeze => "\u{0637}".freeze,

    # FEC5 ARABIC LETTER ZAH ISOLATED FORM
    # ->   0638 ARABIC LETTER ZAH
    "\u{FEC5}".freeze => "\u{0638}".freeze,

    # FEC6 ARABIC LETTER ZAH FINAL FORM
    # ->   0638 ARABIC LETTER ZAH
    "\u{FEC6}".freeze => "\u{0638}".freeze,

    # FEC7 ARABIC LETTER ZAH INITIAL FORM
    # ->   0638 ARABIC LETTER ZAH
    "\u{FEC7}".freeze => "\u{0638}".freeze,

    # FEC8 ARABIC LETTER ZAH MEDIAL FORM
    # ->   0638 ARABIC LETTER ZAH
    "\u{FEC8}".freeze => "\u{0638}".freeze,

    # FEC9 ARABIC LETTER AIN ISOLATED FORM
    # ->   0639 ARABIC LETTER AIN
    "\u{FEC9}".freeze => "\u{0639}".freeze,

    # FECA ARABIC LETTER AIN FINAL FORM
    # ->   0639 ARABIC LETTER AIN
    "\u{FECA}".freeze => "\u{0639}".freeze,

    # FECB ARABIC LETTER AIN INITIAL FORM
    # ->   0639 ARABIC LETTER AIN
    "\u{FECB}".freeze => "\u{0639}".freeze,

    # FECC ARABIC LETTER AIN MEDIAL FORM
    # ->   0639 ARABIC LETTER AIN
    "\u{FECC}".freeze => "\u{0639}".freeze,

    # FECD ARABIC LETTER GHAIN ISOLATED FORM
    # ->   063A ARABIC LETTER GHAIN
    "\u{FECD}".freeze => "\u{063A}".freeze,

    # FECE ARABIC LETTER GHAIN FINAL FORM
    # ->   063A ARABIC LETTER GHAIN
    "\u{FECE}".freeze => "\u{063A}".freeze,

    # FECF ARABIC LETTER GHAIN INITIAL FORM
    # ->   063A ARABIC LETTER GHAIN
    "\u{FECF}".freeze => "\u{063A}".freeze,

    # FED0 ARABIC LETTER GHAIN MEDIAL FORM
    # ->   063A ARABIC LETTER GHAIN
    "\u{FED0}".freeze => "\u{063A}".freeze,

    # FED1 ARABIC LETTER FEH ISOLATED FORM
    # ->   0641 ARABIC LETTER FEH
    "\u{FED1}".freeze => "\u{0641}".freeze,

    # FED2 ARABIC LETTER FEH FINAL FORM
    # ->   0641 ARABIC LETTER FEH
    "\u{FED2}".freeze => "\u{0641}".freeze,

    # FED3 ARABIC LETTER FEH INITIAL FORM
    # ->   0641 ARABIC LETTER FEH
    "\u{FED3}".freeze => "\u{0641}".freeze,

    # FED4 ARABIC LETTER FEH MEDIAL FORM
    # ->   0641 ARABIC LETTER FEH
    "\u{FED4}".freeze => "\u{0641}".freeze,

    # FED5 ARABIC LETTER QAF ISOLATED FORM
    # ->   0642 ARABIC LETTER QAF
    "\u{FED5}".freeze => "\u{0642}".freeze,

    # FED6 ARABIC LETTER QAF FINAL FORM
    # ->   0642 ARABIC LETTER QAF
    "\u{FED6}".freeze => "\u{0642}".freeze,

    # FED7 ARABIC LETTER QAF INITIAL FORM
    # ->   0642 ARABIC LETTER QAF
    "\u{FED7}".freeze => "\u{0642}".freeze,

    # FED8 ARABIC LETTER QAF MEDIAL FORM
    # ->   0642 ARABIC LETTER QAF
    "\u{FED8}".freeze => "\u{0642}".freeze,

    # FED9 ARABIC LETTER KAF ISOLATED FORM
    # ->   0643 ARABIC LETTER KAF
    "\u{FED9}".freeze => "\u{0643}".freeze,

    # FEDA ARABIC LETTER KAF FINAL FORM
    # ->   0643 ARABIC LETTER KAF
    "\u{FEDA}".freeze => "\u{0643}".freeze,

    # FEDB ARABIC LETTER KAF INITIAL FORM
    # ->   0643 ARABIC LETTER KAF
    "\u{FEDB}".freeze => "\u{0643}".freeze,

    # FEDC ARABIC LETTER KAF MEDIAL FORM
    # ->   0643 ARABIC LETTER KAF
    "\u{FEDC}".freeze => "\u{0643}".freeze,

    # FEDD ARABIC LETTER LAM ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    "\u{FEDD}".freeze => "\u{0644}".freeze,

    # FEDE ARABIC LETTER LAM FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    "\u{FEDE}".freeze => "\u{0644}".freeze,

    # FEDF ARABIC LETTER LAM INITIAL FORM
    # ->   0644 ARABIC LETTER LAM
    "\u{FEDF}".freeze => "\u{0644}".freeze,

    # FEE0 ARABIC LETTER LAM MEDIAL FORM
    # ->   0644 ARABIC LETTER LAM
    "\u{FEE0}".freeze => "\u{0644}".freeze,

    # FEE1 ARABIC LETTER MEEM ISOLATED FORM
    # ->   0645 ARABIC LETTER MEEM
    "\u{FEE1}".freeze => "\u{0645}".freeze,

    # FEE2 ARABIC LETTER MEEM FINAL FORM
    # ->   0645 ARABIC LETTER MEEM
    "\u{FEE2}".freeze => "\u{0645}".freeze,

    # FEE3 ARABIC LETTER MEEM INITIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    "\u{FEE3}".freeze => "\u{0645}".freeze,

    # FEE4 ARABIC LETTER MEEM MEDIAL FORM
    # ->   0645 ARABIC LETTER MEEM
    "\u{FEE4}".freeze => "\u{0645}".freeze,

    # FEE5 ARABIC LETTER NOON ISOLATED FORM
    # ->   0646 ARABIC LETTER NOON
    "\u{FEE5}".freeze => "\u{0646}".freeze,

    # FEE6 ARABIC LETTER NOON FINAL FORM
    # ->   0646 ARABIC LETTER NOON
    "\u{FEE6}".freeze => "\u{0646}".freeze,

    # FEE7 ARABIC LETTER NOON INITIAL FORM
    # ->   0646 ARABIC LETTER NOON
    "\u{FEE7}".freeze => "\u{0646}".freeze,

    # FEE8 ARABIC LETTER NOON MEDIAL FORM
    # ->   0646 ARABIC LETTER NOON
    "\u{FEE8}".freeze => "\u{0646}".freeze,

    # FEE9 ARABIC LETTER HEH ISOLATED FORM
    # ->   0647 ARABIC LETTER HEH
    "\u{FEE9}".freeze => "\u{0647}".freeze,

    # FEEA ARABIC LETTER HEH FINAL FORM
    # ->   0647 ARABIC LETTER HEH
    "\u{FEEA}".freeze => "\u{0647}".freeze,

    # FEEB ARABIC LETTER HEH INITIAL FORM
    # ->   0647 ARABIC LETTER HEH
    "\u{FEEB}".freeze => "\u{0647}".freeze,

    # FEEC ARABIC LETTER HEH MEDIAL FORM
    # ->   0647 ARABIC LETTER HEH
    "\u{FEEC}".freeze => "\u{0647}".freeze,

    # FEED ARABIC LETTER WAW ISOLATED FORM
    # ->   0648 ARABIC LETTER WAW
    "\u{FEED}".freeze => "\u{0648}".freeze,

    # FEEE ARABIC LETTER WAW FINAL FORM
    # ->   0648 ARABIC LETTER WAW
    "\u{FEEE}".freeze => "\u{0648}".freeze,

    # FEEF ARABIC LETTER ALEF MAKSURA ISOLATED FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    "\u{FEEF}".freeze => "\u{0649}".freeze,

    # FEF0 ARABIC LETTER ALEF MAKSURA FINAL FORM
    # ->   0649 ARABIC LETTER ALEF MAKSURA
    "\u{FEF0}".freeze => "\u{0649}".freeze,

    # FEF1 ARABIC LETTER YEH ISOLATED FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FEF1}".freeze => "\u{064A}".freeze,

    # FEF2 ARABIC LETTER YEH FINAL FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FEF2}".freeze => "\u{064A}".freeze,

    # FEF3 ARABIC LETTER YEH INITIAL FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FEF3}".freeze => "\u{064A}".freeze,

    # FEF4 ARABIC LETTER YEH MEDIAL FORM
    # ->   064A ARABIC LETTER YEH
    "\u{FEF4}".freeze => "\u{064A}".freeze,

    # FEF5 ARABIC LIGATURE LAM WITH ALEF WITH MADDA ABOVE ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEF5}".freeze => "\u{0644}\u{0627}".freeze,

    # FEF6 ARABIC LIGATURE LAM WITH ALEF WITH MADDA ABOVE FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEF6}".freeze => "\u{0644}\u{0627}".freeze,

    # FEF7 ARABIC LIGATURE LAM WITH ALEF WITH HAMZA ABOVE ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEF7}".freeze => "\u{0644}\u{0627}".freeze,

    # FEF8 ARABIC LIGATURE LAM WITH ALEF WITH HAMZA ABOVE FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEF8}".freeze => "\u{0644}\u{0627}".freeze,

    # FEF9 ARABIC LIGATURE LAM WITH ALEF WITH HAMZA BELOW ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEF9}".freeze => "\u{0644}\u{0627}".freeze,

    # FEFA ARABIC LIGATURE LAM WITH ALEF WITH HAMZA BELOW FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEFA}".freeze => "\u{0644}\u{0627}".freeze,

    # FEFB ARABIC LIGATURE LAM WITH ALEF ISOLATED FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEFB}".freeze => "\u{0644}\u{0627}".freeze,

    # FEFC ARABIC LIGATURE LAM WITH ALEF FINAL FORM
    # ->   0644 ARABIC LETTER LAM
    #    + 0627 ARABIC LETTER ALEF
    "\u{FEFC}".freeze => "\u{0644}\u{0627}".freeze,

    # FF01 FULLWIDTH EXCLAMATION MARK
    # ->   0021 EXCLAMATION MARK
    "\u{FF01}".freeze => '!'.freeze,

    # FF02 FULLWIDTH QUOTATION MARK
    # ->   0022 QUOTATION MARK
    "\u{FF02}".freeze => "\".freeze",

    # FF03 FULLWIDTH NUMBER SIGN
    # ->   0023 NUMBER SIGN
    "\u{FF03}".freeze => '#'.freeze,

    # FF04 FULLWIDTH DOLLAR SIGN
    # ->   0024 DOLLAR SIGN
    "\u{FF04}".freeze => "\$".freeze,

    # FF05 FULLWIDTH PERCENT SIGN
    # ->   0025 PERCENT SIGN
    "\u{FF05}".freeze => '%'.freeze,

    # FF06 FULLWIDTH AMPERSAND
    # ->   0026 AMPERSAND
    "\u{FF06}".freeze => '&'.freeze,

    # FF07 FULLWIDTH APOSTROPHE
    # ->   0027 APOSTROPHE
    "\u{FF07}".freeze => '\''.freeze,

    # FF08 FULLWIDTH LEFT PARENTHESIS
    # ->   0028 LEFT PARENTHESIS
    "\u{FF08}".freeze => '('.freeze,

    # FF09 FULLWIDTH RIGHT PARENTHESIS
    # ->   0029 RIGHT PARENTHESIS
    "\u{FF09}".freeze => ')'.freeze,

    # FF0A FULLWIDTH ASTERISK
    # ->   002A ASTERISK
    "\u{FF0A}".freeze => '*'.freeze,

    # FF0B FULLWIDTH PLUS SIGN
    # ->   002B PLUS SIGN
    "\u{FF0B}".freeze => '+'.freeze,

    # FF0C FULLWIDTH COMMA
    # ->   002C COMMA
    "\u{FF0C}".freeze => ','.freeze,

    # FF0D FULLWIDTH HYPHEN-MINUS
    # ->   002D HYPHEN-MINUS
    "\u{FF0D}".freeze => '-'.freeze,

    # FF0E FULLWIDTH FULL STOP
    # ->   002E FULL STOP
    "\u{FF0E}".freeze => '.'.freeze,

    # FF0F FULLWIDTH SOLIDUS
    # ->   002F SOLIDUS
    "\u{FF0F}".freeze => '/'.freeze,

    # FF10 FULLWIDTH DIGIT ZERO
    # ->   0030 DIGIT ZERO
    "\u{FF10}".freeze => '0'.freeze,

    # FF11 FULLWIDTH DIGIT ONE
    # ->   0031 DIGIT ONE
    "\u{FF11}".freeze => '1'.freeze,

    # FF12 FULLWIDTH DIGIT TWO
    # ->   0032 DIGIT TWO
    "\u{FF12}".freeze => '2'.freeze,

    # FF13 FULLWIDTH DIGIT THREE
    # ->   0033 DIGIT THREE
    "\u{FF13}".freeze => '3'.freeze,

    # FF14 FULLWIDTH DIGIT FOUR
    # ->   0034 DIGIT FOUR
    "\u{FF14}".freeze => '4'.freeze,

    # FF15 FULLWIDTH DIGIT FIVE
    # ->   0035 DIGIT FIVE
    "\u{FF15}".freeze => '5'.freeze,

    # FF16 FULLWIDTH DIGIT SIX
    # ->   0036 DIGIT SIX
    "\u{FF16}".freeze => '6'.freeze,

    # FF17 FULLWIDTH DIGIT SEVEN
    # ->   0037 DIGIT SEVEN
    "\u{FF17}".freeze => '7'.freeze,

    # FF18 FULLWIDTH DIGIT EIGHT
    # ->   0038 DIGIT EIGHT
    "\u{FF18}".freeze => '8'.freeze,

    # FF19 FULLWIDTH DIGIT NINE
    # ->   0039 DIGIT NINE
    "\u{FF19}".freeze => '9'.freeze,

    # FF1A FULLWIDTH COLON
    # ->   003A COLON
    "\u{FF1A}".freeze => ':'.freeze,

    # FF1B FULLWIDTH SEMICOLON
    # ->   003B SEMICOLON
    "\u{FF1B}".freeze => ';'.freeze,

    # FF1C FULLWIDTH LESS-THAN SIGN
    # ->   003C LESS-THAN SIGN
    "\u{FF1C}".freeze => '<'.freeze,

    # FF1D FULLWIDTH EQUALS SIGN
    # ->   003D EQUALS SIGN
    "\u{FF1D}".freeze => '='.freeze,

    # FF1E FULLWIDTH GREATER-THAN SIGN
    # ->   003E GREATER-THAN SIGN
    "\u{FF1E}".freeze => '>'.freeze,

    # FF1F FULLWIDTH QUESTION MARK
    # ->   003F QUESTION MARK
    "\u{FF1F}".freeze => '?'.freeze,

    # FF20 FULLWIDTH COMMERCIAL AT
    # ->   0040 COMMERCIAL AT
    "\u{FF20}".freeze => '@'.freeze,

    # FF21 FULLWIDTH LATIN CAPITAL LETTER A
    # ->   0041 LATIN CAPITAL LETTER A
    "\u{FF21}".freeze => 'A'.freeze,

    # FF22 FULLWIDTH LATIN CAPITAL LETTER B
    # ->   0042 LATIN CAPITAL LETTER B
    "\u{FF22}".freeze => 'B'.freeze,

    # FF23 FULLWIDTH LATIN CAPITAL LETTER C
    # ->   0043 LATIN CAPITAL LETTER C
    "\u{FF23}".freeze => 'C'.freeze,

    # FF24 FULLWIDTH LATIN CAPITAL LETTER D
    # ->   0044 LATIN CAPITAL LETTER D
    "\u{FF24}".freeze => 'D'.freeze,

    # FF25 FULLWIDTH LATIN CAPITAL LETTER E
    # ->   0045 LATIN CAPITAL LETTER E
    "\u{FF25}".freeze => 'E'.freeze,

    # FF26 FULLWIDTH LATIN CAPITAL LETTER F
    # ->   0046 LATIN CAPITAL LETTER F
    "\u{FF26}".freeze => 'F'.freeze,

    # FF27 FULLWIDTH LATIN CAPITAL LETTER G
    # ->   0047 LATIN CAPITAL LETTER G
    "\u{FF27}".freeze => 'G'.freeze,

    # FF28 FULLWIDTH LATIN CAPITAL LETTER H
    # ->   0048 LATIN CAPITAL LETTER H
    "\u{FF28}".freeze => 'H'.freeze,

    # FF29 FULLWIDTH LATIN CAPITAL LETTER I
    # ->   0049 LATIN CAPITAL LETTER I
    "\u{FF29}".freeze => 'I'.freeze,

    # FF2A FULLWIDTH LATIN CAPITAL LETTER J
    # ->   004A LATIN CAPITAL LETTER J
    "\u{FF2A}".freeze => 'J'.freeze,

    # FF2B FULLWIDTH LATIN CAPITAL LETTER K
    # ->   004B LATIN CAPITAL LETTER K
    "\u{FF2B}".freeze => 'K'.freeze,

    # FF2C FULLWIDTH LATIN CAPITAL LETTER L
    # ->   004C LATIN CAPITAL LETTER L
    "\u{FF2C}".freeze => 'L'.freeze,

    # FF2D FULLWIDTH LATIN CAPITAL LETTER M
    # ->   004D LATIN CAPITAL LETTER M
    "\u{FF2D}".freeze => 'M'.freeze,

    # FF2E FULLWIDTH LATIN CAPITAL LETTER N
    # ->   004E LATIN CAPITAL LETTER N
    "\u{FF2E}".freeze => 'N'.freeze,

    # FF2F FULLWIDTH LATIN CAPITAL LETTER O
    # ->   004F LATIN CAPITAL LETTER O
    "\u{FF2F}".freeze => 'O'.freeze,

    # FF30 FULLWIDTH LATIN CAPITAL LETTER P
    # ->   0050 LATIN CAPITAL LETTER P
    "\u{FF30}".freeze => 'P'.freeze,

    # FF31 FULLWIDTH LATIN CAPITAL LETTER Q
    # ->   0051 LATIN CAPITAL LETTER Q
    "\u{FF31}".freeze => 'Q'.freeze,

    # FF32 FULLWIDTH LATIN CAPITAL LETTER R
    # ->   0052 LATIN CAPITAL LETTER R
    "\u{FF32}".freeze => 'R'.freeze,

    # FF33 FULLWIDTH LATIN CAPITAL LETTER S
    # ->   0053 LATIN CAPITAL LETTER S
    "\u{FF33}".freeze => 'S'.freeze,

    # FF34 FULLWIDTH LATIN CAPITAL LETTER T
    # ->   0054 LATIN CAPITAL LETTER T
    "\u{FF34}".freeze => 'T'.freeze,

    # FF35 FULLWIDTH LATIN CAPITAL LETTER U
    # ->   0055 LATIN CAPITAL LETTER U
    "\u{FF35}".freeze => 'U'.freeze,

    # FF36 FULLWIDTH LATIN CAPITAL LETTER V
    # ->   0056 LATIN CAPITAL LETTER V
    "\u{FF36}".freeze => 'V'.freeze,

    # FF37 FULLWIDTH LATIN CAPITAL LETTER W
    # ->   0057 LATIN CAPITAL LETTER W
    "\u{FF37}".freeze => 'W'.freeze,

    # FF38 FULLWIDTH LATIN CAPITAL LETTER X
    # ->   0058 LATIN CAPITAL LETTER X
    "\u{FF38}".freeze => 'X'.freeze,

    # FF39 FULLWIDTH LATIN CAPITAL LETTER Y
    # ->   0059 LATIN CAPITAL LETTER Y
    "\u{FF39}".freeze => 'Y'.freeze,

    # FF3A FULLWIDTH LATIN CAPITAL LETTER Z
    # ->   005A LATIN CAPITAL LETTER Z
    "\u{FF3A}".freeze => 'Z'.freeze,

    # FF3B FULLWIDTH LEFT SQUARE BRACKET
    # ->   005B LEFT SQUARE BRACKET
    "\u{FF3B}".freeze => '['.freeze,

    # FF3C FULLWIDTH REVERSE SOLIDUS
    # ->   005C REVERSE SOLIDUS
    "\u{FF3C}".freeze => "\\".freeze,

    # FF3D FULLWIDTH RIGHT SQUARE BRACKET
    # ->   005D RIGHT SQUARE BRACKET
    "\u{FF3D}".freeze => ']'.freeze,

    # FF3E FULLWIDTH CIRCUMFLEX ACCENT
    # ->   005E CIRCUMFLEX ACCENT
    "\u{FF3E}".freeze => '^'.freeze,

    # FF3F FULLWIDTH LOW LINE
    # ->   005F LOW LINE
    "\u{FF3F}".freeze => '_'.freeze,

    # FF40 FULLWIDTH GRAVE ACCENT
    # ->   0060 GRAVE ACCENT
    "\u{FF40}".freeze => '`'.freeze,

    # FF41 FULLWIDTH LATIN SMALL LETTER A
    # ->   0061 LATIN SMALL LETTER A
    "\u{FF41}".freeze => 'a'.freeze,

    # FF42 FULLWIDTH LATIN SMALL LETTER B
    # ->   0062 LATIN SMALL LETTER B
    "\u{FF42}".freeze => 'b'.freeze,

    # FF43 FULLWIDTH LATIN SMALL LETTER C
    # ->   0063 LATIN SMALL LETTER C
    "\u{FF43}".freeze => 'c'.freeze,

    # FF44 FULLWIDTH LATIN SMALL LETTER D
    # ->   0064 LATIN SMALL LETTER D
    "\u{FF44}".freeze => 'd'.freeze,

    # FF45 FULLWIDTH LATIN SMALL LETTER E
    # ->   0065 LATIN SMALL LETTER E
    "\u{FF45}".freeze => 'e'.freeze,

    # FF46 FULLWIDTH LATIN SMALL LETTER F
    # ->   0066 LATIN SMALL LETTER F
    "\u{FF46}".freeze => 'f'.freeze,

    # FF47 FULLWIDTH LATIN SMALL LETTER G
    # ->   0067 LATIN SMALL LETTER G
    "\u{FF47}".freeze => 'g'.freeze,

    # FF48 FULLWIDTH LATIN SMALL LETTER H
    # ->   0068 LATIN SMALL LETTER H
    "\u{FF48}".freeze => 'h'.freeze,

    # FF49 FULLWIDTH LATIN SMALL LETTER I
    # ->   0069 LATIN SMALL LETTER I
    "\u{FF49}".freeze => 'i'.freeze,

    # FF4A FULLWIDTH LATIN SMALL LETTER J
    # ->   006A LATIN SMALL LETTER J
    "\u{FF4A}".freeze => 'j'.freeze,

    # FF4B FULLWIDTH LATIN SMALL LETTER K
    # ->   006B LATIN SMALL LETTER K
    "\u{FF4B}".freeze => 'k'.freeze,

    # FF4C FULLWIDTH LATIN SMALL LETTER L
    # ->   006C LATIN SMALL LETTER L
    "\u{FF4C}".freeze => 'l'.freeze,

    # FF4D FULLWIDTH LATIN SMALL LETTER M
    # ->   006D LATIN SMALL LETTER M
    "\u{FF4D}".freeze => 'm'.freeze,

    # FF4E FULLWIDTH LATIN SMALL LETTER N
    # ->   006E LATIN SMALL LETTER N
    "\u{FF4E}".freeze => 'n'.freeze,

    # FF4F FULLWIDTH LATIN SMALL LETTER O
    # ->   006F LATIN SMALL LETTER O
    "\u{FF4F}".freeze => 'o'.freeze,

    # FF50 FULLWIDTH LATIN SMALL LETTER P
    # ->   0070 LATIN SMALL LETTER P
    "\u{FF50}".freeze => 'p'.freeze,

    # FF51 FULLWIDTH LATIN SMALL LETTER Q
    # ->   0071 LATIN SMALL LETTER Q
    "\u{FF51}".freeze => 'q'.freeze,

    # FF52 FULLWIDTH LATIN SMALL LETTER R
    # ->   0072 LATIN SMALL LETTER R
    "\u{FF52}".freeze => 'r'.freeze,

    # FF53 FULLWIDTH LATIN SMALL LETTER S
    # ->   0073 LATIN SMALL LETTER S
    "\u{FF53}".freeze => 's'.freeze,

    # FF54 FULLWIDTH LATIN SMALL LETTER T
    # ->   0074 LATIN SMALL LETTER T
    "\u{FF54}".freeze => 't'.freeze,

    # FF55 FULLWIDTH LATIN SMALL LETTER U
    # ->   0075 LATIN SMALL LETTER U
    "\u{FF55}".freeze => 'u'.freeze,

    # FF56 FULLWIDTH LATIN SMALL LETTER V
    # ->   0076 LATIN SMALL LETTER V
    "\u{FF56}".freeze => 'v'.freeze,

    # FF57 FULLWIDTH LATIN SMALL LETTER W
    # ->   0077 LATIN SMALL LETTER W
    "\u{FF57}".freeze => 'w'.freeze,

    # FF58 FULLWIDTH LATIN SMALL LETTER X
    # ->   0078 LATIN SMALL LETTER X
    "\u{FF58}".freeze => 'x'.freeze,

    # FF59 FULLWIDTH LATIN SMALL LETTER Y
    # ->   0079 LATIN SMALL LETTER Y
    "\u{FF59}".freeze => 'y'.freeze,

    # FF5A FULLWIDTH LATIN SMALL LETTER Z
    # ->   007A LATIN SMALL LETTER Z
    "\u{FF5A}".freeze => 'z'.freeze,

    # FF5B FULLWIDTH LEFT CURLY BRACKET
    # ->   007B LEFT CURLY BRACKET
    "\u{FF5B}".freeze => '{'.freeze,

    # FF5C FULLWIDTH VERTICAL LINE
    # ->   007C VERTICAL LINE
    "\u{FF5C}".freeze => '|'.freeze,

    # FF5D FULLWIDTH RIGHT CURLY BRACKET
    # ->   007D RIGHT CURLY BRACKET
    "\u{FF5D}".freeze => '}'.freeze,

    # FF5E FULLWIDTH TILDE
    # ->   007E TILDE
    "\u{FF5E}".freeze => '~'.freeze,

    # FF5F FULLWIDTH LEFT WHITE PARENTHESIS
    # ->   2985 LEFT WHITE PARENTHESIS
    "\u{FF5F}".freeze => "\u{2985}".freeze,

    # FF60 FULLWIDTH RIGHT WHITE PARENTHESIS
    # ->   2986 RIGHT WHITE PARENTHESIS
    "\u{FF60}".freeze => "\u{2986}".freeze,

    # FF61 HALFWIDTH IDEOGRAPHIC FULL STOP
    # ->   3002 IDEOGRAPHIC FULL STOP
    "\u{FF61}".freeze => "\u{3002}".freeze,

    # FF62 HALFWIDTH LEFT CORNER BRACKET
    # ->   300C LEFT CORNER BRACKET
    "\u{FF62}".freeze => "\u{300C}".freeze,

    # FF63 HALFWIDTH RIGHT CORNER BRACKET
    # ->   300D RIGHT CORNER BRACKET
    "\u{FF63}".freeze => "\u{300D}".freeze,

    # FF64 HALFWIDTH IDEOGRAPHIC COMMA
    # ->   3001 IDEOGRAPHIC COMMA
    "\u{FF64}".freeze => "\u{3001}".freeze,

    # FF65 HALFWIDTH KATAKANA MIDDLE DOT
    # ->   30FB KATAKANA MIDDLE DOT
    "\u{FF65}".freeze => "\u{30FB}".freeze,

    # FF66 HALFWIDTH KATAKANA LETTER WO
    # ->   30F2 KATAKANA LETTER WO
    "\u{FF66}".freeze => "\u{30F2}".freeze,

    # FF67 HALFWIDTH KATAKANA LETTER SMALL A
    # ->   30A1 KATAKANA LETTER SMALL A
    "\u{FF67}".freeze => "\u{30A1}".freeze,

    # FF68 HALFWIDTH KATAKANA LETTER SMALL I
    # ->   30A3 KATAKANA LETTER SMALL I
    "\u{FF68}".freeze => "\u{30A3}".freeze,

    # FF69 HALFWIDTH KATAKANA LETTER SMALL U
    # ->   30A5 KATAKANA LETTER SMALL U
    "\u{FF69}".freeze => "\u{30A5}".freeze,

    # FF6A HALFWIDTH KATAKANA LETTER SMALL E
    # ->   30A7 KATAKANA LETTER SMALL E
    "\u{FF6A}".freeze => "\u{30A7}".freeze,

    # FF6B HALFWIDTH KATAKANA LETTER SMALL O
    # ->   30A9 KATAKANA LETTER SMALL O
    "\u{FF6B}".freeze => "\u{30A9}".freeze,

    # FF6C HALFWIDTH KATAKANA LETTER SMALL YA
    # ->   30E3 KATAKANA LETTER SMALL YA
    "\u{FF6C}".freeze => "\u{30E3}".freeze,

    # FF6D HALFWIDTH KATAKANA LETTER SMALL YU
    # ->   30E5 KATAKANA LETTER SMALL YU
    "\u{FF6D}".freeze => "\u{30E5}".freeze,

    # FF6E HALFWIDTH KATAKANA LETTER SMALL YO
    # ->   30E7 KATAKANA LETTER SMALL YO
    "\u{FF6E}".freeze => "\u{30E7}".freeze,

    # FF6F HALFWIDTH KATAKANA LETTER SMALL TU
    # ->   30C3 KATAKANA LETTER SMALL TU
    "\u{FF6F}".freeze => "\u{30C3}".freeze,

    # FF70 HALFWIDTH KATAKANA-HIRAGANA PROLONGED SOUND MARK
    # ->   30FC KATAKANA-HIRAGANA PROLONGED SOUND MARK
    "\u{FF70}".freeze => "\u{30FC}".freeze,

    # FF71 HALFWIDTH KATAKANA LETTER A
    # ->   30A2 KATAKANA LETTER A
    "\u{FF71}".freeze => "\u{30A2}".freeze,

    # FF72 HALFWIDTH KATAKANA LETTER I
    # ->   30A4 KATAKANA LETTER I
    "\u{FF72}".freeze => "\u{30A4}".freeze,

    # FF73 HALFWIDTH KATAKANA LETTER U
    # ->   30A6 KATAKANA LETTER U
    "\u{FF73}".freeze => "\u{30A6}".freeze,

    # FF74 HALFWIDTH KATAKANA LETTER E
    # ->   30A8 KATAKANA LETTER E
    "\u{FF74}".freeze => "\u{30A8}".freeze,

    # FF75 HALFWIDTH KATAKANA LETTER O
    # ->   30AA KATAKANA LETTER O
    "\u{FF75}".freeze => "\u{30AA}".freeze,

    # FF76 HALFWIDTH KATAKANA LETTER KA
    # ->   30AB KATAKANA LETTER KA
    "\u{FF76}".freeze => "\u{30AB}".freeze,

    # FF77 HALFWIDTH KATAKANA LETTER KI
    # ->   30AD KATAKANA LETTER KI
    "\u{FF77}".freeze => "\u{30AD}".freeze,

    # FF78 HALFWIDTH KATAKANA LETTER KU
    # ->   30AF KATAKANA LETTER KU
    "\u{FF78}".freeze => "\u{30AF}".freeze,

    # FF79 HALFWIDTH KATAKANA LETTER KE
    # ->   30B1 KATAKANA LETTER KE
    "\u{FF79}".freeze => "\u{30B1}".freeze,

    # FF7A HALFWIDTH KATAKANA LETTER KO
    # ->   30B3 KATAKANA LETTER KO
    "\u{FF7A}".freeze => "\u{30B3}".freeze,

    # FF7B HALFWIDTH KATAKANA LETTER SA
    # ->   30B5 KATAKANA LETTER SA
    "\u{FF7B}".freeze => "\u{30B5}".freeze,

    # FF7C HALFWIDTH KATAKANA LETTER SI
    # ->   30B7 KATAKANA LETTER SI
    "\u{FF7C}".freeze => "\u{30B7}".freeze,

    # FF7D HALFWIDTH KATAKANA LETTER SU
    # ->   30B9 KATAKANA LETTER SU
    "\u{FF7D}".freeze => "\u{30B9}".freeze,

    # FF7E HALFWIDTH KATAKANA LETTER SE
    # ->   30BB KATAKANA LETTER SE
    "\u{FF7E}".freeze => "\u{30BB}".freeze,

    # FF7F HALFWIDTH KATAKANA LETTER SO
    # ->   30BD KATAKANA LETTER SO
    "\u{FF7F}".freeze => "\u{30BD}".freeze,

    # FF80 HALFWIDTH KATAKANA LETTER TA
    # ->   30BF KATAKANA LETTER TA
    "\u{FF80}".freeze => "\u{30BF}".freeze,

    # FF81 HALFWIDTH KATAKANA LETTER TI
    # ->   30C1 KATAKANA LETTER TI
    "\u{FF81}".freeze => "\u{30C1}".freeze,

    # FF82 HALFWIDTH KATAKANA LETTER TU
    # ->   30C4 KATAKANA LETTER TU
    "\u{FF82}".freeze => "\u{30C4}".freeze,

    # FF83 HALFWIDTH KATAKANA LETTER TE
    # ->   30C6 KATAKANA LETTER TE
    "\u{FF83}".freeze => "\u{30C6}".freeze,

    # FF84 HALFWIDTH KATAKANA LETTER TO
    # ->   30C8 KATAKANA LETTER TO
    "\u{FF84}".freeze => "\u{30C8}".freeze,

    # FF85 HALFWIDTH KATAKANA LETTER NA
    # ->   30CA KATAKANA LETTER NA
    "\u{FF85}".freeze => "\u{30CA}".freeze,

    # FF86 HALFWIDTH KATAKANA LETTER NI
    # ->   30CB KATAKANA LETTER NI
    "\u{FF86}".freeze => "\u{30CB}".freeze,

    # FF87 HALFWIDTH KATAKANA LETTER NU
    # ->   30CC KATAKANA LETTER NU
    "\u{FF87}".freeze => "\u{30CC}".freeze,

    # FF88 HALFWIDTH KATAKANA LETTER NE
    # ->   30CD KATAKANA LETTER NE
    "\u{FF88}".freeze => "\u{30CD}".freeze,

    # FF89 HALFWIDTH KATAKANA LETTER NO
    # ->   30CE KATAKANA LETTER NO
    "\u{FF89}".freeze => "\u{30CE}".freeze,

    # FF8A HALFWIDTH KATAKANA LETTER HA
    # ->   30CF KATAKANA LETTER HA
    "\u{FF8A}".freeze => "\u{30CF}".freeze,

    # FF8B HALFWIDTH KATAKANA LETTER HI
    # ->   30D2 KATAKANA LETTER HI
    "\u{FF8B}".freeze => "\u{30D2}".freeze,

    # FF8C HALFWIDTH KATAKANA LETTER HU
    # ->   30D5 KATAKANA LETTER HU
    "\u{FF8C}".freeze => "\u{30D5}".freeze,

    # FF8D HALFWIDTH KATAKANA LETTER HE
    # ->   30D8 KATAKANA LETTER HE
    "\u{FF8D}".freeze => "\u{30D8}".freeze,

    # FF8E HALFWIDTH KATAKANA LETTER HO
    # ->   30DB KATAKANA LETTER HO
    "\u{FF8E}".freeze => "\u{30DB}".freeze,

    # FF8F HALFWIDTH KATAKANA LETTER MA
    # ->   30DE KATAKANA LETTER MA
    "\u{FF8F}".freeze => "\u{30DE}".freeze,

    # FF90 HALFWIDTH KATAKANA LETTER MI
    # ->   30DF KATAKANA LETTER MI
    "\u{FF90}".freeze => "\u{30DF}".freeze,

    # FF91 HALFWIDTH KATAKANA LETTER MU
    # ->   30E0 KATAKANA LETTER MU
    "\u{FF91}".freeze => "\u{30E0}".freeze,

    # FF92 HALFWIDTH KATAKANA LETTER ME
    # ->   30E1 KATAKANA LETTER ME
    "\u{FF92}".freeze => "\u{30E1}".freeze,

    # FF93 HALFWIDTH KATAKANA LETTER MO
    # ->   30E2 KATAKANA LETTER MO
    "\u{FF93}".freeze => "\u{30E2}".freeze,

    # FF94 HALFWIDTH KATAKANA LETTER YA
    # ->   30E4 KATAKANA LETTER YA
    "\u{FF94}".freeze => "\u{30E4}".freeze,

    # FF95 HALFWIDTH KATAKANA LETTER YU
    # ->   30E6 KATAKANA LETTER YU
    "\u{FF95}".freeze => "\u{30E6}".freeze,

    # FF96 HALFWIDTH KATAKANA LETTER YO
    # ->   30E8 KATAKANA LETTER YO
    "\u{FF96}".freeze => "\u{30E8}".freeze,

    # FF97 HALFWIDTH KATAKANA LETTER RA
    # ->   30E9 KATAKANA LETTER RA
    "\u{FF97}".freeze => "\u{30E9}".freeze,

    # FF98 HALFWIDTH KATAKANA LETTER RI
    # ->   30EA KATAKANA LETTER RI
    "\u{FF98}".freeze => "\u{30EA}".freeze,

    # FF99 HALFWIDTH KATAKANA LETTER RU
    # ->   30EB KATAKANA LETTER RU
    "\u{FF99}".freeze => "\u{30EB}".freeze,

    # FF9A HALFWIDTH KATAKANA LETTER RE
    # ->   30EC KATAKANA LETTER RE
    "\u{FF9A}".freeze => "\u{30EC}".freeze,

    # FF9B HALFWIDTH KATAKANA LETTER RO
    # ->   30ED KATAKANA LETTER RO
    "\u{FF9B}".freeze => "\u{30ED}".freeze,

    # FF9C HALFWIDTH KATAKANA LETTER WA
    # ->   30EF KATAKANA LETTER WA
    "\u{FF9C}".freeze => "\u{30EF}".freeze,

    # FF9D HALFWIDTH KATAKANA LETTER N
    # ->   30F3 KATAKANA LETTER N
    "\u{FF9D}".freeze => "\u{30F3}".freeze,

    # FFA0 HALFWIDTH HANGUL FILLER
    # ->   1160 HANGUL JUNGSEONG FILLER
    "\u{FFA0}".freeze => "\u{1160}".freeze,

    # FFA1 HALFWIDTH HANGUL LETTER KIYEOK
    # ->   1100 HANGUL CHOSEONG KIYEOK
    "\u{FFA1}".freeze => "\u{1100}".freeze,

    # FFA2 HALFWIDTH HANGUL LETTER SSANGKIYEOK
    # ->   1101 HANGUL CHOSEONG SSANGKIYEOK
    "\u{FFA2}".freeze => "\u{1101}".freeze,

    # FFA3 HALFWIDTH HANGUL LETTER KIYEOK-SIOS
    # ->   11AA HANGUL JONGSEONG KIYEOK-SIOS
    "\u{FFA3}".freeze => "\u{11AA}".freeze,

    # FFA4 HALFWIDTH HANGUL LETTER NIEUN
    # ->   1102 HANGUL CHOSEONG NIEUN
    "\u{FFA4}".freeze => "\u{1102}".freeze,

    # FFA5 HALFWIDTH HANGUL LETTER NIEUN-CIEUC
    # ->   11AC HANGUL JONGSEONG NIEUN-CIEUC
    "\u{FFA5}".freeze => "\u{11AC}".freeze,

    # FFA6 HALFWIDTH HANGUL LETTER NIEUN-HIEUH
    # ->   11AD HANGUL JONGSEONG NIEUN-HIEUH
    "\u{FFA6}".freeze => "\u{11AD}".freeze,

    # FFA7 HALFWIDTH HANGUL LETTER TIKEUT
    # ->   1103 HANGUL CHOSEONG TIKEUT
    "\u{FFA7}".freeze => "\u{1103}".freeze,

    # FFA8 HALFWIDTH HANGUL LETTER SSANGTIKEUT
    # ->   1104 HANGUL CHOSEONG SSANGTIKEUT
    "\u{FFA8}".freeze => "\u{1104}".freeze,

    # FFA9 HALFWIDTH HANGUL LETTER RIEUL
    # ->   1105 HANGUL CHOSEONG RIEUL
    "\u{FFA9}".freeze => "\u{1105}".freeze,

    # FFAA HALFWIDTH HANGUL LETTER RIEUL-KIYEOK
    # ->   11B0 HANGUL JONGSEONG RIEUL-KIYEOK
    "\u{FFAA}".freeze => "\u{11B0}".freeze,

    # FFAB HALFWIDTH HANGUL LETTER RIEUL-MIEUM
    # ->   11B1 HANGUL JONGSEONG RIEUL-MIEUM
    "\u{FFAB}".freeze => "\u{11B1}".freeze,

    # FFAC HALFWIDTH HANGUL LETTER RIEUL-PIEUP
    # ->   11B2 HANGUL JONGSEONG RIEUL-PIEUP
    "\u{FFAC}".freeze => "\u{11B2}".freeze,

    # FFAD HALFWIDTH HANGUL LETTER RIEUL-SIOS
    # ->   11B3 HANGUL JONGSEONG RIEUL-SIOS
    "\u{FFAD}".freeze => "\u{11B3}".freeze,

    # FFAE HALFWIDTH HANGUL LETTER RIEUL-THIEUTH
    # ->   11B4 HANGUL JONGSEONG RIEUL-THIEUTH
    "\u{FFAE}".freeze => "\u{11B4}".freeze,

    # FFAF HALFWIDTH HANGUL LETTER RIEUL-PHIEUPH
    # ->   11B5 HANGUL JONGSEONG RIEUL-PHIEUPH
    "\u{FFAF}".freeze => "\u{11B5}".freeze,

    # FFB0 HALFWIDTH HANGUL LETTER RIEUL-HIEUH
    # ->   111A HANGUL CHOSEONG RIEUL-HIEUH
    "\u{FFB0}".freeze => "\u{111A}".freeze,

    # FFB1 HALFWIDTH HANGUL LETTER MIEUM
    # ->   1106 HANGUL CHOSEONG MIEUM
    "\u{FFB1}".freeze => "\u{1106}".freeze,

    # FFB2 HALFWIDTH HANGUL LETTER PIEUP
    # ->   1107 HANGUL CHOSEONG PIEUP
    "\u{FFB2}".freeze => "\u{1107}".freeze,

    # FFB3 HALFWIDTH HANGUL LETTER SSANGPIEUP
    # ->   1108 HANGUL CHOSEONG SSANGPIEUP
    "\u{FFB3}".freeze => "\u{1108}".freeze,

    # FFB4 HALFWIDTH HANGUL LETTER PIEUP-SIOS
    # ->   1121 HANGUL CHOSEONG PIEUP-SIOS
    "\u{FFB4}".freeze => "\u{1121}".freeze,

    # FFB5 HALFWIDTH HANGUL LETTER SIOS
    # ->   1109 HANGUL CHOSEONG SIOS
    "\u{FFB5}".freeze => "\u{1109}".freeze,

    # FFB6 HALFWIDTH HANGUL LETTER SSANGSIOS
    # ->   110A HANGUL CHOSEONG SSANGSIOS
    "\u{FFB6}".freeze => "\u{110A}".freeze,

    # FFB7 HALFWIDTH HANGUL LETTER IEUNG
    # ->   110B HANGUL CHOSEONG IEUNG
    "\u{FFB7}".freeze => "\u{110B}".freeze,

    # FFB8 HALFWIDTH HANGUL LETTER CIEUC
    # ->   110C HANGUL CHOSEONG CIEUC
    "\u{FFB8}".freeze => "\u{110C}".freeze,

    # FFB9 HALFWIDTH HANGUL LETTER SSANGCIEUC
    # ->   110D HANGUL CHOSEONG SSANGCIEUC
    "\u{FFB9}".freeze => "\u{110D}".freeze,

    # FFBA HALFWIDTH HANGUL LETTER CHIEUCH
    # ->   110E HANGUL CHOSEONG CHIEUCH
    "\u{FFBA}".freeze => "\u{110E}".freeze,

    # FFBB HALFWIDTH HANGUL LETTER KHIEUKH
    # ->   110F HANGUL CHOSEONG KHIEUKH
    "\u{FFBB}".freeze => "\u{110F}".freeze,

    # FFBC HALFWIDTH HANGUL LETTER THIEUTH
    # ->   1110 HANGUL CHOSEONG THIEUTH
    "\u{FFBC}".freeze => "\u{1110}".freeze,

    # FFBD HALFWIDTH HANGUL LETTER PHIEUPH
    # ->   1111 HANGUL CHOSEONG PHIEUPH
    "\u{FFBD}".freeze => "\u{1111}".freeze,

    # FFBE HALFWIDTH HANGUL LETTER HIEUH
    # ->   1112 HANGUL CHOSEONG HIEUH
    "\u{FFBE}".freeze => "\u{1112}".freeze,

    # FFC2 HALFWIDTH HANGUL LETTER A
    # ->   1161 HANGUL JUNGSEONG A
    "\u{FFC2}".freeze => "\u{1161}".freeze,

    # FFC3 HALFWIDTH HANGUL LETTER AE
    # ->   1162 HANGUL JUNGSEONG AE
    "\u{FFC3}".freeze => "\u{1162}".freeze,

    # FFC4 HALFWIDTH HANGUL LETTER YA
    # ->   1163 HANGUL JUNGSEONG YA
    "\u{FFC4}".freeze => "\u{1163}".freeze,

    # FFC5 HALFWIDTH HANGUL LETTER YAE
    # ->   1164 HANGUL JUNGSEONG YAE
    "\u{FFC5}".freeze => "\u{1164}".freeze,

    # FFC6 HALFWIDTH HANGUL LETTER EO
    # ->   1165 HANGUL JUNGSEONG EO
    "\u{FFC6}".freeze => "\u{1165}".freeze,

    # FFC7 HALFWIDTH HANGUL LETTER E
    # ->   1166 HANGUL JUNGSEONG E
    "\u{FFC7}".freeze => "\u{1166}".freeze,

    # FFCA HALFWIDTH HANGUL LETTER YEO
    # ->   1167 HANGUL JUNGSEONG YEO
    "\u{FFCA}".freeze => "\u{1167}".freeze,

    # FFCB HALFWIDTH HANGUL LETTER YE
    # ->   1168 HANGUL JUNGSEONG YE
    "\u{FFCB}".freeze => "\u{1168}".freeze,

    # FFCC HALFWIDTH HANGUL LETTER O
    # ->   1169 HANGUL JUNGSEONG O
    "\u{FFCC}".freeze => "\u{1169}".freeze,

    # FFCD HALFWIDTH HANGUL LETTER WA
    # ->   116A HANGUL JUNGSEONG WA
    "\u{FFCD}".freeze => "\u{116A}".freeze,

    # FFCE HALFWIDTH HANGUL LETTER WAE
    # ->   116B HANGUL JUNGSEONG WAE
    "\u{FFCE}".freeze => "\u{116B}".freeze,

    # FFCF HALFWIDTH HANGUL LETTER OE
    # ->   116C HANGUL JUNGSEONG OE
    "\u{FFCF}".freeze => "\u{116C}".freeze,

    # FFD2 HALFWIDTH HANGUL LETTER YO
    # ->   116D HANGUL JUNGSEONG YO
    "\u{FFD2}".freeze => "\u{116D}".freeze,

    # FFD3 HALFWIDTH HANGUL LETTER U
    # ->   116E HANGUL JUNGSEONG U
    "\u{FFD3}".freeze => "\u{116E}".freeze,

    # FFD4 HALFWIDTH HANGUL LETTER WEO
    # ->   116F HANGUL JUNGSEONG WEO
    "\u{FFD4}".freeze => "\u{116F}".freeze,

    # FFD5 HALFWIDTH HANGUL LETTER WE
    # ->   1170 HANGUL JUNGSEONG WE
    "\u{FFD5}".freeze => "\u{1170}".freeze,

    # FFD6 HALFWIDTH HANGUL LETTER WI
    # ->   1171 HANGUL JUNGSEONG WI
    "\u{FFD6}".freeze => "\u{1171}".freeze,

    # FFD7 HALFWIDTH HANGUL LETTER YU
    # ->   1172 HANGUL JUNGSEONG YU
    "\u{FFD7}".freeze => "\u{1172}".freeze,

    # FFDA HALFWIDTH HANGUL LETTER EU
    # ->   1173 HANGUL JUNGSEONG EU
    "\u{FFDA}".freeze => "\u{1173}".freeze,

    # FFDB HALFWIDTH HANGUL LETTER YI
    # ->   1174 HANGUL JUNGSEONG YI
    "\u{FFDB}".freeze => "\u{1174}".freeze,

    # FFDC HALFWIDTH HANGUL LETTER I
    # ->   1175 HANGUL JUNGSEONG I
    "\u{FFDC}".freeze => "\u{1175}".freeze,

    # FFE0 FULLWIDTH CENT SIGN
    # ->   00A2 CENT SIGN
    "\u{FFE0}".freeze => "\u{A2}".freeze,

    # FFE1 FULLWIDTH POUND SIGN
    # ->   00A3 POUND SIGN
    "\u{FFE1}".freeze => "\u{A3}".freeze,

    # FFE2 FULLWIDTH NOT SIGN
    # ->   00AC NOT SIGN
    "\u{FFE2}".freeze => "\u{AC}".freeze,

    # FFE3 FULLWIDTH MACRON
    # ->   0020 SPACE
    "\u{FFE3}".freeze => ' '.freeze,

    # FFE4 FULLWIDTH BROKEN BAR
    # ->   00A6 BROKEN BAR
    "\u{FFE4}".freeze => "\u{A6}".freeze,

    # FFE5 FULLWIDTH YEN SIGN
    # ->   00A5 YEN SIGN
    "\u{FFE5}".freeze => "\u{A5}".freeze,

    # FFE6 FULLWIDTH WON SIGN
    # ->   20A9 WON SIGN
    "\u{FFE6}".freeze => "\u{20A9}".freeze,

    # FFE8 HALFWIDTH FORMS LIGHT VERTICAL
    # ->   2502 BOX DRAWINGS LIGHT VERTICAL
    "\u{FFE8}".freeze => "\u{2502}".freeze,

    # FFE9 HALFWIDTH LEFTWARDS ARROW
    # ->   2190 LEFTWARDS ARROW
    "\u{FFE9}".freeze => "\u{2190}".freeze,

    # FFEA HALFWIDTH UPWARDS ARROW
    # ->   2191 UPWARDS ARROW
    "\u{FFEA}".freeze => "\u{2191}".freeze,

    # FFEB HALFWIDTH RIGHTWARDS ARROW
    # ->   2192 RIGHTWARDS ARROW
    "\u{FFEB}".freeze => "\u{2192}".freeze,

    # FFEC HALFWIDTH DOWNWARDS ARROW
    # ->   2193 DOWNWARDS ARROW
    "\u{FFEC}".freeze => "\u{2193}".freeze,

    # FFED HALFWIDTH BLACK SQUARE
    # ->   25A0 BLACK SQUARE
    "\u{FFED}".freeze => "\u{25A0}".freeze,

    # FFEE HALFWIDTH WHITE CIRCLE
    # ->   25CB WHITE CIRCLE
    "\u{FFEE}".freeze => "\u{25CB}".freeze,
  }.freeze

end

