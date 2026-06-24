contract OptionalPrimitiveSerializations {
    a: Int? as coins;
    b: Int? as uint8;
    c: Int? as int16;

    init() {
        self.a = ton("1");
        self.b = 255;
        self.c = -100;
    }

    receive() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}