@class = ["Alex", "Ahyonna", "Ariah", "Cassie", "Laura", "Nia", "Riya", "Shree", 
"Sneha", "Vienne"]

def seating_chart(num)
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
    seating_chart_check(groups)
end

def seating_chart_check(groups)
    if unapproved_groups(groups)
        seating_chart(@num)
    else
        pretty_print(groups)
    end
end

def unapproved_groups(groups)
    groups.include?(["Ariah", "Vienne"]) || groups.include?(["Vienne","Ariah"]) || 
    groups.include?(["Ariah", "Cassie"]) || groups.include?(["Cassie", "Ariah"])
end

def pretty_print(groups)
    i = 0 
    until i > groups.length
        puts "Group #{i+1}:"
        groups[i].each do |student|
            puts "#{student}"
        end
        puts " "
        i += 1
    end
end

seating_chart(3)