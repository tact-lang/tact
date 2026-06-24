contract SerializationFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int;

    init() {
        self.a = 12;
        self.b = -123;
        self.c = 1000;
    }
}