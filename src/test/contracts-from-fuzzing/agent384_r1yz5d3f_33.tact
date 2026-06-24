contract MixedSerialization {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint64;
    d: Int as coins;

    init() {
        self.a=1; self.b=2; self.c=3; self.d=4;
    }
}