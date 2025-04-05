contract TestBitwise {
    receive() {
        let a: Int = 5 & 3;  // bitwise AND: 5 (101) & 3 (011) = 1 (001)
        let b: Int = 7 | 2;  // bitwise OR: 7 (111) | 2 (010) = 7 (111)
        let c: Int = 8 ^ 3;  // bitwise XOR: 8 (1000) ^ 3 (0011) = 11 (1011)
        let d: Int = 4 << 1; // left shift: 4 (100) << 1 = 8 (1000)
        let e: Int = 8 >> 2; // right shift: 8 (1000) >> 2 = 2 (10)
    }
}
