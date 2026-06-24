contract TestRepeat {
    receive() {
        let twoPow: Int = 1;
        repeat (3) {
            twoPow = twoPow * 2;
        }
        dump(twoPow); // Expected output: 8
    }
}
