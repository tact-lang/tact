contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = true;
    e: Int? = null;
    f: Int = 42;

    init() {
        self.a = 10;
        self.b = true;
        self.c = 20;
        self.d = null;
        self.e = 30;
        self.f = 50;
    }
}