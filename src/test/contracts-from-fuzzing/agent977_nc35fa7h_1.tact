struct DeepNest {
    level1: Int;
    level2: Int?;
    level3: Int;
}

struct MidNest {
    inner: DeepNest;
    midVal: Int;
}

contract Test {
    nested: MidNest;
    init() {
        self.nested = MidNest{
            inner: DeepNest{
                level1: 11,
                level2: null,
                level3: 33
            },
            midVal: 42
        };
    }
}