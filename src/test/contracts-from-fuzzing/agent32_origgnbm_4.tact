contract TestEmptyString {
    receive() {
        // Testing an empty string literal
        let s: String = "";
        self.reply(s.asComment());
    }
}
