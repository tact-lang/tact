contract TestDoUntil {
    receive() {
        let x: Int = 10;
        do {
            x = x - 1;
        } until (x <= 0);
        dump(x); // Expected output: 0
    }
}
