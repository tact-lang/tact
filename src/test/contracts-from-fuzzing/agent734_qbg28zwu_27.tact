contract TestContract {
    a: Int = 42;
    b: Int = 100;
    c: Int? = null;
    d: Bool = true;
    e: Bool? = null;
    f: String = "foo";
    g: String? = null;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = false;
        self.e = true;
        self.f = "bar";
        self.g = "baz";
    }
}