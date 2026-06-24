struct InnerMost {
    value: Int;
}

struct Inner {
    im: InnerMost;
}

struct Outer {
    inr: Inner;
}

contract DeepNest {
    store: Outer;

    init() {
        self.store = Outer{ inr: Inner{ im: InnerMost{ value: 77 } } };
    }
}
