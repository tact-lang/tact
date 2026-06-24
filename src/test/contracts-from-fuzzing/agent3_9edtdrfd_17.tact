contract TestCatch {
    receive() {
        // Test try-catch mechanism: throw a specific exit code and catch it
        try {
            throw(777);
        } catch (code) {
            // In catch block, 'code' should be 777
            if (code != 777) { throw(1); }
        }
        cashback(sender());
    }
}
