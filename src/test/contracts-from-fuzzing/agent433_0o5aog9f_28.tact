contract TestContract {
    a: Int = 1;
    b: Bool? = null;
    c: String = "hello";
    d: Int? = null;
    e: Bool = false;
    f: String? = null;

    init() {
        self.a = 2;
        self.b = true;
        self.c = "hi";
        self.d = 42;
        self.e = true;
        self.f = "bye";
    }
}