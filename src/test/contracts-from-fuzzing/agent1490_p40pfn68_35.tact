contract OrderedFields {
    a: Int;
    b: Int as int16;
    c: Int as uint4;
    d: Int;

    init() {
        self.a = 100;
        self.b = 20;
        self.c = 3;
        self.d = 5;
    }
}