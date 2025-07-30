contract IntSerializations {
    a: Int as int64;
    b: Int as uint4;
    c: Int as int8;
    d: Int;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4;
    }
}