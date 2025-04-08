struct InnerMost {
    val: Int;
}

struct Inner {
    innermost: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract DeepNesting4Levels {
    data: Outer;

    init() {
        self.data = Outer{ middle: Middle{ inner: Inner{ innermost: InnerMost{ val: 999 }}}};
    }
}