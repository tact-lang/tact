contract TestWildcard {
    // Function with wildcard parameter. It should discard the passed value
    fun test(_: Int): Int {
        return 123;
    }

    receive() {
        let x = self.test(10);
        if (x != 123) {
            throw(1);
        }
    }
}
