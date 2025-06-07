/// Test 10: Testing handling of stack underflow error when capturing more values than provided
struct Handler { f1: Int; f2: Int; f3: Int }

// This asm function attempts to capture three values from the stack
// but only pushes two numbers
asm fun underflowTest(a: Int, b: Int): Handler { 
    // Only one addition is performed, leaving one extra value missing if attempting to capture three values
    ADD
}

// We expect a runtime error due to stack underflow when calling underflowTest
fun test_underflowTest(a: Int, b: Int): Handler {
    return underflowTest(a, b);
}
