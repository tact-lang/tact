contract ManyFieldsWithSerialization {
    a: Int as uint8;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int64;
    e: Int;
    f: Bool;

    init() {
        self.a = 1;
        self.b = -1;
        self.c = 100;
        self.d = 100000;
        self.e = -123;
        self.f = true;
    }
}