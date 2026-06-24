contract Test12 {
    a: Int = 10;
    b: Bool = false;
    c: String = "x";
    d: Int? = null;
    e: Bool? = true;
    f: String? = null;

    init() {
        self.a = 15;
        self.b = true;
        self.c = "changed";
        self.d = 123;
    }
}