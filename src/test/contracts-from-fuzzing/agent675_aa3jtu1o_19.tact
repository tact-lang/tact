contract DifferentIntSerializations {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int16;
    e: Int as uint32;
    f: Int as int32;
    g: Int as uint64;
    h: Int as int64;

    init() {
        self.a = 255;
        self.b = -128;
        self.c = 65535;
        self.d = -32768;
        self.e = 4294967295;
        self.f = -2147483648;
        self.g = 18446744073709551615;
        self.h = -9223372036854775808;
    }

    receive() {
        let _ = self.h;
    }
}