struct DeeplyNested {
    nested: Inner;
}

struct Inner {
    nested2: InnerMost;
}

struct InnerMost {
    flag: Bool;
    count: Int;
}

contract DeepNestingTest {
    storage: DeeplyNested;

    init() {
        self.storage = DeeplyNested{
            nested: Inner{
                nested2: InnerMost{
                    flag: true,
                    count: 5,
                }
            }
        };
    }
}