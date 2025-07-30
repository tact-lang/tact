contract TestWhile {
    receive() {
        let x: Int = 3;
        while (x > 0) {
            x -= 1;
        }
        dump(x); // Expected output: 0
    }
}
