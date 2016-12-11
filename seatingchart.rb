@class = ["Amethyst","Garnet","Pearl","Steven","Connie","Greg",
        "Peridot","Lapis","Jasper", "Lion", "Onion"]

def group_split(num)
    @num = num
    arr = @class.shuffle
    groups = []
    counter = @num
    i = 0
    until i >= arr.length
        groups << arr[i..(counter-1)]
        counter += @num
        i+= @num
    end
    seating_chart_check(dangler_check(groups))
end

def seating_chart_check(groups)
    if unapproved_groups(groups)
        group_split(@num)
    else
        pretty_print(groups)
    end
end

def unapproved_groups(groups)
    nope = 0
    groups.each do |group|
        if group.include?("Jasper") && group.include?("Lapis")
            nope += 1
        elsif group.include?("Jasper") && group.include?("Peridot")
            nope += 1
        end
    end
    nope > 0
end

def dangler_check(groups)
    i = 0
    until i >= groups.length 
        if groups[i].length == 1
            groups[i-1] << groups[i][0]
            dangler_index = i 
        end
        i += 1
    end
    groups.delete_at(dangler_index) if dangler_index
    return groups
end

def pretty_print(groups)
    i = 0 
    until i >= groups.length
        puts " "
        puts "Group #{i+1}:"
        groups[i].each do |student|
            puts "#{student}"
        end
        i += 1
    end
end

puts "Enter the number of students per group:"
num = gets.chomp.to_i
group_split(num)