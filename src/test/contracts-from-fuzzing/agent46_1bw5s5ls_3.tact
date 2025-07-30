contract TestOptionalsCorrect {
    fun test() {
        // Correct usage of optionals
        let x: Int? = null;
        // Assign a non-null value
        x = 100;
        // Using non-null assertion operator on an optional
        dump(x!!); // Expected output: 100
    }
    receive() { self.test(); }
}
