contract TestSHA256() {
    // Using sha256 compile-time function on a literal, expecting the result to be computed at compile time
    // The exact numeric output might be implementation-defined, so we just ensure it compiles and is available.
    const HASH: Int = sha256("hello");

    fun test() {
        dump(self.HASH);
    }

    receive() {
        self.test();
        cashback(sender());
    }
}
