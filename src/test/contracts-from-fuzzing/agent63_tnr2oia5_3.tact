contract Test {
    receive() {
        // Testing valid escape sequences in string literal: newline \n, tab \t, and escaped quote \" 
        let s: String = "Line1\nLine2\tAnd a \"quote\"";
    }
}
