struct Outer {
    inner1: Int;
    inner2: Int?;
}

struct Middle {
    nestedOuter: Outer;
}

contract OptInNestedInner {
    mid: Middle;

    init() {
        self.mid = Middle{ nestedOuter: Outer{ inner1: 1, inner2: null } };
    }
}