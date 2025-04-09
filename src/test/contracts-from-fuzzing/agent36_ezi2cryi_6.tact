contract ConstantArithmetic {
    // Combined compile-time evaluation of built-in functions and arithmetic
    // ton("1") is expected to evaluate to 1000000000 (1e9)
    // crc32("test") is expected to evaluate to 3632233996
    // The sum should be 4632233996
    const Combined: Int = ton("1") + crc32("test");

    get fun getCombined() : Int {
        return self.Combined;
    }
}
