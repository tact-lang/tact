contract Test {
    receive() {
        let a: Int = 5 * (5 - 2);  // expected 15
        let b: Int = 5 * 5 - 2;      // expected 23 because '*' has higher precedence than '-'
        dump(a);
        dump(b);
    }
}
