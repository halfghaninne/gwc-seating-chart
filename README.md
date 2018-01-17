# GWC Seating Chart
## A quick script for creating class groups of any size, avoiding disruptive matches.

**Ruby**

## Summary

As a facilitator for Girls Who Code at [Do Space](http://dospace.org/), I often found myself wanting to divvy up the students into groups on the fly during class. _But_ I also wanted to avoid certain pairings of students that I knew would be disruptive. 

So, I quickly threw together this little script in my language of choice, Ruby. 

Currently, the application needs to be run locally in the command line, and the class roster is hard-coded into the script _(yikes, right?)._ More on that below.

## Where to improve

Moving forward with this script I want to:
1. Evaluate the efficiency of each of the methods in terms of O notation, and rewrite them to be more performant
2. Convert to OOP 
3. Expand the application to give instructors a UI to manage multiple classes and to update their `unapproved_groups` (i.e. don't hard-code them into the method :joy: ). Several educators have told me that This Is A Thing, so I'd love to make it usable. 