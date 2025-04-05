contract TestShiftAugAssign {
    receive() {
        // Test left and right augmented shift operators
        let x: Int = 3;
        x <<= 3;  // Expected: 3 << 3 = 24
        dump(x);
        
        let y: Int = 256;
        y >>= 3;  // Expected: 256 >> 3 = 32
        dump(y);
    }
}
