struct InnerMost {
    s: String;
    flag: Bool?;
}

struct Middle {
    value: Int;
    optInner: InnerMost?;
}

contract DeepNesting {
    nested: Middle;

    init() {
        self.nested = Middle{ value: 5, optInner: null };
    }
}