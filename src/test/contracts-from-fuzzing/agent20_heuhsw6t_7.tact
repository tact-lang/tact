contract TestOptionalExpressions {
    fun showcase() {
        // Testing optional expressions
        let opt: Int? = null;
        dump(opt); // expected output: null or similar representation of null

        // Assigning a non-null value to an optional
        let opt2: Int? = null;
        opt2 = 42;
        // Using non-null assertion operator !! should yield 42
        dump(opt2!!);

        // Conditional check on optional value
        if (opt2 != null) {
            dump(1); // branch taken if non-null
        } else {
            dump(0);
        }
    }

    receive() {
        self.showcase();
    }
}
