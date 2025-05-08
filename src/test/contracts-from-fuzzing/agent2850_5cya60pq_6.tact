struct InnerMost {
    x: Int;
}

struct Inner {
    x: InnerMost;
}

struct Middle {
    x: Inner;
}

struct Outer {
    x: Middle;
}

contract VeryDeepNested {
    data: Outer;

    init() {
        self.data = Outer{ x: Middle{ x: Inner{ x: InnerMost{ x: 42 } } } };
    }
}