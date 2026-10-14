import 'dart:io';

/**
Task 1 — Even or Odd
Create a program that takes an integer n.
If n is divisible by 2, print "Even".
Otherwise, print "Odd".
If n is negative, also print "Negative number".

 */
void Task_1_Even_or_Odd(int n) {
  print('\nTask_1_Even_or_Odd ');
  if (n % 2 == 0)
    print('Even');
  else
    print('Odd');
}
/**
 Task 2 — Numbers From 1 to N
Ask the user for an integer n, then print all numbers from 1 to n.
For each number:
Print "Fizz" if it is divisible by 3.
Print "Buzz" if it is divisible by 5.
Print "FizzBuzz" if it is divisible by both.
Otherwise, print the number itself.
 */

void Task2_Numbers_From_1_to_N() {
  stdout.write("Enter a number (n): ");

  int n = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= n; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print("FizzBuzz");
    } else if (i % 3 == 0) {
      print("Fizz");
    } else if (i % 5 == 0) {
      print("Buzz");
    } else {
      print(i);
    }
  }
}

/* Run Code
1- Go To termunal 
2- run command   dart run Task2.dart
3- PS F:\Course Flutter\1 Dart\Task2> dart run Task2.dart
4- Enter a number (n):  
5- if n = 3
6-   Enter a number (n): 3
output  
      1
      2
     Fizz   
 */
/**
 * Task 3 — List Statistics
Medium
Given this list:
List<int> numbers = [12, 5, 8, 21, 4, 15, 10];
Write a program that prints:
The sum of all numbers.
The largest number.
The smallest number.
The number of even elements.
A new list containing only numbers greater than 10.
Rule: Solve it using loops and conditions. Don't use built-in methods like .reduce(), .where(), or .sort().


 */
void Task_3_List_Statistics() {
  print('\nTask_3_List_Statistics');
  List<int> numbers = [12, 5, 8, 21, 4, 15, 10];
  int sum = 0;
  int max = numbers[0];
  int min = numbers[0];
  int EvenCount = 0;
  List<int> nums_greater_than_10 = [];
  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
    if (max < numbers[i]) {
      max = numbers[i];
    }
    if (min > numbers[i]) {
      min = numbers[i];
    }
    if (numbers[i] % 2 == 0) {
      EvenCount++;
    }
    if (numbers[i] > 10) {
      nums_greater_than_10.add(numbers[i]);
    }
  }
  print('\nThe sum of all numbers is :    $sum');
  print('\nThe largest number is :    $max');
  print('\nThe smallest number is :    $min');
  print('\nThe number of even elements :    $EvenCount');
  print('The new list is: ${nums_greater_than_10.join(', ')}');
}
/*
Task 4 — Student Grades Using a Map
You have a map of student names and their grades:
Write a program that:
Prints each student's name and grade.
Prints "Pass" if the grade is at least 50; otherwise, "Fail".
Calculates the class average.
Finds the student with the highest grade.
Counts how many students passed.
Challenge: Find the highest-grade student using a loop, without sorting the map.

 */

void Task_4_Student_Grades() {
  print('\nTask_4_Student_Grades');

  Map<String, int> students = {
    'Ahmed': 85,
    'Mona': 45,
    'Omar': 72,
    'Sara': 95,
    'Ali': 38,
  };

  int sum = 0;
  int max = 0;
  int passedCount = 0;
  String highestStudent = '';

  // Print each student's grade and Pass/Fail
  for (String name in students.keys) {
    int grade = students[name]!;

    print('$name: $grade');

    if (grade >= 50) {
      print('Pass');
      passedCount++;
    } else {
      print('Fail');
    }

    // Calculate total grades
    sum += grade;

    // Find the student with the highest grade
    if (grade > max) {
      max = grade;
      highestStudent = name;
    }
  }

  // Calculate class average
  double average = sum / students.length;

  print('\nTotal grades: $sum');
  print('Class average: ${average.toStringAsFixed(2)}');
  print('Number of students passed: $passedCount');
  print('Highest-grade student: $highestStudent');
  print('Highest grade: $max');
}
/**
Task 5 — Simple Calculator
Create a calculator using a switch statement.
Store two numbers and an operation:
Requirements:
Use switch to choose the operation.
If the operator is invalid, print "Invalid operation".
Prevent division or remainder by zero

 */

