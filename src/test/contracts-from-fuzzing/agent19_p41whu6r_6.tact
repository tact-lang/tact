contract TestStringEscape() {
    fun test() {
        // Testing string literal escape sequences
        let s: String = "\\ \" \n \r \t \v \b \f \x00";
        dump(s);
    }
    
    receive() {
        self.test();
    }
}
