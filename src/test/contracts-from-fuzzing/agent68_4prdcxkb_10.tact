contract TestContract {
    receive() {
        let x: Int = 3;
        do {
            x = x - 1;
        } until (x <= 0);
        dump(x); // Expected output: 0
    }
}
