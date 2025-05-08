contract TestOptional() {
    fun test() {
        // Test optional assignment and non-null assertion
        let opt: Int? = null;
        // Reassign value
        let opt2: Int? = 255;
        dump(opt2!!); // Should dump 255
        // Conditional check
        if (opt2 != null) {
            dump(1);
        } else {
            dump(0);
        }
    }
    receive() { self.test(); }
}
