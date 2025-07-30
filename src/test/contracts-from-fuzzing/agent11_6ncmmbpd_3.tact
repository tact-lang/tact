contract Test {
    receive() {
        let a: Int = -6 / 5; // expected: -2 rounding down
        dump(a);
    }
}
