contract TestOrdering {
    a: Int as uint32;
    b: Int as int64;
    c: Int as uint1;
    d: Int;
    e: Bool;
    s: String;

    init() {
        self.a = 100;
        self.b = -123456;
        self.c = 1;
        self.d = 5;
        self.e = true;
        self.s = "str";
    }
}