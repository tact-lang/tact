contract TestWhile {
    receive() {
        let x: Int = 10;
        while (x > 0) {
            x -= 1;
        }
        dump(x); // expected output: 0
    }
}
