@class = ["Amethyst","Garnet","Pearl","Steven","Connie","Greg",
        "Peridot","Lapis","Jasper", "Lion", "Onion"]

# Right now, pretty inefficient O(n log n + constant)
def group_split(num)
    @num = num
    # What is the time complexity here with Ruby's built-in shuffle method?
    #
    # https://szeryf.wordpress.com/2007/06/19/a-simple-shuffle-that-proved-not-so-simple-after-all/
    # ^ according to this dude, shuffle is O(nlogn)
    #
    # My first thought is that efficiency of the shuffly doesn't _really_ matter for usage of this application because _most_ use cases will involve small class sizes. But it's possible that teachers of large classes will also have a desire to keep pairings "kosher" (think student conduct adjudications)
    # switch to a Fisher Yates shuffle, which has O(n) complexity.
    arr = @class.shuffle
    groups = []
    counter = @num
    i = 0
    until i >= arr.length
        # lookup is 0(constant) efficiency ( O(@num))
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

# O(3n) - not the worst, but could improve this by using Hash table instead of several includes lookups
def unapproved_groups(groups)
    nope = 0
    # O(n)
    groups.each do |group|
        # O(2n)
        if group.include?("Jasper") && group.include?("Lapis")
            nope += 1
        # OR O(2n)
        elsif group.include?("Jasper") && group.include?("Peridot")
            nope += 1
        end
    end
    nope > 0
end

# groups is an array of arrays ( a collection of student groups )
#
# O(n) time complexity
#
# Curious to know if this collection is sorted (ie if the 'dangler' will always be at the beginning or end of the collection. If so, that will be a way to make the check more performant -- just look up the first or last item to check for length -- an operation with O(1) time complexity)
def dangler_check(groups)
    i = 0
    # O(n) - looping through each group in the collection
    # Maybe replace with a Hash table of group lenghts? Trying to figure 
    until i >= groups.length 
        # O(1)
        #
        # if there is a group that only has one member, push that member into the preceding group. 
        if groups[i].length == 1
            groups[i-1] << groups[i][0]
            dangler_index = i 
        end
        i += 1
    end
    groups.delete_at(dangler_index) if dangler_index
    return groups
end

# O(2n)
# 
# This method will probably be done away with once an application is built around the script so it's low-priority
def pretty_print(groups)
    i = 0 
    # O(n)
    until i >= groups.length
        puts " "
        puts "Group #{i+1}:"
        # O(n)
        groups[i].each do |student|
            puts "#{student}"
        end
        i += 1
    end
end

puts "Enter the number of students per group:"
num = gets.chomp.to_i
group_split(num)