contract TestOptional {
    fun run() {
        // Test the non-null assertion operator, !!, with an optional Int
        let op: Int? = null;
        // Assign a value
        let newOp: Int? = 42;
        dump(newOp!!); // Expected output: 42
    }
    receive() {
        self.run();
    }
}
