contract TestRepeatZero {
    receive() {
        let x: Int = 0;
        repeat (0) {
            x += 1;
        }
        dump(x);
    }
}
