total_contains = 0
total_overlaps = 0

list_file = __dir__ + '/LIST.txt'

File.foreach(list_file) do |line|
    sections = line.strip.split(/[-,\,]/)
    section1 = (sections[0]..sections[1]).step(1).to_a
    section2 = (sections[2]..sections[3]).step(1).to_a
    if (section1 - section2).length == 0 or (section2 - section1).length == 0
        total_contains += 1
    end
    if (section1 - section2).length < section1.length or (section2 - section1).length < section2.length
        total_overlaps += 1
    end
 end

 puts total_contains
 puts total_overlaps
