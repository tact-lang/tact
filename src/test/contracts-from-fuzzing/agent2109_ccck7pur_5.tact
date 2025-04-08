struct InnerMost {
    x: Int;
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

contract Layered {
    nested: Outer;

    init() {
        self.nested = Outer{ m: Middle{ i: Inner{ im: InnerMost{ x: 42 } } } };
    }
}