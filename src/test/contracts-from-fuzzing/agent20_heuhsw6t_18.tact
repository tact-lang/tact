contract TestTryCatch {
    fun showcase() {
        // Test try...catch with throw. We throw an error with exit code 1042,
        // and catch it, dumping the error code.
        try {
            throw(1042);
        } catch (exitCode) {
            dump(exitCode); // expecting output: 1042
        }
    }

    receive() {
        self.showcase();
    }
}
