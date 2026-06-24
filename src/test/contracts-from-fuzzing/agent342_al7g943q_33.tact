contract IntSerializationEdges {
    a: Int as uint1;   // 1-bit unsigned
    b: Int as uint256; // max unsigned
    c: Int as int1;    // 1-bit signed
    d: Int as int257;  // max signed

    init() {
        self.a = 1;
        self.b = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        self.c = 1;
        self.d = -1;
    }
}
