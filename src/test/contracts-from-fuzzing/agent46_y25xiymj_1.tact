contract Test {
    receive() {}

    fun addTest(): Int {
        // Testing operator precedence: multiplication should have higher precedence than addition.
        // According to standard behavior, 1 + 2 * 3 should be evaluated as 1 + (2 * 3) = 7.
        let a = 1 + 2 * 3;
        return a;
    }
}
