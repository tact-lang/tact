contract Test {
    // Valid usage: wildcard in a function parameter for discarding
    fun test(_: Int): Int { return 0; }
    receive() { self.test(1); }
}
