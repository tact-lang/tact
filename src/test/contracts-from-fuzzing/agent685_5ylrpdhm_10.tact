struct InnerMost {
    val: Int;
}

struct Inner {
    innerMost: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract VeryDeepNest {
    data: Outer;

    init() {
        self.data = Outer{ middle: Middle{ inner: Inner{ innerMost: InnerMost{ val: 123 } } } };
    }
}