contract ConflictingSerializations {
    a: Int as uint8;
    b: Int as uint16;
    c: Int;

    init() {
        self.a = 0;
        self.b = 0;
        self.c = 0;
    }
}
