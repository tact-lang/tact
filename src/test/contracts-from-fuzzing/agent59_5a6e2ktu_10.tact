contract Test {
    a: Int as int64;
    b: Int as uint4;
    c: Bool;
    d: Bool;
    s: String;
    sopt: String?;
    iopt: Int?;

    init() {
        self.a = 123;
        self.b = 9;
        self.c = true;
        self.d = false;
        self.s = "xyz";
        self.sopt = null;
        self.iopt = null;
    }
}