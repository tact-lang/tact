struct DeepNested {
    level3: Int?;
}

struct MiddleNested {
    level2: DeepNested;
    val: Bool;
}

struct TopStruct {
    level1: MiddleNested;
    description: String;
}

contract NestedStorage {
    info: TopStruct;

    init() {
        self.info = TopStruct{
            level1: MiddleNested{
                level2: DeepNested{
                    level3: null,
                },
                val: true,
            },
            description: "Test",
        };
    }

    receive() {}
}