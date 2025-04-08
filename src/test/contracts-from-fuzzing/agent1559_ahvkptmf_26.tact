struct DeeplyNested {
    v1: Int;
    v2: Int?;
    nested: Inner;
}

struct Inner {
    opt: InnerInner?;
}

struct InnerInner {
    a: Int;
    b: Bool;
}

contract DeepNesting {
    root: DeeplyNested;
    init() {
        self.root = DeeplyNested {
            v1: 5,
            v2: null,
            nested: Inner{ opt: null }
        };
    }
}