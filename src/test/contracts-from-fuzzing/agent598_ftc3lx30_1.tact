struct InnerMost {
    val: Int;
}

struct DeepNested {
    level1: InnerMost;
    maybeInner: InnerMost?;
}

contract TestDeep {
    deep: DeepNested;
    optionalDeep: DeepNested?;

    init() {
        self.deep = DeepNested{
            level1: InnerMost{val: 1},
            maybeInner: null,
        };
        self.optionalDeep = null;
    }
}
