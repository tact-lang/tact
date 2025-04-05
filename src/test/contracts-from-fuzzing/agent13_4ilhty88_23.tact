contract TestRepeatNegative {
    receive() {
        let count: Int = 0;
        // Negative repeat should be ignored per docs
        repeat (-1) {
            count += 1;
        }
        dump(count); // expecting 0
    }
}
