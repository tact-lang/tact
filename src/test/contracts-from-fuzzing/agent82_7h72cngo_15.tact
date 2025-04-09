contract TestStringMultiEscape {
    receive() {
        // Test multiple escape sequences including \n, \t, \r, and hex escape \x21 for '!'
        let s: String = "Line1\nLine2\tTab\rCarriage\x21";
    }
}
