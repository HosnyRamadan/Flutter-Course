/*
  Task 1: Encapsulation - Bank Account

  Create a BankAccount class with:
  private balance and account number

  Add:
  Constructor
  Getter
  deposit()
  withdraw()
*/

class BankAccount {
  String _accountNumber;
  double _balance;

  BankAccount(String accountNumber, double balance)
    : _accountNumber = accountNumber,
      _balance = balance >= 0 ? balance : 0;

  String get accountNumber {
    return _accountNumber;
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

  void displayInfo() {
    print('Account Number = $_accountNumber');
    print('Balance = $_balance');
  }
}

void Task_1_Bank_Account() {
  print('\nTask_1_Bank_Account');

  BankAccount account = BankAccount('12345', 5000);

  account.displayInfo();

  account.deposit(1000);
  print('Balance after deposit = ${account.balance}');

  account.withdraw(2000);
  print('Balance after withdraw = ${account.balance}');

  account.withdraw(10000);
  print('Final Balance = ${account.balance}');
}

/*
  Task 2: Inheritance - Employees

  Create a base Employee class with:
  name and salary

  Create:
  Developer
  Designer

  Use:
  super
  displayInfo()
*/

class Employee {
  String name;
  double salary;

  Employee(this.name, this.salary);

  void displayInfo() {
    print('Name = $name');
    print('Salary = $salary');
  }
}

class Developer extends Employee {
  String programmingLanguage;

  Developer(String name, double salary, this.programmingLanguage)
    : super(name, salary);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Programming Language = $programmingLanguage');
  }
}

class Designer extends Employee {
  String designTool;

  Designer(String name, double salary, this.designTool) : super(name, salary);

  @override
  void displayInfo() {
    super.displayInfo();
    print('Design Tool = $designTool');
  }
}

void Task_2_Employees() {
  print('\nTask_2_Employees');

  Employee employee1 = Developer('Ahmed', 15000, 'Dart');
  Employee employee2 = Designer('Ali', 12000, 'Figma');

  employee1.displayInfo();
  print('');

  employee2.displayInfo();
}

/*
  Task 3: Abstraction - Payment System

  Create an abstract PaymentMethod class.

  Add:
  pay()

  Create:
  CreditCardPayment
  CashPayment
*/

abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCardPayment extends PaymentMethod {
  @override
  void pay(double amount) {
    if (amount > 0) {
      print('Paid $amount using Credit Card');
    } else {
      print('Invalid payment amount');
    }
  }
}

class CashPayment extends PaymentMethod {
  @override
  void pay(double amount) {
    if (amount > 0) {
      print('Paid $amount using Cash');
    } else {
      print('Invalid payment amount');
    }
  }
}

void Task_3_Payment_System() {
  print('\nTask_3_Payment_System');

  PaymentMethod payment1 = CreditCardPayment();
  PaymentMethod payment2 = CashPayment();

  payment1.pay(1000);
  payment2.pay(500);

  // PaymentMethod payment = PaymentMethod();
  // This causes an error because PaymentMethod is abstract.
}

/*
  Task 4: Polymorphism - Notifications

  Create a NotificationService class.

  Create:
  EmailNotification
  SmsNotification
  PushNotification

  Override sendNotification()
  Use one List for all notification types.
*/

class NotificationService {
  void sendNotification() {
    print('Sending notification');
  }
}

class EmailNotification extends NotificationService {
  @override
  void sendNotification() {
    print('Sending Email Notification');
  }
}

class SmsNotification extends NotificationService {
  @override
  void sendNotification() {
    print('Sending SMS Notification');
  }
}

class PushNotification extends NotificationService {
  @override
  void sendNotification() {
    print('Sending Push Notification');
  }
}

void Task_4_Notifications() {
  print('\nTask_4_Notifications');

  List<NotificationService> notifications = [
    EmailNotification(),
    SmsNotification(),
    PushNotification(),
  ];

  for (NotificationService notification in notifications) {
    notification.sendNotification();
  }
}

/*
  Task 5: Flutter Shopping Cart

  Create an abstract Product class with:
  name and price

  Create:
  Electronics
  Clothing

  Add:
  calculateDiscount()

  Create ShoppingCart with:
  private product list
  total price
  addProduct()
  removeProduct()
  calculateTotal()
*/

abstract class Product {
  String name;
  double price;

  Product(this.name, this.price);

  double calculateDiscount();

  double get finalPrice {
    return price - calculateDiscount();
  }

  void displayInfo() {
    print('Product = $name');
    print('Price = $price');
    print('Discount = ${calculateDiscount()}');
    print('Final Price = $finalPrice');
  }
}

class Electronics extends Product {
  Electronics(String name, double price) : super(name, price);

  @override
  double calculateDiscount() {
    return price * 0.10;
  }
}

class Clothing extends Product {
  Clothing(String name, double price) : super(name, price);

  @override
  double calculateDiscount() {
    return price * 0.20;
  }
}

class ShoppingCart {
  List<Product> _products = [];

  List<Product> get products {
    return List.unmodifiable(_products);
  }

  double get totalPrice {
    return calculateTotal();
  }

  void addProduct(Product product) {
    if (product.price > 0) {
      _products.add(product);
      print('${product.name} added to cart');
    }
  }

  void removeProduct(Product product) {
    if (_products.remove(product)) {
      print('${product.name} removed from cart');
    } else {
      print('${product.name} not found in cart');
    }
  }

  double calculateTotal() {
    double total = 0;

    for (Product product in _products) {
      total = total + product.finalPrice;
    }

    return total;
  }

  void displayCart() {
    print('\nShopping Cart Details');

    for (Product product in _products) {
      product.displayInfo();
      print('');
    }

    print('Total Price After Discounts = ${calculateTotal()}');
  }
}

void Task_5_Flutter_Shopping_Cart() {
  print('\nTask_5_Shopping_Cart');

  Electronics laptop = Electronics('Laptop', 20000);
  Clothing shirt = Clothing('Shirt', 500);

  ShoppingCart cart = ShoppingCart();

  cart.addProduct(laptop);
  cart.addProduct(shirt);

  cart.displayCart();

  cart.removeProduct(shirt);

  print('Final Cart Total = ${cart.totalPrice}');
}

void main() {
  Task_1_Bank_Account();
  Task_2_Employees();
  Task_3_Payment_System();
  Task_4_Notifications();
  Task_5_Flutter_Shopping_Cart();
}
