contract TestWhile {
    receive() {
        let x: Int = 10;
        while (x > 0) {
            x = x - 1;
        }
        dump(x); // Expected output: 0
    }
}
