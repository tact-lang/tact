contract TestOptionals {
    fun test() {
        // Valid usage of optionals
        let opt: Int? = null;
        opt = 123;
        let value: Int = opt!!; // non-null assertion
        dump(value);

        // Comparison against null
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
