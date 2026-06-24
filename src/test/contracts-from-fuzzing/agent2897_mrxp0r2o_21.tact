struct InnerMost {
    i: Int;
}

struct Middle {
    mid: InnerMost;
}

struct Outer {
    out: Middle;
}

struct Root {
    root: Outer;
}

contract MultiLevelStructStorage {
    nested: Root;
    init() {
        self.nested = Root{root: Outer{out: Middle{mid: InnerMost{i: 99}}}};
    }
}