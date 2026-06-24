contract TestWhile {
    receive() {
        let x: Int = 5;
        while (x > 0) {
            x -= 1;
        }
        dump(x);
    }
}
