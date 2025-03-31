///////////////////////////////////////////////////////////////////
// Extended Fuzz Testing Cycle: Exploring Additional Compiler Features
// This snippet tests additional language features including:
// - throwIf() and throwUnless()
// - Nested blocks without variable shadowing (since shadowing is not allowed in Tact)
// - Compile-time constant evaluation
// - Behavior near arithmetic overflow
///////////////////////////////////////////////////////////////////

// Test 1: Using throwIf() to conditionally throw an error
fun testThrowIf() {
    try {
        throwIf(123, true); // condition true, so should throw exit code 123
        dump(0); // should not execute
    } catch (err) {
        dump(err); // expected output: 123
    }
}

// Test 2: Using throwUnless() to conditionally throw an error
fun testThrowUnless() {
    try {
        throwUnless(234, false); // condition false, so should throw exit code 234
        dump(0); // should not execute
    } catch (err) {
        dump(err); // expected output: 234
    }
}

// Test 3: Nested blocks without shadowing
fun testNestedBlocks() {
    let a: Int = 0;
    {
        let b: Int = 100; // use a different variable instead of shadowing a
        dump(b); // expected output: 100
    }
    dump(a); // expected output: 0
}

// Test 4: Compile-time constant evaluation
const myConst: Int = 3 + 4 * 2; // should be evaluated at compile-time as 11
fun testCompileTimeConstant() {
    dump(myConst); // expected output: 11
}

// Test 5: Behavior near arithmetic overflow
// Note: Depending on implementation, addition overflow might be detected at compile-time or runtime
fun testOverflow() {
    let max: Int = 2147483647; // Using 32-bit maximum as an example
    try {
        let sum: Int = max + 1; // attempt overflow
        dump(sum);
    } catch (err) {
        dump(err); // expected to catch an error if overflow is detected (exit code may vary)
    }
}

// Main: Execute all extended tests in sequence
fun main() {
    testThrowIf();           // expected dump: 123
    testThrowUnless();         // expected dump: 234
    testNestedBlocks();        // expected dumps: 100 then 0
    testCompileTimeConstant(); // expected dump: 11
    testOverflow();            // expected dump: either an overflow result or an error code
}
