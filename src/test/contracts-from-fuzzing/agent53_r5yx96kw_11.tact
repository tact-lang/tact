contract Test {
    receive() {
        // Test string equality and inequality
        let eq: Bool = "a" == "a";  // should be true
        let neq: Bool = "a" != "b";  // should be true
        
        // Use if condition based on string equality
        if ("hello" == "hello") {
            // do nothing
        } else {
            // unreachable branch
        }
    }
}
