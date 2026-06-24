// Persistent variables with explicit serialization formats
contract TestContract {
    a: Int as int64;   // signed 64-bit
    b: Int as uint8;  // unsigned 8-bit
    c: Int as uint256;
    d: Int as coins;

    init() {
        self.a = -123456789;
        self.b = 255;
        self.c = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        self.d = ton("10");
    }
}
