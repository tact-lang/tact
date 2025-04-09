struct InnerMost {
    z: Int = 999;
    optFlag: Bool?;
}

struct Inner {
    imm: InnerMost;
    optInner: InnerMost?;
}

contract DeepNestStorage {
    nested: Inner;

    init() {
        self.nested = Inner{
            imm: InnerMost{ z: 42, optFlag: true },
            optInner: null
        };
    }
}