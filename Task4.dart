/**
 Task 1: Functions - Grade Calculator

 Create functions to calculate:
 Total
 Average
 Result (Pass or Fail)
*/

double calculateTotal(double a, double b, double c) {
  return a + b + c;
}

double calculateAverage(double total) {
  return total / 3;
}

String getResult(double average) {
  if (average >= 50) {
    return 'Pass';
  } else {
    return 'Fail';
  }
}

void Task_1_Grade_Calculator() {
  print('\nTask_1_Grade_Calculator');

  double math = 90;
  double science = 80;
  double english = 95;

  double total = calculateTotal(math, science, english);
  double average = calculateAverage(total);
  String result = getResult(average);

  print('Math = $math');
  print('Science = $science');
  print('English = $english');
  print('Total = $total');
  print('Average = ${average.toStringAsFixed(2)}');
  print('Result = $result');
}

/**
 Task 2: Student Class

 Create a Student class with:
 name, age, grade

 Display student information.
 Check if the student passed.
 Find the top student.
*/

class Student {
  String name;
  int age;
  double grade;

  // Constructor
  Student(this.name, this.age, this.grade);

  // Display student information
  void displayInfo() {
    print('Name = $name');
    print('Age = $age');
    print('Grade = $grade');
  }

  // Check if the student passed
  bool isPassed() {
    return grade >= 50;
  }
}

// Find student with the highest grade
Student findTopStudent(List<Student> students) {
  Student topStudent = students[0];

  for (Student student in students) {
    if (student.grade > topStudent.grade) {
      topStudent = student;
    }
  }

  return topStudent;
}

void Task_2_Student_Class() {
  print('\nTask_2_Student_Class');

  Student student1 = Student('Ahmed', 20, 90);
  Student student2 = Student('Ali', 21, 75);
  Student student3 = Student('Omar', 19, 45);

  List<Student> students = [student1, student2, student3];

  // Display students information
  for (Student student in students) {
    student.displayInfo();
    print('Passed = ${student.isPassed()}');
    print('');
  }

  // Find top student
  Student topStudent = findTopStudent(students);

  print('Top Student = ${topStudent.name}');
  print('Highest Grade = ${topStudent.grade}');
}

/**
 Task 3: BankAccount Class

 Create a BankAccount class with:
 accountHolder and private _balance

 Create:
 Getter and Setter
 deposit()
 withdraw()
*/

class BankAccount {
  String accountHolder;
  double _balance;

  // Constructor
  BankAccount(this.accountHolder, double balance)
    : _balance = balance >= 0 ? balance : 0;

  // Getter for balance
  double get balance {
    return _balance;
  }

  // Setter for balance
  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    }
  }

  // Deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance = _balance + amount;
    }
  }

  // Withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance = _balance - amount;
    }
  }
}

void Task_3_Bank_Account() {
  print('\nTask_3_Bank_Account');

  BankAccount account = BankAccount('Ahmed', 5000);

  print('Account Holder = ${account.accountHolder}');
  print('Balance = ${account.balance}');

  account.deposit(1000);
  print('Balance after deposit = ${account.balance}');

  account.withdraw(2000);
  print('Balance after withdraw = ${account.balance}');

  account.withdraw(10000);
  print('Balance after invalid withdraw = ${account.balance}');

  account.balance = -500;
  print('Balance after invalid setter = ${account.balance}');
}

/**
 Task 4: Product Class

 Create a Product class with:
 name, id, private _price, private _quantity

 Calculate:
 Total value of each product
 Find product by id
 Total value of all products
*/

class Product {
  String name;
  int id;
  double _price;
  int _quantity;

  // Constructor
  Product(this.name, this.id, double price, int quantity)
    : _price = price >= 0 ? price : 0,
      _quantity = quantity >= 0 ? quantity : 0;

  // Getter and Setter for price
  double get price {
    return _price;
  }

  set price(double value) {
    if (value >= 0) {
      _price = value;
    }
  }

  // Getter and Setter for quantity
  int get quantity {
    return _quantity;
  }

  set quantity(int value) {
    if (value >= 0) {
      _quantity = value;
    }
  }

  // Update product stock
  void updateStock(int amount) {
    if (_quantity + amount >= 0) {
      _quantity = _quantity + amount;
    }
  }

  // Calculate total value of product
  double calculateTotalValue() {
    return _price * _quantity;
  }

  // Display product information
  void displayInfo() {
    print('Product Name = $name');
    print('Product ID = $id');
    print('Price = $_price');
    print('Quantity = $_quantity');
    print('Total Value = ${calculateTotalValue()}');
  }
}

// Find product by id
Product? findProduct(List<Product> products, int id) {
  for (Product product in products) {
    if (product.id == id) {
      return product;
    }
  }

  return null;
}

// Calculate total value of all products
double calculateAllProductsValue(List<Product> products) {
  double total = 0;

  for (Product product in products) {
    total = total + product.calculateTotalValue();
  }

  return total;
}

void Task_4_Product_Class() {
  print('\nTask_4_Product_Class');

  // Create three products
  Product product1 = Product('Laptop', 1, 25000, 5);
  Product product2 = Product('Mouse', 2, 500, 10);
  Product product3 = Product('Keyboard', 3, 1200, 4);

  // Create a list of products
  List<Product> products = [product1, product2, product3];

  // Display products information
  for (Product product in products) {
    product.displayInfo();
    print('');
  }

  // Update stock
  product1.updateStock(2);
  print('Laptop quantity after update = ${product1.quantity}');

  // Find product by id
  Product? foundProduct = findProduct(products, 2);

  if (foundProduct != null) {
    print('Found Product = ${foundProduct.name}');
  } else {
    print('Product not found');
  }

  // Calculate total value of all products
  print('Total Value of All Products = ${calculateAllProductsValue(products)}');
}

void main() {
  Task_1_Grade_Calculator();
  Task_2_Student_Class();
  Task_3_Bank_Account();
  Task_4_Product_Class();
}
