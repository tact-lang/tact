struct InnerMost {
    a: Int;
}

struct Inner {
    x: InnerMost;
}

struct Middle {
    y: Inner;
}

struct Outer {
    z: Middle;
}

contract ChainFour {
    data: Outer;

    init() {
        self.data = Outer{ z: Middle{ y: Inner{ x: InnerMost{a:1} } } };
    }
}
