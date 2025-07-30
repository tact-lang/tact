contract SerializableFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int as int8;
    d: Int as uint4;

    init() {
        self.a = -100;
        self.b = 100;
        self.c = -5;
        self.d = 5;
    }
}