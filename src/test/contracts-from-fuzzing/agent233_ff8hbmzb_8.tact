contract SerializedInts {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int as uint256;
    h: Int; // default int257

    init() {
        self.a = 5;
        self.b = -5;
        self.c = 65535;
        self.d = -123456;
        self.e = 123456789;
        self.f = -123456789000;
        self.g = 123456789123456789123456789;
        self.h = -1;
    }

    receive() {
        let _ = self.e;
    }
}