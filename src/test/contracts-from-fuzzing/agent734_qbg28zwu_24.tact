contract TestContract {
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
        self.d = true;
        self.e = "abc";
        self.f = null;
    }
}