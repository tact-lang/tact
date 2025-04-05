contract TestStringLiterals() {
    fun run() {
        // Testing string literal escape sequences
        let s: String = "Line1\nLine2\tTabbed";
        dump(s);
    }
    
    receive() {
        self.run();
    }
}
