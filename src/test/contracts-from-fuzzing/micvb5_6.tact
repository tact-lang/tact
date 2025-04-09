fun factorial(n: Int): Int {
    if (n <= 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

fun main(): Int {
    // Call the factorial function for number 5; expected result: 120
    return factorial(5);
}
