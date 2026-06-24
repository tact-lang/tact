contract InterleavedOptionals {
    a: Int?;
    b: Int;
    c: Bool?;
    d: Bool;
    e: String?;
    f: String;

    init() {
        self.a = null;
        self.b = 5;
        self.c = null;
        self.d = false;
        self.e = null;
        self.f = "hello";
    }
}