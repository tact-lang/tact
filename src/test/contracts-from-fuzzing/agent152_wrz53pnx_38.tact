contract IntSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;

    init() {
        self.a=10; self.b=20; self.c=30; self.d=40; self.e=50;
    }
}