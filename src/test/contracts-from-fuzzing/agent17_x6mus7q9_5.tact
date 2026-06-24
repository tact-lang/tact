contract TestStringLiterals {
    fun run() {
        // Testing string literal with common escape sequences
        let s: String = "\\ \" \n \r \t \v \b \f \x00 through \xFF";
        dump(s);
    }
    receive() {
        self.run();
    }
}
