contract TestBinaryArithmetic {
    receive() {
        // Test Addition
        let add: Int = 1 + 2;
        // Test Subtraction
        let sub: Int = 3 - 2;
        // Test Multiplication
        let mul: Int = 3 * 2;
        // Test Division
        let div: Int = 4 / 2;
        
        dump(add);
        dump(sub);
        dump(mul);
        dump(div);
    }
}
