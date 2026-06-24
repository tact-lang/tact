contract TestOptionals() {
    fun run() {
        // Declare an optional Int and assign null
        let opt: Int? = null;
        // Now assign a valid integer
        opt = 42;
        // Use non-null assertion operator to extract value
        let x: Int = opt!!; // Expect x to be 42

        // Test conditional check for optional
        if (opt != null) {
            // Do nothing, just a valid branch
        } else {
            // This branch should not execute
        }
        return;
    }
    receive() {
         self.run();
         cashback(sender());
    }
}