void Task_5_Simple_Calculator() {
  print('\nTask_5_Simple_Calculator');

  // Store two numbers
  double num1 = 20;
  double num2 = 5;

  // Store the operation
  String operator = '+';

  double result = 0;

  // Choose the operation using switch
  switch (operator) {
    case '+':
      result = num1 + num2;
      print('$num1 + $num2 = $result');
      break;

    case '-':
      result = num1 - num2;
      print('$num1 - $num2 = $result');
      break;

    case '*':
      result = num1 * num2;
      print('$num1 * $num2 = $result');
      break;

    case '/':
      if (num2 != 0) {
        result = num1 / num2;
        print('$num1 / $num2 = $result');
      } else {
        print('Cannot divide by zero');
      }
      break;

    case '%':
      if (num2 != 0) {
        result = num1 % num2;
        print('$num1 % $num2 = $result');
      } else {
        print('Cannot calculate remainder by zero');
      }
      break;

    default:
      print('Invalid operation');
  }
}
/**
Task 6 — Shopping Cart
Medium–Hard
Create a shopping cart using a list of maps:
Write a program that:
Prints each product's name, price, and quantity.
Calculates the total price of each product 
Calculates the total cart cost.
Applies a 10% discount if the total is at least 25,000.
Prints the final total after the discount.
Counts how many individual items are in the cart, including quantities.

 */

void Task_6_Shopping_Cart() {
  print('\nTask_6_Shopping_Cart');

  List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'price': 20000, 'quantity': 1},
    {'name': 'Mouse', 'price': 500, 'quantity': 2},
    {'name': 'Keyboard', 'price': 1500, 'quantity': 3},
    {'name': 'Headphones', 'price': 1000, 'quantity': 2},
  ];

  double totalCartCost = 0;
  int totalItems = 0;

  for (int i = 0; i < products.length; i++) {
    String name = products[i]['name'];
    double price = (products[i]['price'] as num).toDouble();
    int quantity = products[i]['quantity'];

    double productTotal = price * quantity;

    print('\nProduct: $name');
    print('Price: $price');
    print('Quantity: $quantity');
    print('Total price: $productTotal');

    totalCartCost += productTotal;
    totalItems += quantity;
  }

  double discount = 0;

  if (totalCartCost >= 25000) {
    discount = totalCartCost * 0.10;
  }

  double finalTotal = totalCartCost - discount;
  print('Total cart cost: $totalCartCost');
  print('Discount: $discount');
  print('Final total: $finalTotal');
  print('Total individual items: $totalItems');
}

/**
Task 7 — Hard: Student Management System
Build a small student management system using a List<Map<String, dynamic>>.
Requirements
Part A — Calculate results
For every student, calculate their average grade using a loop.
Determine their final status using these rules:
Average >= 85: "Excellent"
Average >= 70: "Good"
Average >= 50: "Pass"
Average < 50: "Fail"
Part B — Build a report
Print each student's name, average, and status.
Also calculate:
The class average.
The student with the highest average.
The student with the lowest average.
The number of students who passed.
A list containing the names of students who scored at least 80 in every subject.
Part C — Add a search feature
Create a variable:
String searchName = 'Mona';
Use a loop to find that student.
If the student exists, print their grades and average. Otherwise, print "Student not found".
Part D — Add a menu using switch
Create a menu with these options:
1. Print all students
2. Show class average
3. Show top student
4. Search for a student
5. Exit
Use a switch statement to perform the selected action.
Rules for the task:
Use loops, conditions, lists, maps, and switch.
Do not use .sort(), .reduce(), or .where().
Avoid repeating the same calculation code unnecessarily.
 
 */

