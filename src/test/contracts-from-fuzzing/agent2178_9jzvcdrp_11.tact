struct Inner {
    a: Int;
    b: Bool;
}

contract ScalarAndNestedMix {
    a: Int;
    b: Bool;
    c: Int?;
    d: String;
    e: Inner;
    f: Inner?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = "test";
        self.e = Inner{ a: 7, b: false };
        self.f = null;
    }
}