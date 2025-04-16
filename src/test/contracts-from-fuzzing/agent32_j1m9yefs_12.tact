contract TestRepeatZero {
    receive() {
        let count: Int = 0;
        repeat (0) {
            count += 1;
        }
        dump(count); // Expected output: 0
    }
}
