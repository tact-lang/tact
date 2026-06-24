contract TestLet {
    receive() {
        let a: Int = 10;
        let b = 20;
        dump(a + b);
    }
}
