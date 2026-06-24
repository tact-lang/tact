struct DeepNested {
    level1: Int;
    level2: InnerLevel;
}

struct InnerLevel {
    flag: Bool;
    level3: Deepest;
}

struct Deepest {
    message: String;
    opt: Int?;
}

contract TestContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            level1: 1,
            level2: InnerLevel{
                flag: true,
                level3: Deepest{
                    message: "hi",
                    opt: null,
                },
            },
        };
    }
}