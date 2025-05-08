struct InnerMost {
    a: Int;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    inr: Inner;
}

struct Outer {
    mid: Middle;
}

contract MultiLayer {
    dat: Outer;

    init() {
        self.dat = Outer{ mid: Middle{ inr: Inner{ im: InnerMost{ a: 5 } } } };
    }
}