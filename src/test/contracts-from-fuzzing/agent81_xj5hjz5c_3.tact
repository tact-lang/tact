contract TestOptional() {
    fun run() {
        // Test: optional Int initialized as null and then assigned a value
        let x: Int? = null;
        // Assign a non-null value
        let y: Int? = 10;
        dump(y!!); // Expected output: 10
    }
    receive() {
        self.run();
    }
}
