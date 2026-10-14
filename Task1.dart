/**
 * Task 1: Personal Information
Create variables for:
Name
Age
Country
Favorite Color
Print the following output:
My name is Ahmed.
I am 20 years old.
I live in Egypt.
My favorite color is Blue.

 */
void Task_1_Personal_Information() {
  print('\nTask_1_Personal_Information');
  String Name = 'Ahmed';
  int Age = 20;
  String Country = 'Egypt';
  String color = 'Blue';
  print('My name is   $Name ');
  print('I am $Age  years old ');
  print('I live in  $Country ');
  print('My favorite color is  $color ');
}

/**
Task 2: Simple Calculator
Objective: Practice arithmetic operators.
Create two integer variables:
int num1 = 15;
int num2 = 4;

Print:
Sum
Difference
Product 
Division
Expected output:
Sum = 19
Difference = 11
Product = 60
Division = 3.75

 */
void Task_2_Simple_Calculator() {
  print('\nTask_2_Simple_Calculator');
  int num1 = 15;
  int num2 = 4;
  print('sum = ${num1 + num2}');
  print('Difference = ${num1 - num2}');
  print('Product = ${num1 * num2}');
  print('Division = ${num1 / num2}');
}

/**
 Task 3: Student Grade
Create variables:
double math = 90;
double science = 80;
double english = 95;
Calculate:
Total marks
Average
Print:
Math: 90
Science: 80
English: 95
Total = 265
Average = 88.33

 */
void Task_3_Student_Grade() {
  print('\nTask_3_Student_Grade');
  double math = 90;
  double science = 80;
  double english = 95;
  print('Math : $math');
  print('Science : $science');
  print('English : $english');
  print('Total : ${math + science + english}');
  print('Average : ${(math + science + english) / 3}');
}

/**
Task 4: Rectangle Calculator
Objective: Practice formulas.
Create:
double width = 8;
double height = 5;

Calculate:
Area
Perimeter
Print:
Width = 8
Height = 5
Area = 40
Perimeter = 26

 */
void Task_4_Rectangle_Calculator() {
  print('\nTask_4_Rectangle_Calculator');
  double width = 8;
  double height = 5;
  print('width = $width');
  print('Height = $height');
  print('Area = ${width * height}');
  print('Perimeter = ${(width + height) * 2}');
}

/**
Task 5: Temperature Converter
Create:
double celsius = 30;
Convert it to Fahrenheit using:
F = (C × 9 / 5) + 32
Print:
Celsius = 30
Fahrenheit = 86

 */
void Task_5_Temperature_Converter() {
  print('\nTask_5_Temperature_Converter');
  double C = 30;
  double F = (C * 9 / 5) + 32;
  print('Celsuis = $C ');
  print('Fahrenheit = $F');
}

/**
 Task 6: Shopping Receipt
Create variables:
double laptop = 25000;
double mouse = 500;
double keyboard = 1200;

Calculate:
Total price
Discount (10%)
Final price after discount
Print:
Laptop = 25000
Mouse = 500
Keyboard = 1200

Total = 26700
Discount = 2670
Final Price = 24030

 */
void Task_6_Shopping_Receipt() {
  print('\nTask_6_Shopping_Receipt');
  double laptop = 25000;
  double mouse = 500;
  double keyboard = 1200;
  double Total_Price = laptop + mouse + keyboard;
  double Discount = 0.1 * Total_Price;
  double Final_price = Total_Price - Discount;

  print('Laptop = $laptop');
  print('Mouse = $mouse');
  print('Keyboard = $keyboard');
  print('Total price  : $Total_Price');
  print('Discount  : $Discount');
  print('Final price after discount  : $Final_price');
}

void main() {
  Task_1_Personal_Information();
  Task_2_Simple_Calculator();
  Task_3_Student_Grade();
  Task_4_Rectangle_Calculator();
  Task_5_Temperature_Converter();
  Task_6_Shopping_Receipt();
}
