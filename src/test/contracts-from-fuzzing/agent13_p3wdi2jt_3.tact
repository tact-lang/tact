contract TestOptionalsValid() {
    fun run() {
        // Define an optional Int and assign null
        let opt: Int? = null;
        // Assign a non-null value
        let opt2: Int? = 123;
        // Use non-null assertion on opt2
        dump(opt2!!); // Should dump 123
        // Test optional in condition
        if (opt == null) {
            dump(0);
        } else {
            dump(1);
        }
    }
    receive() {
        self.run();
        cashback(sender());
    }
}
