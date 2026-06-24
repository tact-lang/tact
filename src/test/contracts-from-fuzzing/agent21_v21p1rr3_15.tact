contract TestAugmentedAssignment {
    receive() {
        let x: Int = 100;
        x += 50;   // 150
        x -= 20;   // 130
        x *= 2;    // 260
        x /= 5;    // 52
        x %= 7;    // 52 mod 7 = 3
        x &= 15;   // 3 & 15 = 3
        x ^= 5;    // 3 xor 5 = 6
        x |= 2;    // 6 | 2 = 6
        x <<= 1;   // 6 << 1 = 12
        x >>= 2;   // 12 >> 2 = 3
        dump(x);   // expect 3
        return;
    }
}
