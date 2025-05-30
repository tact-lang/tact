contract TestWhile {
    receive() {
        let x: Int = 3;
        while (x > 0) {
            x = x - 1;
        }
        dump(x);
    }
}
