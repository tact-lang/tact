struct DeeplyNested {
    level1: Bool;
    level2: NestedOptional;
}

struct NestedOptional {
    inner: Int?;
    data: Bool;
}

contract DeepNestingTest {
    deepField: DeeplyNested;

    init() {
        self.deepField = DeeplyNested {
            level1: true,
            level2: NestedOptional {
                inner: null,
                data: false,
            },
        };
    }
}