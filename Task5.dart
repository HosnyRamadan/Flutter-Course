/**
 Task 1: Student Class

 Create a Student class with:
 private name, age, grade

 Add:
 Constructor
 Getters and Setters
 Validate age and grade
*/

class Student {
  String _name;
  int _age;
  double _grade;

  Student(String name, int age, double grade)
    : _name = name,
      _age = age > 0 ? age : 1,
      _grade = (grade >= 0 && grade <= 100) ? grade : 0;

  String get name {
    return _name;
  }

  int get age {
    return _age;
  }

  double get grade {
    return _grade;
  }

  set name(String value) {
    _name = value;
  }

  set age(int value) {
    if (value > 0) {
      _age = value;
    }
  }

  set grade(double value) {
    if (value >= 0 && value <= 100) {
      _grade = value;
    }
  }

  void displayInfo() {
    print('Name = $_name');
    print('Age = $_age');
    print('Grade = $_grade');
  }
}

void Task_1_Student_Class() {
  print('\nTask_1_Student_Class');

  Student student = Student('Ahmed', 20, 90);

  student.displayInfo();

  student.age = 21;
  student.grade = 95;

  print('Updated Age = ${student.age}');
  print('Updated Grade = ${student.grade}');
}

/**
 Task 2: Bank Account

 Create a BankAccount class with:
 private accountHolder and balance

 Add:
 deposit()
 withdraw()
*/

class BankAccount {
  String _accountHolder;
  double _balance;

  BankAccount(String accountHolder, double balance)
    : _accountHolder = accountHolder,
      _balance = balance >= 0 ? balance : 0;

  String get accountHolder {
    return _accountHolder;
  }

  double get balance {
    return _balance;
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance = _balance + amount;
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance = _balance - amount;
    }
  }
}

void Task_2_Bank_Account() {
  print('\nTask_2_Bank_Account');

  BankAccount account = BankAccount('Ahmed', 5000);

  print('Account Holder = ${account.accountHolder}');
  print('Balance = ${account.balance}');

  account.deposit(1000);
  print('Balance after deposit = ${account.balance}');

  account.withdraw(2000);
  print('Balance after withdraw = ${account.balance}');

  account.deposit(-500);
  account.withdraw(10000);

  print('Final Balance = ${account.balance}');
}

/**
 Task 3: Person and Student

 Create a Person class with:
 private name and age

 Create a Student class with:
 studentId and grade

 Display all information
*/

class Person {
  String _name;
  int _age;

  Person(String name, int age) : _name = name, _age = age > 0 ? age : 1;

  String get name {
    return _name;
  }

  int get age {
    return _age;
  }
}

class StudentInfo extends Person {
  int studentId;
  double grade;

  StudentInfo(String name, int age, this.studentId, this.grade)
    : super(name, age);

  void displayInfo() {
    print('Name = $name');
    print('Age = $age');
    print('Student ID = $studentId');
    print('Grade = $grade');
  }
}

void Task_3_Person_And_Student() {
  print('\nTask_3_Person_And_Student');

  StudentInfo student = StudentInfo('Ahmed', 20, 1001, 90);

  student.displayInfo();
}

/**
 Task 4: Employee Salary System

 Create an abstract Employee class

 Create:
 FullTimeEmployee
 PartTimeEmployee

 Calculate salaries using polymorphism
*/

abstract class Employee {
  String name;
  int employeeId;

  Employee(this.name, this.employeeId);

  double calculateSalary();

  void displayInfo() {
    print('Name = $name');
    print('Employee ID = $employeeId');
    print('Salary = ${calculateSalary()}');
  }
}

class FullTimeEmployee extends Employee {
  double monthlySalary;

  FullTimeEmployee(String name, int employeeId, this.monthlySalary)
    : super(name, employeeId);

  @override
  double calculateSalary() {
    return monthlySalary;
  }
}

class PartTimeEmployee extends Employee {
  double hours;
  double hourlyRate;

