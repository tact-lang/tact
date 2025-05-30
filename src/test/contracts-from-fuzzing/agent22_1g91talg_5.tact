fun testTernary(x: Int) : Int {
    // Testing ternary operator in Tact
    return x > 10 ? 100 : 50;
}

fun testIfElse(x: Int) : Int {
    // Testing if-else statement with different bracing and semicolon usage
    if(x > 10) {
        return 200;
    } else {
        return 300;
    }
}

fun main() {
    // Using dump to output the results of our tests
    dump(testTernary(5));  // Expected output: 50
    dump(testIfElse(15));  // Expected output: 200
}
