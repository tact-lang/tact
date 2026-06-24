contract TestParentheses {
    receive() {
        let a: Int = 5 * (3 + 2);  // expected 25
        let b: Int = (5 * 3) + 2;  // expected 17
        dump(a);
        dump(b);
    }
}
