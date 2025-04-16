contract SignedUnsigned {
    a: Int as int64;
    b: Int as uint64;
    init() {
        self.a = -9223372036854775808; // min for int64
        self.b = 18446744073709551615; // max for uint64
    }
}