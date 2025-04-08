contract OptionalSerials {
    a: Int? as uint8;
    b: Int? as int16;
    c: Int? as uint32;

    init() {
        self.a = 10;
        self.b = -20;
        self.c = 30;
    }
}