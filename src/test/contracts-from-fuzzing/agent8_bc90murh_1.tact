/* Test Snippet 1: Regular function with early return inside nested block */
fun testEarlyReturn(x: Int): Int {
    if (x > 0) {
        return x;
    }
    {
        return -x;
    }
}

// Dummy main to allow standalone compilation
fun main() {
    let a: Int = testEarlyReturn(5);
    let b: Int = testEarlyReturn(-3);
    dump(a);
    dump(b);
}
