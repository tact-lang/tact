contract SerializeSizes {
    a: Int as int8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int257;
    e: Int as uint1;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 1;
    }
}