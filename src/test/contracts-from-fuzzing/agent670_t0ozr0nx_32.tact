// intentionally create a contract with many diverse serialization sizes
contract SerializationSizes {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as uint64;
    d: Int as int256;
    e: Int;
    f: Int as int1;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = -1;
    }
}