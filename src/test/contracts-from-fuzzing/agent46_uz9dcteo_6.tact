contract TestSha256() {
    // Test constant evaluation of sha256 built-in compile-time function.
    // The sha256 function returns an Int computed at compile time.
    const S: Int = sha256("test");

    fun showcase() {
        dump(self.S); // will output the compile-time computed sha256 hash of "test"
    }

    receive() {
        self.showcase();
        return;
    }
}
