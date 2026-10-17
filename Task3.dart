import 'dart:io';

/**
 * Task 1 — Calculate Total Price
 *
 * Create a function called calculateTotal.
 * It receives price and quantity.
 * Return the total price.
 */

double calculateTotal(double price, int quantity) {
  // Calculate the total price
  double total = price * quantity;

  return total;
}

/**
 * Task 2 — Customize a Greeting
 *
 * Create a function called greetUser.
 * name is required.
 * greeting is an optional positional parameter.
 * The default greeting is "Hello".
 */

String greetUser(String name, [String greeting = "Hello"]) {
  // Create the greeting message
  return '$greeting, $name!';
}

/**
 * Task 3 — Calculate an Order
 *
 * Create a function called calculateOrder.
 * price and quantity are required parameters.
 * discount and deliveryFee are optional named parameters.
 * Calculate and return the final order price.
 */

double calculateOrder(
  double price,
  int quantity, {
  double discount = 0,
  double deliveryFee = 0,
}) {
  // Calculate the total price before discount
  double total = price * quantity;

  // Subtract the discount
  total = total - discount;

  // Add the delivery fee
  total = total + deliveryFee;

  // Return the final order price
  return total;
}

/**
 * Task 4 — Filter Numbers
 *
 * Create a function called filterNumbers.
 * Return numbers between min and max.
 * If includeEven is true, include only even numbers.
 * If includeEven is false, include even and odd numbers.
 */

List<int> filterNumbers(
  List<int> numbers, {
  int min = 0,
  int max = 100,
  bool includeEven = true,
}) {
  // Create a new list to store the filtered numbers
  List<int> filteredNumbers = [];

  // Loop through all numbers
  for (int i = 0; i < numbers.length; i++) {
    // Check if the number is between min and max
    if (numbers[i] >= min && numbers[i] <= max) {
      // Check if even numbers are required
      if (includeEven == true) {
        if (numbers[i] % 2 == 0) {
          filteredNumbers.add(numbers[i]);
        }
      } else {
        // Include both even and odd numbers
        filteredNumbers.add(numbers[i]);
      }
    }
  }

  // Return the new list
  return filteredNumbers;
}

/**
 * Task 5 — Shopping Cart Calculator
 *
 * Calculate the subtotal of all products.
 * Apply the regular discount and member discount.
 * The total discount cannot exceed maxDiscount.
 * Calculate tax after applying the discount.
 * Add the delivery fee and return the final total.
 */

double calculateCartTotal(
  List<double> prices, {
  double discountPercent = 0,
  double taxPercent = 14,
  double deliveryFee = 0,
  bool isMember = false,
  double maxDiscount = 100,
}) {
  // Calculate the subtotal
  double subtotal = 0;

  for (int i = 0; i < prices.length; i++) {
    subtotal = subtotal + prices[i];
  }

  // Calculate the total discount percentage
  double totalDiscount = discountPercent;

  // Add an additional 5% discount for members
  if (isMember == true) {
    totalDiscount = totalDiscount + 5;
  }

  // Check if the discount exceeds the maximum allowed
  if (totalDiscount > maxDiscount) {
    totalDiscount = maxDiscount;
  }

  // Calculate the discount amount
  double discountAmount = subtotal * totalDiscount / 100;

  // Apply the discount to the subtotal
  double discountedSubtotal = subtotal - discountAmount;

  // Calculate tax on the discounted subtotal
  double tax = discountedSubtotal * taxPercent / 100;

  // Calculate the final total
  double finalTotal = discountedSubtotal + tax + deliveryFee;

  // Return the final total
  return finalTotal;
}

void main() {
  // Task 1 — Calculate Total Price
  print('\nTask 1 — Calculate Total Price');

  print(calculateTotal(50.0, 3)); // 150.0
  print(calculateTotal(25.5, 2)); // 51.0

  // Task 2 — Customize a Greeting
  print('\nTask 2 — Customize a Greeting');

  print(greetUser('Ahmed')); // Hello, Ahmed!
  print(greetUser('Mona', 'Welcome')); // Welcome, Mona!

  // Task 3 — Calculate an Order
  print('\nTask 3 — Calculate an Order');

  print(calculateOrder(100.0, 2));
  print(calculateOrder(100.0, 2, discount: 20));
  print(calculateOrder(100.0, 2, discount: 20, deliveryFee: 15));

  // Task 4 — Filter Numbers
  print('\nTask 4 — Filter Numbers');

  print(filterNumbers([1, 2, 5, 8, 12, 15], min: 2, max: 12));

  print(
    filterNumbers([1, 2, 5, 8, 12, 15], min: 2, max: 12, includeEven: false),
  );

  // Task 5 — Shopping Cart Calculator
  print('\nTask 5 — Shopping Cart Calculator');

  print(calculateCartTotal([100.0, 200.0, 50.0]));

  print(
    calculateCartTotal(
      [100.0, 200.0, 50.0],
      discountPercent: 10,
      taxPercent: 14,
      deliveryFee: 25,
    ),
  );

  print(
    calculateCartTotal(
      [100.0, 200.0, 50.0],
      discountPercent: 10,
      isMember: true,
      maxDiscount: 12,
    ),
  );
}
