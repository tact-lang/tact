contract StorageEdgeCase {
    a: Int as uint8 = 0;
    b: Int as uint16 = 1;
    c: Int as uint32 = 2;
    d: Int as uint64 = 3;
    e: Int as uint128 = 4;

    init() {
        self.a = 255;
        self.b = 65535;
        self.c = 4294967295;
        self.d = 18446744073709551615;
        self.e = 340282366920938463463374607431768211455;
    }
}