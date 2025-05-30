contract OnlySerialized {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
    }
}