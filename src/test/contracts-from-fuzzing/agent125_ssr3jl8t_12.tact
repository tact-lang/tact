contract FieldsWithSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint1;
    e: Int as int257;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = -5;
        self.d = 1;
        self.e = -100;
    }
}