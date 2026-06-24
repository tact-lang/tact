contract Test {
    receive() {
        let x: Int = 3;
        while (x > 0) {
            dump(x);
            x -= 1;
        }
        dump(x);
    }
}
