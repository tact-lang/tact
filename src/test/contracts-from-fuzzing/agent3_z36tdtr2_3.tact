contract TestStringEscapes {
    fun test() {
        // Testing various escape sequences in string literals
        let s = "\\ \" \n \r \t \v \b \f \x00";
        dump(s);
    }
    
    // The receive function ensures that test() is compiled and executed
    receive() {
        self.test();
    }
}
