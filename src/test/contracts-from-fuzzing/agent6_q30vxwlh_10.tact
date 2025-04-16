contract TestDoUntilValid {
    receive() {
        let x: Int = 5;
        do {
            x -= 1;
        } until (x == 0);
        dump(x);
    }
}
