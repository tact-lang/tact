contract TestOptionals {
    fun test() {
        // Testing Optional expressions
        // According to docs, optionals can be null or hold a value and require non-null assertion with !!
        let opt: Int? = null;
        // Reassign a non-null value
        let opt2: Int? = 42;
        dump(opt2!!);  // Expected output: 42

        // Comparison of optionals to null
        if (opt != null) {
            dump(1);
        } else {
            dump(0);
        }
    }

    receive() {
        self.test();
    }
}
