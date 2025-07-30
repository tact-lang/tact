contract OrderOptional {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Bool?;
    f: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = "D";
        self.e = false;
        self.f = null;
    }
}