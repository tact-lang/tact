// Test explicit size serialization across many fields
contract Test {
    i1: Int as int8;
    i2: Int as int16;
    i3: Int as int32;
    i4: Int as int64;
    u1: Int as uint8;
    u2: Int as uint16;
    u3: Int as uint32;
    u4: Int as uint64;
    c: Int as coins;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.u1 = 5;
        self.u2 = 6;
        self.u3 = 7;
        self.u4 = 8;
        self.c = 9;
    }
}