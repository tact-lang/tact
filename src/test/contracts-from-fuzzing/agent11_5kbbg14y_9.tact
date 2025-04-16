contract TestParentheses {
    receive() {
         dump(1 + 2 * 3); // expected 7
         dump((1 + 2) * 3); // expected 9
    }
}
