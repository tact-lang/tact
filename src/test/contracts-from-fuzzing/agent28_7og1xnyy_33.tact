contract TestNewlineEquality {
    receive() {
        // Test if different newline escape sequences yield different string values
        // Here, one string uses \n and the other uses \r\n. According to literal interpretation, they should not be equal.
        dump("Hello\nWorld" == "Hello\r\nWorld");
    }
}
