contract IntVariants {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;
    d: Int as int64;
    e: Int as uint128;
    init() {
        self.a=0;self.b=0;self.c=0;self.d=0;self.e=0;
    }
}