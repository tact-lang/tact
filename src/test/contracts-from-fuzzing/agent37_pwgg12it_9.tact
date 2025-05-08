contract TestDoUntil {
    receive() {
        let x: Int = 3;
        do {
            x -= 1;
        } until (x <= 0);
        dump(x);
    }
}
