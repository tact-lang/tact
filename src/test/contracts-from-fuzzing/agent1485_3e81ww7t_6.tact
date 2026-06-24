struct InnerMost {
    z: Int;
}

struct Inner {
    x: Int;
    y: InnerMost;
}

contract NestedOpt {
    optNested: Inner?;

    init() {
        self.optNested = null;
    }
}