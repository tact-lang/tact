contract TestTryCatch {
    fun run() {
        // Test try-catch: throw an exception and catch with exit code
        try {
            throw(777);
        } catch (code) {
            dump(code); // Expected output: 777
        }
    }

    receive() {
        self.run();
    }
}
