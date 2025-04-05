contract TestRepeat {
    receive() {
        let count: Int = 0;
        repeat (5) {
            count += 1;
        }
        dump(count); // Expected output: 5
    }
}
