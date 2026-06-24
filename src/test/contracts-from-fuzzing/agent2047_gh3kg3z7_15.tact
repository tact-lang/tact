contract IntSerializedVariations {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;

    init() {
        self.a = 250;
        self.b = -1000;
        self.c = 500000000;
    }
}