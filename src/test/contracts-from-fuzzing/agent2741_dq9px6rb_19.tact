struct InnerMost {
    a: Int;
}

struct Inner {
    im: InnerMost;
}

contract ChainNest {
    a: Inner;
    b: Inner;
    c: Inner;
    d: Inner;

    init() {
        self.a = Inner{ im: InnerMost{ a:1 } };
        self.b = Inner{ im: InnerMost{ a:2 } };
        self.c = Inner{ im: InnerMost{ a:3 } };
        self.d = Inner{ im: InnerMost{ a:4 } };
    }
}