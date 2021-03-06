#!/usr/bin/ruby

###
# SOLUTION
###
# Given the binary representation of L and R we have to analize bit by bit the 
# both numbers and modify them to find A and B. 
# We start setting that bin(A) = bin(L) and bin(B) = bin(R). Now we compare each
# numbers bit, from left to right, modifing A or B in each comparison if they're 
# equal using the following rule:
#   a. Nor A or B can be modified if there wasn't any left A and B different 
#      bits. This is necessary to assure that A <= B 
#   b. If the nth bit of A and B are 1, we modify the nth bit of B to 0. This
#      assure that A <= B <= R
#   c. If the nth bit of A and B are 0, we modigy the nth bit of A to 1. This 
#      will assure that L <= A <= B
#
# Example 1: L=6, R=14
#   bin(A) = 0 1 1 0 
#   bin(B) = 1 1 1 0
# The first left-most bit of A and B are 0 and 1, so no changes are needed here.
# The following 2 digits are both 1, and according to rule b. they should be 
# changed on B by 0, and we can do it becouse the rule a. was already fulfilled 
# with the 1st bit.
# The last 2 bits are both 0, so we have to change it on A by 1, according to
# rule c.
# The final A and B:
#   bin(A) = 0 1 1 1 ; dec(A) = 7
#   bin(B) = 1 0 0 0 ; dec(B) = 8
# And bin(A xor B) = bin(1111) = dec(15)
#
#
# Example 2: L=10, R=15
#   bin(A) = 1 0 1 0 
#   bin(B) = 1 1 1 1
# Both first bits are 1, but we can change B now or otherwise we will have 
# B < A, so nothing is done in the first bits. 
# The second bits are differents, so we're good.
# On the 3rd bit they're both 1 again but we already got different bits on the 
# last comparison, so we can change B according to rule b.
# And the last bits are diffents, so nothing to do.
# The final A and B:
#   bin(A) = 1 0 1 0 ; dec(A) = 10
#   bin(B) = 1 1 0 1 ; dec(B) = 13
# And bin(A xor B) = bin(0111) = dec(7)
# 
# 
# IMPROVEMENT 
# After some tests it becomes clear that after finding the first leftmost 
# different bit all right bits can be changed. So, the best solution is to find
# the Leftmost different bit's position and all fill all right bits with 1.
# maxXor = 2**((L^R).bit_length) - 1 

###
# HELPERS & CONSTANTS
###
def maxXor(l, r)
  return 2**((l^r).to_s(2).size) - 1
end

###
# MAIN
###
l = gets.to_i
r = gets.to_i
puts maxXor(l, r)