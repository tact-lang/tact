contract TestDoUntil {
    receive() {
        let x: Int = 3;
        do {
            x -= 1;  // subtract 1 on each iteration
        } until (x <= 0);
        dump(x); // Expected output: 0
    }
}
