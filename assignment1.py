from collections import Counter
from itertools import permutations
from typing import List, Dict, Tuple
import time, functools, logging

"""
1. Collections Module
Function Name: count_elements
Function Input: list_of_elements
Function Output: A dictionary

Task: Import the collections module. Write a function that uses collections.Counter to count the number
of each element in a given list and returns this as a dictionary.
"""
def count_elements(list_of_elements : List[int]) -> Dict[int, int]:
    frequency_dictionary = Counter(list_of_elements)
    return frequency_dictionary

# Uncomment the below line to run the function above
#print(count_elements([1, 2, 3, 4, 5, 4 ,2, 6, 7, 3]))


"""
2. itertools Module
Function Name: get_permutations
Function Input: string, n
Function Output: A list of strings

Task: Import the itertools module. Write a function that uses itertools.permutations to generate and return a list of all n length permutations of a given string.

"""

def get_permutations(string : str, n : int) -> List[Tuple]:
    return list(permutations(string, n))

# Uncomment the below line to run the function above
#print(get_permutations('abcdefg', 3))

"""
3. Object-Oriented Programming in Python
Class Name: Rectangle
Methods: __init__(self, width, height), area(self), perimeter(self)

Task: Create a class Rectangle with an initializer that accepts width and height. 
Include methods that calculate and return the area and perimeter of the rectangle.
"""
class Rectangle:
    def __init__(self, width : float, height : float) -> None:
        self.width = width
        self.height = height

    def area(self) -> float:
        return self.height * self.width

    def perimeter(self) -> float:
        return 2 * (self.width + self.height)

# # Uncomment the below lines to run the class above
# rectangle = Rectangle(10, 20.4)
# print(rectangle.area())
# print(rectangle.perimeter())

"""
4. Destructor
Class Name: FileHandler
Methods: __init__(self, file_name, mode), write_to_file(self, content), __del__(self)

Task: Create a class FileHandler that opens a file in the initializer, provides a method 
write_to_file to write content to the file, and closes the file in the destructor method.
"""
class FileHandler:
    def __init__(self, file_name, mode):
        self.file_name = file_name
        self.mode = mode
        self.file = open(file_name, mode)
        print(f"File '{file_name}' opened in '{mode}' mode.")

    def write_to_file(self, content):
        if self.file and not self.file.closed:
            self.file.write(content + '\n')
            print(f"Content written to '{self.file_name}'.")
        else:
            print("File is not open for writing.")

    def __del__(self):
        if hasattr(self, 'file') and self.file and not self.file.closed:
            self.file.close()
            print(f"File '{self.file_name}' closed.")


# # Uncomment the below lines to run the class above
# if __name__ == "__main__":
#     handler = FileHandler("sample.txt", "w")
#     handler.write_to_file("Hello, world!")
#     del handler

"""
5. Decorators
Function Name: time_taken
Function Input: A function
Function Output: Wrapper function

Task: Write a decorator time_taken that logs the time taken to execute a function. 
This decorator should be applicable to any function and print the time taken in seconds.
"""
def time_taken(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        start_time = time.time()
        result = func(*args, **kwargs)
        end_time = time.time()
        print(f"Time taken by {func.__name__}: {end_time - start_time:.6f} seconds")
        return result
    return wrapper


@time_taken
def example_function(n):
    time.sleep(n)
    return f"Slept for {n} seconds"

# Uncomment the below lines for running the above functionality
# print(example_function(2))


"""

"""
# Configure logging to log errors to a file
logging.basicConfig(filename='errors.log', level=logging.ERROR,
                    format='%(asctime)s - %(levelname)s - %(message)s')

def log_errors(func):
    """Decorator that logs errors if the function raises an exception."""
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except Exception as e:
            logging.error(f"Error in function {func.__name__}: {e}", exc_info=True)
            raise
    return wrapper

# Example Usage
@log_errors
def divide(a, b):
    return a / b

try:
    print(divide(5, 0))
except ZeroDivisionError:
    print("Caught an exception")



