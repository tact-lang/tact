contract TestDoUntil {
    receive() {
        let x = 3;
        do {
            dump(x);
            x -= 1;
        } until (x == 0);
    }
}
