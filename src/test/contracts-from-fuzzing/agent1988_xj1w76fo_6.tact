struct Inner {
    value: Int;
}

struct Middle {
    maybeInner: Inner?;
}

contract Test {
    nestedOpt: Middle;

    init() {
        self.nestedOpt = Middle{maybeInner: null};
    }
}
