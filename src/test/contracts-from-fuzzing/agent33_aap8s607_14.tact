contract TestBitwiseOperators {
    receive() {
        // Test bitwise NOT: double negation should return original value
        let a: Int = ~(~10); // expected: 10
        
        // Test bitwise OR
        let b: Int = 3 | 1;   // expected: 3, since 0b11 OR 0b01 = 0b11
        
        // Test bitwise XOR
        let c: Int = 5 ^ 1;   // expected: 4, since 0b101 XOR 0b001 = 0b100
    }
}
