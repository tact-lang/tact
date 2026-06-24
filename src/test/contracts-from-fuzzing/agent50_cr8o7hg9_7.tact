contract TestRepeat {
    receive() {
        let twoPow: Int = 1;
        repeat (3) {
            twoPow *= 2;
        }
        dump(twoPow);
    }
}
