contract TestDoUntilValid {
    receive() {
        let x: Int = 3;
        do {
            dump(x);
            x -= 1;
        } until (x <= 0);
        dump(x);
    }
}
