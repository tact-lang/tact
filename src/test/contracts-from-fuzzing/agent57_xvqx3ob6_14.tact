contract TestParentheses {
    receive() {
        let a: Int = (2 + 3) * (4 - 1);
        let b: Int = 2 + 3 * (4 - 1);
    }
}
