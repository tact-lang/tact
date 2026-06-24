// Fuzz testing cycle: Testing try/catch, throwIf, and loop constructs in Tact

// Test try-catch: Should catch the thrown exit code (1042)
fun test_try_catch(): Int {
    try {
        throw(1042);
    } catch (err) {
        return err; // Expected to return 1042
    }
}

// Test throwIf: When condition is true, should throw with exit code 300; when false, execution continues
fun test_throwIf(condition: Bool): Int {
    throwIf(300, condition);
    return 42; // Returned only if condition is false
}

// Test while loop: Decrement a variable from 5 to 0
fun test_while_loop(): Int {
    let x: Int = 5;
    while (x > 0) {
        x -= 1;
    }
    return x; // Expected result: 0
}

// Test do...until loop: Execute block at least once and continue until condition met
fun test_do_until(): Int {
    let x: Int = 5;
    do {
        x -= 1;
    } until (x <= 0);
    return x; // Expected result: 0
}

// Test repeat loop: Repeat a block 10 times to compute 2^10
fun test_repeat(): Int {
    let v: Int = 1;
    repeat (10) {
        v *= 2;
    }
    return v; // Expected result: 1024
}

// Test foreach loop: Iterate over map entries and sum the values
fun test_foreach(): Int {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 10);
    m.set(2, 20);
    let sum: Int = 0;
    foreach (k, v in m) {
        sum += v;
    }
    return sum; // Expected result: 30
}

// Entry point: Run all tests. Note: Tests that throw (via throwIf(true)) are commented out to avoid termination.
fun main() {
    test_try_catch();
    test_throwIf(false);
    // Uncomment the following line to test throwIf(true), which should throw an exception with exit code 300
    // test_throwIf(true);
    test_while_loop();
    test_do_until();
    test_repeat();
    test_foreach();
}
