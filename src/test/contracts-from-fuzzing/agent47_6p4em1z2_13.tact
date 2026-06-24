contract TestBitwiseOps {
    receive() {
        // Bitwise AND: 0b1111 (15) & 0b1010 (10) = 0b1010 (10)
        let andResult: Int = 0b1111 & 0b1010;
        dump(andResult.toString());
        
        // Bitwise OR:  0b1000 (8) | 0b0101 (5) = 0b1101 (13)
        let orResult: Int = 0b1000 | 0b0101;
        dump(orResult.toString());
        
        // Bitwise XOR: 0b1111 (15) ^ 0b1010 (10) = 0b0101 (5)
        let xorResult: Int = 0b1111 ^ 0b1010;
        dump(xorResult.toString());
        
        // Bitwise NOT: ~0 should yield -1
        let notResult: Int = ~0;
        dump(notResult.toString());
        
        // Shift left: 2 << 2 = 8
        let shlResult: Int = 2 << 2;
        dump(shlResult.toString());
        
        // Shift right: 8 >> 3 = 1
        let shrResult: Int = 8 >> 3;
        dump(shrResult.toString());
    }
}
