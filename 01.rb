#!/usr/bin/env ruby

def hex_to_bin(hex)
 bin =  hex.scan(/../).map { |b| b.hex.chr }.join
 return bin
end

def bin_to_b64(bin)
  base64_chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
  b64 = ""
  strings = bin.scan(/.{2}./)
  strings.each do |str|
    bin_str = str.bytes.map { |c| "%08b" % c  }.join
    chars = bin_str.scan(/.{6}/).map { |b| b.to_i(2) }
    b64 << chars.map { |c| base64_chars[c] }.join
  end
  return b64
end

def hex_to_b64(hex)
  return bin_to_b64(hex_to_bin(hex))
end

puts hex_to_b64("49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d")

