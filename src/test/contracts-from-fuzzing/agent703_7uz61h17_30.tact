contract IntAsBits {
    a: Int as uint1;
    b: Int as uint8;
    c: Int as uint16;
    d: Int as uint32;
    e: Int as uint64;

    init() {
        self.a=1; self.b=255; self.c=65535; self.d=4294967295; self.e=18446744073709551615;
    }
}