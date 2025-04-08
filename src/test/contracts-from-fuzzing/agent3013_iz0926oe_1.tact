struct DeepNested {
    level1: String;
    level2: Bool?;
    level3: String;
}

struct MidLevel {
    nested: DeepNested;
    info: String;
}

struct TopLevel {
    mid: MidLevel;
    description: String;
}

contract DeepNestTest {
    data: TopLevel;

    init() {
        self.data = TopLevel{
            mid: MidLevel{
                nested: DeepNested{
                    level1: "l1",
                    level2: null,
                    level3: "l3"
                },
                info: "info"
            },
            description: "desc"
        };
    }
}
