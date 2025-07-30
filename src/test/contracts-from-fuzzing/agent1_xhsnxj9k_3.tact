/* Testing if/else, ternary, and try/catch statements as per Tact documentation */

// Test 1: Simple if statement with braces
fun simpleIf(): Int {
    if (true) {
        return 1;
    }
    return 0;
}

// Test 2: If-else statement
fun ifElseTest(): String {
    if (2 + 2 == 4) {
        return "ok";
    } else {
        return "not ok";
    }
}

// Test 3: Nested if-else statement
fun nestedTest(): String {
    if (2 + 2 == 3) {
        return "impossible";
    } else if (2 + 2 == 4) {
        return "yes";
    } else {
        return "no";
    }
}

// Test 4: Ternary operator test
fun ternaryTest(x: Int): Int {
    return x > 5 ? x : 5;
}

// Test 5: try...catch statement (removed unreachable code after throw)
fun testTryCatch(): Int {
    try {
        throw(1042);
    } catch (err) {
        return err;
    }
}

// Main function that calls all tests to ensure overall compilation
fun main(): Int {
    let a = simpleIf();
    let b = ifElseTest() == "ok" ? 1 : 0;
    let c = nestedTest() == "yes" ? 1 : 0;
    let d = ternaryTest(3); // should return 5
    let e = testTryCatch(); // should return 1042
    return a + b + c + d + e;
}
