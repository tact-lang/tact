struct InnerMost {
    v: Int;
}

struct Inner {
    im: InnerMost;
}

struct Middle {
    i: Inner;
}

struct Outer {
    m: Middle;
}

contract DeepNest {
    data: Outer;
    init() {
        self.data = Outer{ m: Middle{ i: Inner{ im: InnerMost{v: 42} } } };
    }
}