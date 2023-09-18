# -*- encoding: utf-8 -*-
require 'json'

def main
  ('a'..'z').each {|c|
    File.readlines("./src/#{c}.txt").each {|line|
      word, translated = line.split("\t")
      if (target_word?(word))
        h = {
          'word' => word,
          'translated' => translated
        }

        open("./json/#{word.downcase}.json", "w") {|of|
          of.write(h.to_json)
        }
      end
    }
  }
end

def target_word?(word)
  if (word.include?("'"))
    return false
  end

  if (word.include?("/"))
    return false
  end

  if (word.include?(","))
    return false
  end

  if (word.include?(" "))
    return false
  end

  return true
end

case $PROGRAM_NAME
when __FILE__
  main
when /spec[^\/]*$/
  # {spec of the implementation}
end

