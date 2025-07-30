contract ExprIntegerLiterals {
    fun test() {
        // Decimal literal: expected value 42
        dump(42);
        
        // Hexadecimal literal: expected value 255
        dump(0xFF);
        
        // Octal literal: expected value 63 (7*8+7)
        dump(0o77);
        
        // Binary literal: expected value 10
        dump(0b1010);
    }
    
    receive() {
        self.test();
    }
}
