contract TestContract {
    a: Int;
    b: String;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: String;

    init() {
        self.a = 42;
        self.b = "abc";
        self.c = true;
        self.d = null;
        self.e = null;
        self.f = "xyz";
    }
}