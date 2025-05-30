contract TestLet {
    receive() {
        let a: Int = 5;
        let b = 7;
        dump(a + b);
    }
}
