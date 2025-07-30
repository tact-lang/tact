contract Test {
    // A simple test of operator precedence: addition vs multiplication.
    receive() {}

    fun test(): Int {
        let a = 1 + 2 * 3; // Expected result: 1 + (2*3) = 7
        return a;
    }
}
