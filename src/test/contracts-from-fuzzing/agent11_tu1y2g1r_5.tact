contract TestStringExpressions {
    // This test contracts examines string literal expressions and escape sequences.
    // It also tests the asComment() conversion on string literals.
    fun test() {
        // Dump a simple string literal
        dump("Hello, World!");
        
        // Dump a string with common escape sequences
        dump("\\\"\\n\\r\\t\\v\\b\\f\\x00");
        
        // Dump a string containing Unicode escapes
        dump("\u0000 through \uFFFF");
        
        // Convert a string literal to a comment cell and dump it
        let commentCell = "hey".asComment();
        dump(commentCell);
    }
    
    // The receive function ensures that the test() function is compiled and used
    receive() {
        self.test();
    }
}
