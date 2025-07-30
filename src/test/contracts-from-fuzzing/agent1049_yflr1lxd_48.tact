contract DefaultOptMix {
    a: Int = 5;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "abc";
    f: String? = null;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = false;
        self.d = true;
        self.e = "def";
        self.f = "ghi";
    }
}