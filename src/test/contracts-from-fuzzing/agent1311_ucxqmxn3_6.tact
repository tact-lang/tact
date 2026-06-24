contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Int? = null;
    d: Bool? = false;
    e: String = "hello";
    f: String? = null;

    init() {
        self.a = 111;
        self.b = false;
        self.c = 222;
        self.d = true;
        self.e = "world";
        self.f = "test";
    }
}
