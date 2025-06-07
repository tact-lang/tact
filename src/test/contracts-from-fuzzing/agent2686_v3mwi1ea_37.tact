contract SerializeMany {
    a: Int as int8;
    b: Int as uint32;
    c: Int as int64;

    init() {
        self.a = -128;
        self.b = 4294967295;
        self.c = -9223372036854775808;
    }
}
