contract TestRepeatNeg {
    receive() {
        let x: Int = 0;
        // Negative repeat count should cause block to be skipped
        repeat (-1) {
            x += 100;
        }
        dump(x); // Expected output: 0
    }
}
