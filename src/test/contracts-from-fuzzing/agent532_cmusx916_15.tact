contract MultiFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool;
    e: String;
    f: Bool?;
    g: String?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = null;
        self.d = true;
        self.e = "hi";
        self.f = null;
        self.g = null;
    }
}