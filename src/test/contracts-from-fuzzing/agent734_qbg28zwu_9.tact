contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;

    init() {
        self.a = 10;
        self.b = false;
        self.c = "hello";
        self.d = null;
        self.e = "world";
        self.f = true;
    }
}