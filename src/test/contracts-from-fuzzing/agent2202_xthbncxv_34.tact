contract FieldSerialization {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int257;
    d: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}