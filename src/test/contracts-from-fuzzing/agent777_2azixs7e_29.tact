contract SerializeSizes {
    a: Int as uint8;
    b: Int as int16;
    c: Bool;
    d: Int? as uint32;

    init() {
        self.a = 255;
        self.b = -30000;
        self.c = true;
        self.d = null;
    }
}