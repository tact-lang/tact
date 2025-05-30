contract SerializeMix {
    a: Int as uint4;
    b: Int as uint12;
    c: Int as int4;
    d: Int as int12;
    e: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
    }
}