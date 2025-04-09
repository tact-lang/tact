contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = false;
    f: String? = null;

    init() {
        self.a = 2;
        self.b = false;
        self.c = "bye";
        self.d = 3;
        self.e = true;
        self.f = "end";
    }
}