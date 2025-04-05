contract TestRepeatZero {
    receive() {
        let counter: Int = 0;
        // When repetition count is 0, the block should not execute
        repeat (0) {
            counter = counter + 1;
        }
        dump(counter); // Expected to dump 0
    }
}
