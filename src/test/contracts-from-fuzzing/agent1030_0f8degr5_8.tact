struct DeepOptional {
    level1: Int?;
    level2: Bool?;
    level3: Cell?;
    level4: Slice?;
    level5: String?;
}

struct Middle {
    nestedOpt: DeepOptional;
}

contract NestedOptionalsTest {
    nested: Middle;

    init() {
        self.nested = Middle{
            nestedOpt: DeepOptional{
                level1: null,
                level2: null,
                level3: null,
                level4: null,
                level5: "hi",
            },
        };
    }
}