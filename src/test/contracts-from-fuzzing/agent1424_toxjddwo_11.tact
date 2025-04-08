contract MultiTypes {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = false;
        self.d = null;
        self.e = "test";
        self.f = null;
    }
}