struct InnerMost {
    a: Int;
}

struct MidLevel {
    mid: InnerMost;
}

struct TopLevel {
    top: MidLevel;
}

contract NestedInDepth {
    store: TopLevel?;

    init() {
        self.store = null;
    }
}