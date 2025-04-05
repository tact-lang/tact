contract TestString {
    fun show() {
        // Testing string literal with escape sequences and unicode escapes
        let s = "Hello\nWorld, \x41 \u{20AC}";
        dump(s);
    }
    
    receive() {
        self.show();
    }
}
