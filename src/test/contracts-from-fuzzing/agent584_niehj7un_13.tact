contract SerializeIntSizes {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;

    init() {
        self.a = 10;
        self.b = -5;
        self.c = 500;
        self.d = -1000000;
    }
}