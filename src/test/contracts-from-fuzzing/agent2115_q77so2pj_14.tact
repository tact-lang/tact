// test unusual serialization widths for many persistent fields
contract SerialSizes {
    a: Int as uint1;   // 1 bit
    b: Int as uint4;  // 4 bits
    c: Int as int7;   // 7 bits signed
    d: Int as uint16; // 16 bits
    e: Int as int20;  // 20 bits signed
    f: Int as uint32; // 32 bits
    g: Int as int64;  // 64 bits signed
    h: Int as uint128;// 128 bits
    i: Int as int257; // max size signed

    init() {
        self.a = 1;
        self.b = 7;
        self.c = -3;
        self.d = 256;
        self.e = -12345;
        self.f = 65535;
        self.g = -9999999;
        self.h = 123456789;
        self.i = 9999999999;
    }
}