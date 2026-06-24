struct ConstResults {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}

contract TestConstants() {
    // Compile-time evaluated constants
    const A: Int = ton("1");
    const B: Int = ascii("⚡");
    const C: Int = crc32("000DEADBEEF000");
    const D: Int = 1730 + (8 | 8);

    get fun values(): ConstResults {
        return ConstResults { a: self.A, b: self.B, c: self.C, d: self.D };
    }
}
