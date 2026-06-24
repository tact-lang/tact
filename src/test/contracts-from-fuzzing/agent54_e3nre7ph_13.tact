contract TestRepeatPositive {
    receive() {
        let sum: Int = 0;
        repeat (5) {
            sum += 1;
        }
        dump(sum); // Expected output: 5
    }
}
