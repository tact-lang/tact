contract TestNumericUnderscore {
    receive() {
        // Test integer literals with underscores
        let x: Int = 1_000_000; // One million
        dump(x); // Expected output: 1000000
    }
}
