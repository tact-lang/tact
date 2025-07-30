contract TestParentheses {
    receive() {
        dump(((1 + 2) * (3 + 4))); // Expected output: 21
    }
}
