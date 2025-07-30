struct InnerMost {
    value: Int;
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

contract Test8 {
    data: Outer;

    init() {
        self.data = Outer{ mid: Middle{ inr: Inner{ im: InnerMost{ value: 1 } } } };
    }
}