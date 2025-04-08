contract PrimitiveSerializations {
    a: Int as uint64;
    b: Int as int128;
    c: Int as uint4;
    d: Int as int1;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=0;
    }
}