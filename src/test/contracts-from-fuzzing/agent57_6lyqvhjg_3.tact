contract TestOptionalsValid {
    fun test() {
        // Declare an optional Int with initial null value
        let opt: Int? = null;
        // Reassign with a non-null integer
        let opt2: Int? = 123;
        // Using non-null assertion operator to safely extract the value
        dump(opt2!!); // Expect output: 123

        // Use conditional check with optional
        if (opt != null) {
            dump(opt);
        } else {
            dump(0); // Should dump 0 because opt is null
        }
    }
    
    receive() {
        self.test();
    }
}
