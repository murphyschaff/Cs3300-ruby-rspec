# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  answer = 0
  if arr.length > 0
    for i in 0..arr.length - 1
      answer = answer + arr[i]
    end
  else
    answer = 0
  end
  return answer
end

def max_2_sum arr
  answer = 0
  #checks to see if empty array was entered
  if arr.length > 0
    #does different checks for length of the arrays
    if arr.length == 1
      answer = arr[0]
    elsif arr.length == 2
      answer = arr[0] + arr[1]
    #if the array is longer than 2 elements
    else
      num1 = 0
      num2 = 0
      #initializes ther values for num1 and 2
      if arr[0] > arr[1]
        num1 = arr[0]
        num2 = arr[1]
      else
        num1 = arr[1]
        num2 = arr[0]
      end
      #loop that checks the rest of the array to see if any numbers are larger
      for i in 2..arr.length - 1
        #if element is larger than largest value, replace largest value and move smaller value
        if arr[i] > num1
          num2 = num1
          num1 = arr[i]
        #if element is larger than 2nd largest value, replace that value
        elsif arr[i] > num2
          num2 = arr[i]
        end
      end
      #once largest values are found, add them together
      answer = num1 + num2
    end
  end
  return answer 
end

def sum_to_n? arr, n
  answer = false
  #makes sure that array has at least 2 elements
  if arr.length > 1
    #runs through each possible combination of elements and checks their sums
    for i in 0..arr.length - 1
      z = i + 1
      for x in z..arr.length - 1
        #if a combination works, answer is changed to true
        if arr[i] + arr[x] == n
          answer = true
        end
      end
    end
  end
  return answer
end

# Part 2

def hello(name)
  string = "Hello, #{name}"
  return string
end

def starts_with_consonant? s
  answer = true
  #makes sure that the string has at least one character
  if s.length > 0
    s = s.downcase
    p = s.codepoints
    #looks at ascii code to make sure the first character is in the alphabet
    if p[0] < 97 || p[0] > 122
      answer = false
    #makes sure first character is not a vowel
    elsif p[0] == 97 || p[0] == 101 || p[0] == 105 || p[0] == 111 || p[0] == 117
      answer = false
    end
  else
    answer = false
  end
  return answer
end

def binary_multiple_of_4? s
  answer = false
  if s.length > 0
    #find out if string is binary digits
    isBinary = true
    for i in 0..s.length - 1
      if s[i] != 0 || s[i] != 1 || s[i] != " "
        isBinary = false
      end
    end

    if isBinary
      #calculate decimal number
      num = 0
      for i in 0..s.length - 1
        if s[i] != " "
          digit = s[i].to_i
          num = num + (digit * 2 ** (s.length - 1) - i)
        end
      end

      if (num / 4) == 0
        answer = true
      end
    end
  end
  return answer
end

# Part 3

class BookInStock
  #constructor
  def initialize(isbn, price)
    if isbn.length == 0
      raise ArgumentError, "Enter ISBN"
    end
    if price <= 0
      raise ArgumentError, "Invalid Price"
    end
    @isbn, @price = isbn, price
  end

  #setter methods
  def isbn=(value)
    @isbn = value
  end
  def price=(value)
    @price = value
  end
  #getter methods
  def isbn
    @isbn
  end
  def price
    @price
  end

  #returns properly formatted price
  def price_as_string
    sprintf("$%.2f", @price)
  end

end
