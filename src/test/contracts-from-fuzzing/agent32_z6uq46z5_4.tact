struct DeeplyNested {
    level: Int;
    sub: OuterStruct;
}

struct OuterStruct {
    x: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    y: Int;
    flag: Bool?;
}

contract DeepNestingTest {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            level: 1,
            sub: OuterStruct{
                x: 2,
                inner: InnerStruct{
                    y: 3,
                    flag: null,
                },
            },
        };
    }
}
