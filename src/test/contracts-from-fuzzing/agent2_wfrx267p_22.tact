contract Test {
    receive() {
        // Test chaining of StringBuilder.concat to build a string using escape sequences
        let sb: StringBuilder = beginString()
            .concat("foo")
            .concat("bar")
            .concat("\nbaz");
        let s: String = sb.toString();
        
        // Check that the built string equals the expected literal
        if (s != "foobar\nbaz") {
            let dummy: Int = s.hashData();
        }
    }
}
