contract ShiftTest() {
    fun test() {
        let five = 5;
        let four = 4;
        // Test left shift operation
        // 5 << 2 should be 20
        dump(five << 2);
        
        // Test right shift (arithmetic) on a positive number
        // 4 >> 2 should be 1
        dump(four >> 2);
        
        // Test right shift on a negative number
        // -4 >> 2 should preserve the sign (i.e., arithmetic right shift)
        dump(-four >> 2);
        
        // Test complex combination: ((5 << 2) + (4 >> 2)) * 2, expected: ((20 + 1) * 2 = 42)
        dump(((five << 2) + (four >> 2)) * 2);
    }
    
    receive() {
        self.test();
    }
}
