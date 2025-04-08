contract IntSerializationFormats {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint32;

    init() {
        self.a = 255;
        self.b = -32768;
        self.c = 4294967295;
    }
}