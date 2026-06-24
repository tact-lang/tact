contract TestOptionals {
    fun test() {
        // Declare an optional Int and test its behavior
        let opt: Int? = null;
        // When opt is null, dump 0
        if (opt == null) {
            dump(0);
        } else {
            dump(opt!!);
        }
        // Now assign a value and use non-null assertion
        opt = 123;
        dump(opt!!); // expected to dump 123
    }

    receive() {
        self.test();
    }
}
