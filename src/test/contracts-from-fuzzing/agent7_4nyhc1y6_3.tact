contract TestLet {
    receive() {
        // Valid let statement with explicit type
        let value: Int = 123;
        dump(value);
        
        // Valid let statement with type inference
        let inferred = 456;
        dump(inferred);
    }
}
