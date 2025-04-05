contract TestRepeatValid {
    receive() {
        let twoPow: Int = 1;
        repeat (10) {
            twoPow *= 2;
        }
        dump(twoPow);
    }
}
