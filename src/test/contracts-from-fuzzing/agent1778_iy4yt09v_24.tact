contract IntTypes {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint64;
    e: Int as int128;
    f: Int as int256;

    init() {
        self.a=5; self.b=5; self.c=-10; self.d=10; self.e=-20; self.f=-30;
    }
}