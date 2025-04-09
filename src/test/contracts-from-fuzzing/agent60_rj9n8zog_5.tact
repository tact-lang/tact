contract Test {
    receive() {
        let a: Int = 2 + 2 == 4 ? 1 : 0;
        dump(a);
    }
}
