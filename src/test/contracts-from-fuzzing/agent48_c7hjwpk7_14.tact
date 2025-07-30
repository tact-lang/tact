contract Test {
    receive() {
        let x: Int = 5;
        x += 1;
        dump(x);
    }
}
