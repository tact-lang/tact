contract Test {
    receive() {
        let a: Int = -1 % 5; // expected: 4
        dump(a);
    }
}
