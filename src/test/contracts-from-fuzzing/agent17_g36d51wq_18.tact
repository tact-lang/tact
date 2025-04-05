contract TestRepeatZero {
    receive() {
        let count: Int = 0;
        // repeat 0 times: loop body should not execute
        repeat(0) {
            // this block should not run
            count = count + 1;
        }
        dump(count); // Expected output: 0
    }
}
