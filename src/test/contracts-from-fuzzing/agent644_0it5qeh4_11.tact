contract Test {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = false;
    f: String? = "def";

    init() {
        self.a = 2;
        self.b = false;
        self.c = "ghi";
        self.d = 3;
        self.e = true;
        self.f = null;
    }
}