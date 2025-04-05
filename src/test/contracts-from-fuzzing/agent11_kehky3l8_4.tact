contract TestOptionals() {
    fun test() {
        // Declare an optional Int and check default value
        let opt: Int? = null;
        // Should be null, so we output 0 in that case
        if (opt == null) {
            dump(0);
        } else {
            dump(1);
        }
        
        // Now assign a non-null value and use non-null assertion
        opt = 100;
        dump(opt!!); // should output 100
    }

    receive() { self.test(); }
}
