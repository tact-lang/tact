// Test many primitive persistent variables with explicit serialization
contract SerializeFields {
    a: Int as int64;
    b: Int as uint4;
    c: Int as int8;
    d: Int as uint16;
    e: Int as uint256;

    init() {
        self.a = -1;
        self.b = 5;
        self.c = -5;
        self.d = 12345;
        self.e = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;
    }
}