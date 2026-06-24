contract Test {
    receive() {
        let x: Int = 5;
        x += 3;
        dump(x);
    }
}
