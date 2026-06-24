fun echo(s: String): String {
    return s;
}

contract Test {
    receive() {
        // Test a function that takes a String parameter and returns the same string
        let t: String = echo("Echo test: \n New line and \t tab");
        
        // Check equality with the expected string literal
        if (t == "Echo test: \n New line and \t tab") {
            // Use hashData() to force compilation of the string processing
            let dummy: Int = t.hashData();
        }
    }
}
