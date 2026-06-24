// This file is a summary of our initial fuzz-testing cycle for try-catch and conditional statements
// section based on the Tact documentation regarding try...catch and conditional expressions

// Test 1: Simple try...catch where throw is caught
fun testTryCatchSimple(): Int {
    try {
        throw(1042);
    } catch (err) {
        // Expectation: catch block receives the thrown integer exit code
        return err;
    }
}

// Test 2: Nested try-catch, where the inner try returns a modified value
fun innerFunction(): Int {
    try {
        throw(5);
    } catch (e) {
        return e + 1; // should return 6
    }
}

fun testNestedTryCatch(): Int {
    try {
        let innerRes: Int = innerFunction();
        return innerRes; // expecting 6
    } catch (e) {
        return e + 10; // not expected
    }
}

// Test 3: try...catch with conditional throwing
fun mightThrow(flag: Bool): Int {
    if (flag) {
        throw(3);
    }
    return 100;
}

fun testConditionalTry(flag: Bool): Int {
    try {
        return mightThrow(flag);
    } catch (e) {
        return e; // expecting either 3 or 100
    }
}

// Test 4: Basic if-else statement 
fun testIfElse(): Int {
    if (2 + 2 == 4) {
        return 100;
    } else {
        return 200;
    }
}

// Test 5: Nested if-else structure
fun testNestedIfElse(): Int {
    if (2 + 2 == 3) {
        return 300;
    } else if (2 + 2 == 4) {
        return 400;
    } else {
        return 500;
    }
}

// Test 6: Ternary operator
fun testTernary(): Int {
    let res: Int = (2 + 2 == 4) ? 1 : 0;
    return res; // expected 1
}

// main aggregates all tests
fun main(): Int {
    let results: Int = 0;
    results = results + testTryCatchSimple();    // expect 1042
    results = results + testNestedTryCatch();      // expect 6
    results = results + testConditionalTry(true);  // expect 3
    results = results + testConditionalTry(false); // expect 100
    results = results + testIfElse();              // expect 100
    results = results + testNestedIfElse();        // expect 400
    results = results + testTernary();             // expect 1
    return results;
}
