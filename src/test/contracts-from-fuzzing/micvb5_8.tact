fun greet(): String {
    return "Hello, Tact!";
}

fun add(a: Int, b: Int): Int {
    return a + b;
}

fun factorial(n: Int): Int {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

fun main(): Int {
    // Call functions to prove they are used
    let greeting: String = greet(); // "Hello, Tact!"
    let sum: Int = add(20, 22);      // Expected 42
    let fact: Int = factorial(5);    // Expected 120
    // For demonstration, we return the sum of sum and fact: 42 + 120 = 162
    return sum + fact;
}
