contract TestDoUntilValid {
    receive() {
        let x: Int = 10;
        do {
            x -= 1;
        } until (x == 5);
        dump(x);
    }
}
