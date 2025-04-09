contract TestRepeat {
    receive() {
        // Test Repeat Loop: Valid positive repetition
        let count: Int = 0;
        repeat (3) {
            count += 1;
        }
        dump(count); // Expected output: 3 (if executed)
    }
}
