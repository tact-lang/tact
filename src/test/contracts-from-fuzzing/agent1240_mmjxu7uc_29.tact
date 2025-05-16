contract EdgeInts {
    a: Int as int8;      // -128 to 127
    b: Int as uint8;     // 0 to 255
    c: Int as int16;     // -32768 to 32767
    d: Int as uint16;    // 0 to 65535
    e: Int as int64;
    f: Int as uint64;

    init() {
        self.a = -128;
        self.b = 255;
        self.c = 32767;
        self.d = 0;
        self.e = -922337203685477580;
        self.f = 1844674407370955161;
    }
}
