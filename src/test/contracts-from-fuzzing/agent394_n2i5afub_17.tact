contract TestContract {
    a: Int = 1;
    b: String = "hi";
    c: Bool = false;
    d: Int?;
    e: String?;
    f: Bool?;

    init() {
        self.a = 2;
        self.b = "hello";
        self.c = true;
        self.d = 3;
        self.e = null;
        self.f = false;
    }
}