contract Test {
    receive() {
        let a: Int = 5;
        a += 2;
        dump(a);
    }
}
