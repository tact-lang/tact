contract ScalarMixups {
    a: Int as uint64;
    b: Int as int32;
    c: Int as coins;

    init() {
        self.a=1; self.b=2; self.c=3;
    }
}