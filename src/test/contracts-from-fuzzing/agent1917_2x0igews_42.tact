contract OptSerialDefaults {
    a: Int? as uint8;
    b: Int? as uint16;
    c: Int? as uint32;
    d: Int = 5;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
