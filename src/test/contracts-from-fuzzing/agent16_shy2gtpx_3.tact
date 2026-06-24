contract TestOptionals() {
    fun test() {
        // Declare an optional Int and assign a value
        let opt: Int? = null;
        // Later assign a non-null value
        let opt2: Int? = 77;
        // Using non-null assertion operator (!!) on non-null value; expected: 77
        dump(opt2!!);

        // Use conditional check on optional
        if (opt != null) {
            dump(1); // not expected
        } else {
            dump(0); // expected output: 0
        }
    }

    receive() {
        self.test();
    }
}
