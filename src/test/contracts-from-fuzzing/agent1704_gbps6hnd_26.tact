contract PersistOrder {
    a: Int as uint8;
    b: Int;
    c: Int as int32;
    d: Int as uint64;

    init() {
        self.a = 1;
        self.b = 100;
        self.c = -5;
        self.d = 123456;
    }
}