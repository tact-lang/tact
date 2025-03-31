// Test snippet for if/else and nested if statement behavior
fun testIfElse(x: Int): Int {
    if (x < 10) {
        return 1;
    } else if (x < 20) {
        return 2;
    } else {
        return 3;
    }
}

// Test snippet for ternary operator usage as mentioned in docs (if available)
fun testTernary(x: Int): Int {
    // Tact docs mention a ternary operator '?:' described earlier in the book.
    // However, we simulate it with an if-else expression if syntax support unclear.
    return x < 10 ? 100 : 200;
}

fun main() {
    // Running tests for if/else
    let a = testIfElse(5);
    let b = testIfElse(15);
    let c = testIfElse(25);
    
    // Running ternary operator test
    let d = testTernary(5);
    let e = testTernary(15);

    // dummy usage to avoid unused variable warnings
    dump(a + b + c + d + e);
}
