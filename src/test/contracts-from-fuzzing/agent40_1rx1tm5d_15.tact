contract TestBitwise {
    receive() {
        // Test bitwise OR
        dump(5 | 1);  // expected: 5 (binary 101 | 001 = 101, which is 5)
        
        // Test bitwise XOR
        dump(5 ^ 1);  // expected: 4 (binary 101 ^ 001 = 100, which is 4)
        
        // Test bitwise AND
        dump(6 & 3);  // expected: 2 (binary 110 & 011 = 010, which is 2)
    }
}
