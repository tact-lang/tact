fun identity(x: Int): Int { return x; }

contract TestFunctionCalls {
    receive() {
        // Simple function call
        let a: Int = identity(100);
        // Chained function calls
        let b: Int = identity(identity(200));
    }
}