void Task_7_Student_Management_System() {
  print('\nTask_7_Student_Management_System');

  List<Map<String, dynamic>> students = [
    {
      'name': 'Ahmed',
      'grades': [90, 85, 88],
    },
    {
      'name': 'Mona',
      'grades': [95, 82, 90],
    },
    {
      'name': 'Omar',
      'grades': [60, 55, 65],
    },
    {
      'name': 'Sara',
      'grades': [45, 50, 40],
    },
    {
      'name': 'Ali',
      'grades': [80, 85, 90],
    },
  ];

  double classTotal = 0;
  int passedCount = 0;

  double highestAverage = -1;
  double lowestAverage = 101;

  String topStudent = '';
  String lowestStudent = '';

  List<String> studentsWith80InEverySubject = [];

  for (int i = 0; i < students.length; i++) {
    String name = students[i]['name'];
    List<int> grades = List<int>.from(students[i]['grades']);

    int sum = 0;
    bool allGradesAtLeast80 = true;

    for (int j = 0; j < grades.length; j++) {
      sum += grades[j];

      if (grades[j] < 80) {
        allGradesAtLeast80 = false;
      }
    }

    double average = sum / grades.length;
    String status;

    if (average >= 85) {
      status = 'Excellent';
    } else if (average >= 70) {
      status = 'Good';
    } else if (average >= 50) {
      status = 'Pass';
    } else {
      status = 'Fail';
    }

    // Save calculated results to the student map
    students[i]['average'] = average;
    students[i]['status'] = status;

    // Calculate class statistics
    classTotal += average;

    if (average >= 50) {
      passedCount++;
    }

    if (average > highestAverage) {
      highestAverage = average;
      topStudent = name;
    }

    if (average < lowestAverage) {
      lowestAverage = average;
      lowestStudent = name;
    }

    if (allGradesAtLeast80) {
      studentsWith80InEverySubject.add(name);
    }
  }

  double classAverage = classTotal / students.length;

  void printAllStudents() {
    print('\n========== Students Report ==========');

    for (int i = 0; i < students.length; i++) {
      print('Name: ${students[i]['name']}');
      print('Grades: ${students[i]['grades']}');
      print(
        'Average: ${(students[i]['average'] as double).toStringAsFixed(2)}',
      );
      print('Status: ${students[i]['status']}');
      print('-------------------------------------');
    }

    print('Class average: ${classAverage.toStringAsFixed(2)}');
    print('Highest-average student: $topStudent ($highestAverage)');
    print('Lowest-average student: $lowestStudent ($lowestAverage)');
    print('Number of students passed: $passedCount');

    print(
      'Students with at least 80 in every subject: '
      '${studentsWith80InEverySubject.join(', ')}',
    );
  }

  String searchName = 'Mona';

  void searchForStudent(String nameToSearch) {
    bool found = false;

    for (int i = 0; i < students.length; i++) {
      if (students[i]['name'].toString().toLowerCase() ==
          nameToSearch.toLowerCase()) {
        print('\n========== Student Found ==========');
        print('Name: ${students[i]['name']}');
        print('Grades: ${students[i]['grades']}');
        print(
          'Average: '
          '${(students[i]['average'] as double).toStringAsFixed(2)}',
        );
        print('Status: ${students[i]['status']}');

        found = true;
        break;
      }
    }

    if (!found) {
      print('Student not found');
    }
  }

  int choice = 1;

  switch (choice) {
    case 1:
      printAllStudents();
      break;

    case 2:
      print('Class average: ${classAverage.toStringAsFixed(2)}');
      break;

    case 3:
      print('Top student: $topStudent');
      print('Highest average: $highestAverage');
      break;

    case 4:
      searchForStudent(searchName);
      break;

    case 5:
      print('Exiting Student Management System...');
      break;

    default:
      print('Invalid choice');
  }
}

void main() {
  Task_1_Even_or_Odd(6);
  Task2_Numbers_From_1_to_N();
  Task_3_List_Statistics();
  Task_4_Student_Grades();
  Task_5_Simple_Calculator();
  Task_6_Shopping_Cart();
  Task_7_Student_Management_System();
}
