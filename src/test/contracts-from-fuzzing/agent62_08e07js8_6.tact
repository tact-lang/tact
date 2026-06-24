contract Test {
    // Test: using '_' as a function parameter in a non-receive function (should be rejected)
    fun foo(_: Int): Int {
        return 1;
    }

    receive() {
        self.foo(10);
    }
}
