contract TestContract {
    i: Int = 123;
    b: Bool = true;
    s: String = "hi";
    o: Int? = null;
    ob: Bool? = null;
    os: String? = null;

    init() {
        self.i = -5;
        self.b = false;
        self.s = "bye";
        self.o = 42;
        self.ob = true;
        self.os = "zzz";
    }
}