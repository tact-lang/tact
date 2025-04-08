contract TestContract {
    a: Bool = true;
    b: String = "abc";
    c: Int = 10;
    d: String? = null;
    e: Bool? = null;
    f: Int? = null;

    init() {
        self.a = false;
        self.b = "z";
        self.c = 42;
        self.d = "hey";
        self.e = true;
        self.f = -1;
    }
}
