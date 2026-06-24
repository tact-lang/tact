/// Fuzz-Test Suite: Test 12: Comparing ternary operator vs arithmetic using sign function

fun testBranch(x: Int): Int {
    // Using ternary operator
    return x > 0 ? 2 : 1;
}

fun testArithmetic(x: Int): Int {
    // Using arithmetic with sign function, assuming sign(x) returns 1 for positive, 0 otherwise
    return 1 + sign(x);
}

contract TestBranchArithmetic {
    receive() {
        let a = testBranch(5);      // Expected: 2
        let b = testArithmetic(5);    // Expected: 2
        let c = testBranch(0);        // Expected: 1
        let d = testArithmetic(0);    // Expected: 1
        dump(a);
        dump(b);
        dump(c);
        dump(d);
    }
}
