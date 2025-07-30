contract SerializeAnnotations {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint8;
    d: Int;

    init() {
        self.a = 100;
        self.b = 100;
        self.c = 100;
        self.d = 100;
    }
}