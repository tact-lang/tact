contract Test {
    receive() {
        let a: Int = 1;
        let b: Int = 2;
        let c: Int = a + b;
        dump(c);
    }
}
