struct InnerMost {
    val: Int;
}

struct Middle {
    nested: InnerMost;
}

struct Outer {
    m: Middle;
}

contract ComplexDeep {
    top: Outer;

    init() {
        self.top = Outer{ m: Middle{ nested: InnerMost{ val: 999 } } };
    }
}