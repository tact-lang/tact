contract IntAllKinds {
    a: Int = -1;            // signed default
    b: Int as uint8 = 255; // serialized unsigned
    c: Int as int64 = -64; // smaller signed
    d: Int as uint4 = 9;   // tiny unsigned

    init() {
        self.a = 2;
        self.b = 200;
        self.c = 999999999;
        self.d = 3;
    }
}