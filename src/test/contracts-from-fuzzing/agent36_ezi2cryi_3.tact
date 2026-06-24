struct Consts { a: Int; b: Int; c: Int; d: Int; }

contract ConstEvaluator() {
    // Compile-time evaluated constants
    const A: Int = ascii("⚡");
    const B: Int = ton("1");
    const C: Int = crc32("test");
    const D: Int = 10 + 20 * 3; // expected 70

    // Getter to retrieve the constants as a struct
    get fun getConsts() : Consts {
        return Consts{ a: self.A, b: self.B, c: self.C, d: self.D };
    }
}
