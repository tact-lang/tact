contract SerializationFormats {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int32;
    d: Int as uint32;

    init() {
        self.a = -128;
        self.b = 255;
        self.c = -2000000000;
        self.d = 4000000000;
    }
}