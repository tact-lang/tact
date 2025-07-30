// Test case for Optionals
contract TestOptionals() {
    fun run() {
        // Test an optional Int initialized to null
        let a: Int? = null;
        // Check for null
        if (a == null) {
            dump(1); // Expect to dump 1, meaning it's null
        } else {
            dump(0);
        }
        // Test assigning a non-null value and using non-null assertion
        let b: Int? = 42;
        dump(b!!); // Expected to dump 42

        // Test an optional Bool
        let flag: Bool? = true;
        if (flag != null) {
            dump(flag!!); // Expected to dump true
        } else {
            dump(false);
        }
    }

    receive() {
        self.run();
    }
}
