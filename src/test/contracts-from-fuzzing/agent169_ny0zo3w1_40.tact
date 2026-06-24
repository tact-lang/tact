struct TinyLeaf {
    bitVal: Int as uint1;
}

struct Outer {
    nested: TinyLeaf?;
}

contract TinyPersistent {
    f: Outer = Outer{ nested: TinyLeaf{ bitVal: 1 } };

    init() {
        self.f = Outer{ nested: TinyLeaf{ bitVal: 1 } };
    }
}