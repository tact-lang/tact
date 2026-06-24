contract SerializationWithinBounds {
    a: Int as uint1; // 1-bit unsigned, only 0 or 1
    b: Int as int257; // full 257-bit signed Int
    init() {
        self.a = 1;
        self.b = (1 << 255) - 1; // max positive 257-bit signed int
    }
}