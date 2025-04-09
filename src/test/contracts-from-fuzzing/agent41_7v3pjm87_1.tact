contract Test {
    receive() {
        let x: Int = 123;
        let y = 456;
        dump(x + y);
    }
}
