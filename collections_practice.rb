  # your code goes here
require 'pry'

def begins_with_r(array)
  flag = true
  array.each do |word|
    if word.chars.first != "r"
      flag = false
      break
    elseif word.chars.first != "R"
      flag = false
      break
    end
  end
  flag
end


def contain_a(array)
  empty = []
  array.each do |word|
    if word.include? "a"
      empty.push(word)
    end
  end
  empty
end

def first_wa(array)
  array.find do |word|
    word[0,2] == "wa"
  end
end

def remove_non_strings(array)
  array.delete_if do |thing|
    thing.class.name != "String"
  end
end

def count_elements(array)
  array.map do |name|
    {:name => name.values.join, :count => array.count(name)}
  end.uniq
end

def merge_data(keys, data)
  keys.map do |key_array|
    key_array.map do |key_key, string|
      if key_key == :first_name
        data.map do |data_array|
          data_array.map do |name, data_hash|
            if name == string
              data_hash.merge(key_array)
            end
          end
        end
      end
    end
  end.flatten.compact
end

# want [{:awesomeness=>10, :first_name=>"blake", :height=>"74", :last_name=>"johnson",
#  :motto=>"Have a koala...:first_name=>"ashley", :height=>60, :last_name=>"dubs",
#  :motto=>"I dub thee, 'Lady Brett Ashley'."}]

#keys
#=> [{:first_name=>"blake", :motto=>"Have a koala-ty day!"},
# {:first_name=>"ashley", :motto=>"I dub thee, 'Lady Brett Ashley'."}]

#data
#=> [{"blake"=>{:awesomeness=>10, :height=>"74", :last_name=>"johnson"},
#  "ashley"=>{:awesomeness=>9, :height=>60, :last_name=>"dubs"}}]




def find_cool(cool)
  cool.map do |hash|
    hash.map do |key, string|
      if key == :temperature && string == "cool"
        hash
      end
    end
  end.flatten.compact

  #cool = [{:name=>"ashley", :temperature=>"sort of cool"},
  #        {:name=>"blake", :temperature=>"cool"}]
end


def organize_schools(schools)
  new_schools = {}
  schools.each do |school, location_hash|

    if new_schools[location_hash.values.join] == nil
      new_schools[location_hash.values.join] = []
    end
      new_schools[location_hash.values.join] << school
      binding.pry
  end

  new_schools

end
#expected: {"Chicago"=>["dev boot camp chicago"],
#  "NYC"=>["flatiron school bk", "flatiron school", "general assembly"],
#  "SF"=>["dev boot camp", "Hack Reactor"]}

#schools = {"flatiron school bk"=>{:location=>"NYC"},
# "flatiron school"=>{:location=>"NYC"},
# "dev boot camp"=>{:location=>"SF"},
# "dev boot camp chicago"=>{:location=>"Chicago"},
# "general assembly"=>{:location=>"NYC"},
# "Hack Reactor"=>{:location=>"SF"}}



=begin
def organize_schools(schools)
  schools.map do |school, location_hash|
    location_hash.map do |key, city|
      city
    end
  end.uniq.flatten.map do |city1|
     {city1 => schools.map do |school, location_hash|
       location_hash.map do |key, city2|
         if city2 == city1
           school
         else
         end
       end.join
     end}
  end
end
=end

=begin
def organize_schools(schools)
  schools.map do |school, location_hash|

    location_hash.map do |key, city|
      city
    end
  end.uniq.flatten.map do |city1|

      school_values = schools.map do |school, location_hash|
        #binding.pry
       location_hash.select {|school| location_hash.values.join == city1}
       end
  end
end
=end
