fun add(a: Int, b: Int): Int {
    return a + b;
}

contract TestFunctionCalls {
    receive() {
        // Test simple function call
        dump(add(2, 3)); // Expected output: 5
        
        // Test nested function calls
        dump(add(add(1, 2), add(3, 4))); // Expected output: 10
        
        // Test inline arithmetic with function call result
        let result = add(10, 20) * 2; // Expected: 30 * 2 = 60
        dump(result);
    }
}
