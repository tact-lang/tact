struct DeeplyNested {
    level1: Int;
    level2: NestedStruct;
}

struct NestedStruct {
    a: Int;
    b: Bool;
}

contract DeepNestingTest {
    deep: DeeplyNested;

    init() {
        self.deep = DeeplyNested{
            level1: 123,
            level2: NestedStruct{ a: 42, b: false }
        };
    }
}