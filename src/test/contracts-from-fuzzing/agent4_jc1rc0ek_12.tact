contract TestLoopRepeat {
    receive() {
        let n: Int = 0;
        // According to docs, repeat with negative or zero count is ignored, so loop not executed
        repeat (-5) {
            n += 1;
        }
        dump(n); // Expected output: 0
    }
}
