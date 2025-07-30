contract TestOptionals() {
    fun test() {
        // Optionals: assign null then a value, then use non-null assertion
        let opt: Int? = null;
        let updated: Int? = 0; // implicit null value initially
        // Reassigning a non-null value
        let opt2: Int? = 42;
        dump(opt2!!); // should dump 42
        if (opt2 != null) {
            dump(1);
        } else {
            dump(0);
        }
    }
    receive() { self.test(); }
}
