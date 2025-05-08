// Persistent fields using various integer serialization formats
contract TestContract {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int64;
    d: Int as uint64;
    e: Int as uint256;

    init() {
        self.a = 1;
        self.b = -123;
        self.c = 100000000;
        self.d = 123456789;
        self.e = 1234567890123456789;
    }
}