  PartTimeEmployee(String name, int employeeId, this.hours, this.hourlyRate)
    : super(name, employeeId);

  @override
  double calculateSalary() {
    return hours * hourlyRate;
  }
}

void Task_4_Employee_Salary_System() {
  print('\nTask_4_Employee_Salary_System');

  Employee employee1 = FullTimeEmployee('Ahmed', 101, 15000);
  Employee employee2 = PartTimeEmployee('Ali', 102, 80, 100);

  List<Employee> employees = [employee1, employee2];

  for (Employee employee in employees) {
    employee.displayInfo();
    print('');
  }
}

/**
 Task 5: Library Management System

 Create:
 LibraryItem
 Book
 Magazine
 Member

 Borrow a maximum of three items
 Validate borrowing and returning
 Display item details
*/

class LibraryItem {
  int _id;
  String _title;
  bool _isBorrowed = false;

  LibraryItem(this._id, this._title);

  int get id {
    return _id;
  }

  String get title {
    return _title;
  }

  bool get isBorrowed {
    return _isBorrowed;
  }

  bool borrowItem() {
    if (!_isBorrowed) {
      _isBorrowed = true;
      return true;
    }

    return false;
  }

  bool returnItem() {
    if (_isBorrowed) {
      _isBorrowed = false;
      return true;
    }

    return false;
  }

  void displayInfo() {
    print('ID = $_id');
    print('Title = $_title');
    print('Status = ${_isBorrowed ? "Borrowed" : "Available"}');
  }
}

class Book extends LibraryItem {
  String author;

  Book(int id, String title, this.author) : super(id, title);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Author = $author');
  }
}

class Magazine extends LibraryItem {
  int issueNumber;

  Magazine(int id, String title, this.issueNumber) : super(id, title);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Issue Number = $issueNumber');
  }
}

class Member {
  String name;
  List<LibraryItem> borrowedItems = [];

  Member(this.name);

  bool borrowItem(LibraryItem item) {
    if (borrowedItems.length >= 3) {
      return false;
    }

    if (item.borrowItem()) {
      borrowedItems.add(item);
      return true;
    }

    return false;
  }

  bool returnItem(LibraryItem item) {
    if (borrowedItems.contains(item)) {
      if (item.returnItem()) {
        borrowedItems.remove(item);
        return true;
      }
    }

    return false;
  }

  void displayBorrowedItems() {
    print('Member = $name');
    print('Borrowed Items = ${borrowedItems.length}');

    for (LibraryItem item in borrowedItems) {
      print(item.title);
    }
  }
}

void Task_5_Library_Management_System() {
  print('\nTask_5_Library_Management_System');

  Book book1 = Book(1, 'Dart Basics', 'Ahmed');
  Book book2 = Book(2, 'OOP Guide', 'Ali');
  Magazine magazine1 = Magazine(3, 'Science Today', 10);
  Magazine magazine2 = Magazine(4, 'Technology World', 20);

  List<LibraryItem> items = [book1, book2, magazine1, magazine2];

  Member member = Member('Ahmed');

  print('Borrow Book 1 = ${member.borrowItem(book1)}');
  print('Borrow Book 2 = ${member.borrowItem(book2)}');
  print('Borrow Magazine 1 = ${member.borrowItem(magazine1)}');
  print('Borrow Magazine 2 = ${member.borrowItem(magazine2)}');

  print('Return Item Not Borrowed = ${member.returnItem(magazine2)}');

  member.displayBorrowedItems();

  print('Return Book 1 = ${member.returnItem(book1)}');
  print('Borrow Magazine 2 = ${member.borrowItem(magazine2)}');

  print('\nAll Library Items');

  for (LibraryItem item in items) {
    item.displayInfo();
    print('');
  }
}

void main() {
  Task_1_Student_Class();
  Task_2_Bank_Account();
  Task_3_Person_And_Student();
  Task_4_Employee_Salary_System();
  Task_5_Library_Management_System();
}
