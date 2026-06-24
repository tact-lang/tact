contract TestContract {
    a: Int = 1;
    b: Int = 2;
    c: String = "abc";
    d: Bool = true;
    e: Int? = null;
    f: String? = null;
    g: Bool? = false;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = "xyz";
        self.d = false;
        self.e = 123;
        self.f = null;
        self.g = true;
    }
}