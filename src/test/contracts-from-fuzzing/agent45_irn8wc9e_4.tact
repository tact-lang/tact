// Test 1: Literal expressions (integers, booleans, strings, addresses)
contract TestLiterals {
    receive() {
        // Literal integer expression
        let intVal: Int = 42;
        
        // Literal boolean expression
        let boolVal: Bool = false;
        
        // Literal string expression
        let strVal: String = "Hello, Tact!";
        
        // Literal address expression (using sender() function)
        let addrVal: Address = sender();
    }
}
