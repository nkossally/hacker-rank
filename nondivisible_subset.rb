require 'byebug'
require 'set'
def nonDivisibleSubset(k, s)
  mod_counts = {}
  for elem in s
    mod = elem%k
    mod_counts[mod] = mod_counts[mod] ? mod_counts[mod]+=1 : 1
  end
  mod_counts_array = mod_counts.keys.sort_by { |mod| mod_counts[mod]}
  selected = []
  result = 0
  while mod_counts_array.length>0
    curr = mod_counts_array.pop
    if !selected.include?((-1*curr)%k)
      selected.push(curr)
      increment = curr == (-curr%k) ? 1 : mod_counts[curr]
      result += increment
    end
  end
  result

end




p nonDivisibleSubset(4, [1,2,3,4,5, 6, 7, 8, 9, 10])
