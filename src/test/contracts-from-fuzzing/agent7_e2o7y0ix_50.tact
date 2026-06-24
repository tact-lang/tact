/*
  Advanced Control Flow Fuzz Testing in Tact
  ------------------------------------------------------------
  This snippet tests advanced control flow constructs in Tact, including:
    1. Tail-recursive functions (for computing factorial and summing numbers) to simulate loop behavior.
    2. Conditional branching using if-else statements to verify proper condition handling.

  Functions included:
    - factorial(n, acc): Tail-recursive function that computes n! (factorial) with accumulator acc.
    - testRecursion(): Calls factorial(10, 1) expecting 3628800.
    - sumUp(n, acc): Tail-recursive summing function that sums numbers from n up to 10.
    - testLoopRecursion(): Calls sumUp(1, 0) expecting 55.
    - testConditional(): Uses an if-else statement to dump a condition test, expecting "a > 5" when a is 10.

  Known documentation example(s) for control flows can be found in the Tact documentation (e.g. Tact-By-Example, control flow chapters).
*/

fun factorial(n: Int, acc: Int): Int {
    if (n <= 0) {
        return acc;
    } else {
        return factorial(n - 1, acc * n);
    }
}

fun testRecursion() {
    // Compute factorial of 10, expected result is 3628800
    dump(factorial(10, 1));
}

fun sumUp(n: Int, acc: Int): Int {
    if (n > 10) {
        return acc;
    } else {
        return sumUp(n + 1, acc + n);
    }
}

fun testLoopRecursion() {
    // Sum numbers from 1 to 10, expected result is 55
    dump(sumUp(1, 0));
}

fun testConditional() {
    let a: Int = 10;
    if (a > 5) {
        dump("a > 5");
    } else {
        dump("a <= 5");
    }
}

fun main() {
    testRecursion();         // Expected output: 3628800
    testLoopRecursion();       // Expected output: 55
    testConditional();         // Expected output: "a > 5"
    return;
}
