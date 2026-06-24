contract TestOptionalsValid() {
    fun test() {
        // Optional value, initially null
        let x: Int? = null;
        // Now assign a non-null value
        let x_nonnull: Int? = 123;
        // Access the value with non-null assertion
        dump(x_nonnull!!);
        // Also check conditional access
        if (x == null) {
            dump(0);
        } else {
            dump(x!!);
        }
    }

    receive() {
        self.test();
    }
}
