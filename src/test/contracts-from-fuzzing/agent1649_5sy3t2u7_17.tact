struct InnerMost {
    value: Int;
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

contract VeryDeep {
    store: Outer;

    init() {
        self.store = Outer{ middle: Middle{ inner: Inner{ innerMost: InnerMost{ value:7 }}}};
    }
}