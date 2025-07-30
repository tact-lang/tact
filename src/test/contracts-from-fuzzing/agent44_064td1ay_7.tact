contract TestWhile {
    receive() {
        let x = 3;
        while (x > 0) {
            dump(x);
            x -= 1;
        }
    }
}
