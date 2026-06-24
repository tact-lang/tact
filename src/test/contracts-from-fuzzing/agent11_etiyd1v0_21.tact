contract BitwiseTest {
    get fun test() : Int {
        // Bitwise AND
        let a: Int = 255 & 0b00001111;   // Expected: 15
        let d: Int = 4 & 1;              // Expected: 0

        // Bitwise XOR
        let b: Int = 3 ^ 1;              // Expected: 2

        // Bitwise OR
        let c: Int = 1 | 2;              // Expected: 3

        // Bitwise AND between negative numbers: should behave by using two's complement (Tact uses signed 257-bit ints)
        let e: Int = (-1) & 0b1010;      // In many languages, -1 has all bits set, so e should equal 0b1010, i.e., 10

        return a + b + c + d + e;  // Expected result: 15 + 2 + 3 + 0 + 10 = 30
    }
}
