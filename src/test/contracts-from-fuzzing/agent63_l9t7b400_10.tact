contract TestRepeatValid {
    // Test: valid repeat loop with a positive counter (should execute 3 times)
    receive() {
        let counter: Int = 0;
        repeat (3) {
            counter += 1;
        }
        dump(counter);
    }
}
