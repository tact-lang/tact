fun testOptionalsValid() {
    // Valid usage of optional
    let x: Int? = null;
    x = 7;
    dump(x!!); // should print 7
}

fun main() {
    testOptionalsValid();
}
