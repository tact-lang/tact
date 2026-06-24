contract TestDoUntil {
    receive() {
        let x: Int = 1;
        do {
            x = x - 1;
        } until (x == 0);
        dump(x);
    }
}
