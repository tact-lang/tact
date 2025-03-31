/*
Advanced Fuzz-Testing: Recursion, throwUnless, and Optional Handling

This Tact snippet combines several advanced features:

1. A tail-recursive function for computing factorial using an accumulator.
2. Using throwUnless() to assert an arithmetic invariant (instead of assert()).
3. Handling an optional value using the ternary operator.

We expect:
• factorial(5, 1) computes 5! = 120.
• The arithmetic invariant (5 * 3 == 15) is enforced by throwUnless(), which should not throw.
• testOptional() returns 0 since the optional is null.

The main function returns the sum: 120 + 15 + 0 = 135.
*/

fun factorial(n: Int, acc: Int): Int {
    if (n == 0) {
        return acc;
    } else {
        return factorial(n - 1, acc * n);
    }
}

fun testFactorial(): Int {
    return factorial(5, 1);
}

// Use throwUnless to check the invariant x == 15; throwUnless is defined in the core debug functions.
fun testInvariant() : Int {
    let x: Int = 5 * 3;
    // throwUnless(exitCode, condition): if condition is false, throws exitCode.
    // Here, condition is true so no exception should be thrown.
    throwUnless(101, x == 15);
    return x;
}

fun testOptional() : Int {
    let maybe: Int? = null;
    return maybe == null ? 0 : maybe!!;
}

fun main() : Int {
    return testFactorial() + testInvariant() + testOptional();
}
