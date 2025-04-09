struct DeepNested {
    level1: Int;
    level2: InnerLevel2;
}

struct InnerLevel2 {
    a: Bool;
    level3: InnerLevel3;
}

struct InnerLevel3 {
    x: Int?;
    y: Bool?;
}

contract DeepNestedTest {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            level1: 42,
            level2: InnerLevel2{
                a: true,
                level3: InnerLevel3{
                    x: null,
                    y: false,
                },
            },
        };
    }
}