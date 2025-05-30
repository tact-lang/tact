contract SerializationSpec {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint4;
    d: Int;

    init() {
        self.a = 255;
        self.b = -1000;
        self.c = 15;
        self.d = 123456;
    }
}