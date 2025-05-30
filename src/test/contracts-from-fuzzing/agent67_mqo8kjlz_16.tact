contract TestContract {
    a: Int = 1;
    b: Bool = false;
    c: Int? = null;
    d: Bool? = null;
    e: String = "abc";
    f: String? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.c = 5;
        self.d = false;
        self.e = "def";
        self.f = "ghi";
    }
}