contract TestArithmeticOps {
    receive() {
        // Test addition
        let sum: Int = 1 + 2;
        dump(sum);
        
        // Test subtraction
        let diff: Int = 5 - 3;
        dump(diff);
    }
}
