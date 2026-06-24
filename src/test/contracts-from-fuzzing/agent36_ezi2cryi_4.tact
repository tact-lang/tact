struct BuiltInConsts { A: Int; B: Int; C: Int; D: Int; E: Int; }

contract BuiltInEvaluator() {
    // ascii: evaluates string literal with special character
    const A: Int = ascii("⚡");
    // ton: one Toncoin in nanoToncoins
    const B: Int = ton("1");
    // crc32: compute a 32-bit hash of the string "test"
    const C: Int = crc32("test");
    // sha256: compute SHA256 hash of the string "hello" at compile time
    const D: Int = sha256("hello");
    // A simple arithmetic constant
    const E: Int = 100 - 30 * 2; // expected: 40

    get fun getConsts() : BuiltInConsts {
        return BuiltInConsts{ A: self.A, B: self.B, C: self.C, D: self.D, E: self.E };
    }
}
