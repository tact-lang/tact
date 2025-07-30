contract SerialOrdering {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Int as uint128;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4;
    }
}