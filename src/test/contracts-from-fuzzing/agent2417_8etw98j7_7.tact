contract OrderedFields {
    a: Int as uint8;
    b: Int;
    c: Int as int16;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
    }
}
