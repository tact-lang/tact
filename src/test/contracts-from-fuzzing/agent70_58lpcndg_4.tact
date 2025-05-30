contract TestContract {
    receive() {
        // Testing multiple escape sequences in a string literal
        dump("Line1\nLine2 with tab\tand unicode smiley: \u263A and emoji: \u{1F602}");
    }
}
