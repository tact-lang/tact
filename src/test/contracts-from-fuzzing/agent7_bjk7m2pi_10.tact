///////////////////////////////////////////////////////////////////
// Fuzz Testing Cycle: Comprehensive and Exhaustive Testing of Various
// Compiler Features in Tact (excluding known documented issues)
//
// This file collects several test functions that focus on:
// 1. Optionals and non-null assertions
// 2. Loop constructs: repeat (with negative count), while, do...until
// 3. Foreach loop over maps
// 4. Ternary operator usage
// 5. Built-in functions (pow)
// 6. Assembly functions (simple getDepth example)
// 7. Division by zero error inside try...catch (should trigger an error, exit code 4)
// 8. Non-null assertion failure on a null optional
// 9. While loop behavior
//
// Each test function uses dump() to output a result, so that we can observe
// the behavior during execution.
///////////////////////////////////////////////////////////////////

// Test 1: Optionals correct access
fun testOptionalCorrect() {
    let a: Int? = null;
    if (a == null) {
        dump(0); // expected output: 0
    } else {
        dump(a!!);
    }
}

// Test 2: Repeat loop with negative count (should skip loop body)
fun testRepeatNegative() {
    let acc: Int = 0;
    repeat (-5) {
        acc = acc + 1;
    }
    dump(acc); // expected output: 0
}

// Test 3: Foreach loop over a map (keys will be iterated in increasing order)
fun testForeachMap() {
    let m: map<Int, Int> = emptyMap();
    m.set(4, 40);
    m.set(1, 10);
    m.set(2, 20);
    let sum: Int = 0;
    foreach (k, v in m) {
        sum = sum + v;
    }
    dump(sum); // expected output: 70
}

// Test 4: do...until loop always executes at least once
fun testDoUntil() {
    let x: Int = 0;
    do {
        x = x + 1;
    } until (x > 5);
    dump(x); // expected output: 6
}

// Test 5: Ternary operator usage
fun testTernary() {
    let flag: Bool = true;
    let result: Int = flag ? 100 : 200;
    dump(result); // expected output: 100
}

// Test 6: Built-in power function: pow(10, 2) should equal 100
fun testPow() {
    let a: Int = pow(10, 2);
    dump(a); // expected output: 100
}

// Test 7: Simple assembly function to get stack depth
asm fun getDepth(): Int { DEPTH }

fun testAsm() {
    dump(getDepth()); // prints the current stack depth (could vary)
}

// Test 8: Division by zero inside a try block
fun testDivByZero() {
    try {
        let a: Int = 10;
        let b: Int = a / 0; // division by zero should trigger error
        dump(b);
    } catch (err) {
        dump(err); // expected to catch an error (exit code 4)
    }
}

// Test 9: Non-null assertion failure on a null optional
fun testOptionalNonNullError() {
    let a: Int? = null;
    try {
        dump(a!!); // this should throw a null reference exception
    } catch (err) {
        dump(err); // expected to catch an error (likely exit code 128)
    }
}

// Test 10: While loop decrementing from 3 to 0
fun testWhileLoop() {
    let counter: Int = 3;
    while (counter > 0) {
        counter = counter - 1;
    }
    dump(counter); // expected output: 0
}

// Main: Call all test functions in sequence
fun main() {
    testOptionalCorrect();      // Expected dump: 0
    testRepeatNegative();       // Expected dump: 0
    testForeachMap();           // Expected dump: 70
    testDoUntil();              // Expected dump: 6
    testTernary();              // Expected dump: 100
    testPow();                  // Expected dump: 100
    testAsm();                  // Expected dump: (stack depth value)
    testDivByZero();            // Expected dump: error code (likely 4)
    testOptionalNonNullError(); // Expected dump: error code (likely 128)
    testWhileLoop();            // Expected dump: 0
}
