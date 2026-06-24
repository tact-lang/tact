contract MixedSerializationFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int as uint8;
    d: Int as coins;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
    }
}
