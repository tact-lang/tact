contract IntSerializations {
    a: Int as int1;
    b: Int as int8;
    c: Int as int64;
    d: Int as uint1;
    e: Int as uint8;
    f: Int as uint64;

    init() {
        self.a = 0; self.b=1; self.c=2;
        self.d=3; self.e=4; self.f=5;
    }
}