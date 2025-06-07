contract TestRepeatNegative {
    receive() {
        let sum: Int = 0;
        // repeat with 0 times should not execute the loop body
        repeat (0) {
            sum += 1;
        }
        dump(sum); // Expected output: 0
    }
}
