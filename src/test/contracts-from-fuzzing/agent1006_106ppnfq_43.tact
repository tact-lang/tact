contract DifferentSizes {
    a: Int;
    b: Int as int64;
    c: Int as uint8;
    d: Int as uint4;

    init() {
        self.a=1000;
        self.b=200;
        self.c=12;
        self.d=7;
    }
}
