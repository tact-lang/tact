/*
  Fuzz Test: Optionals and Null Handling in Tact
  ------------------------------------------------------------
  This snippet rigorously tests the behavior of optionals, null comparisons, and the non-null assertion operator (!!).

  Test cases include:
    1. Declaring an optional Int that is null, and verifying that comparisons with null work as expected.
    2. Declaring an optional Int that is non-null, and using the !! operator to retrieve its value.
    3. A helper function, safeAdd, which safely adds an integer to an optional value, testing both null and non-null cases.

  Expected outputs:
    - The first dump should print "a is null".
    - The second dump should print 42 (from b!!).
    - safeAdd(a, 10) should yield 10.
    - safeAdd(b, 10) should yield 52.
*/

fun safeAdd(x: Int?, y: Int) : Int {
    if (x == null) {
        return y;
    } else {
        return x!! + y;
    }
}

fun testOptionals() {
    let a: Int? = null;
    if (a == null) {
        dump("a is null");
    } else {
        dump("a is not null");
    }

    let b: Int? = 42;
    dump(b!!); // Expected output: 42

    dump(safeAdd(a, 10)); // Expected output: 10
    dump(safeAdd(b, 10)); // Expected output: 52
}

fun main() {
    testOptionals();
    return;
}
