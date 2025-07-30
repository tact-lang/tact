contract Test {
    receive() {
        // Test explicit and inferred variable declarations
        let a: Int = 123;
        let b = 456; // inferred as Int
        // Test optional explicit initialization
        let opt: Int? = null;
        
        // Use dump() to output the sum
        dump(a + b);
    }
}
