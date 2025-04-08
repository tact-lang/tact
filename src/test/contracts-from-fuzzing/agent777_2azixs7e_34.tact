contract OptUint {
    a: Int? as uint8;
    b: Int? as uint16;
    c: Int? as uint32;

    init() {
        self.a = 200;
        self.b = null;
        self.c = 123456;
    }
}