struct DeepNested {
    x: Int;
    y: Bool?;
    s: String;
}

struct ContainsDeep {
    nested: DeepNested;
    another: String?;
}

contract StorageNest {
    deep: ContainsDeep;

    init() {
        self.deep = ContainsDeep{
            nested: DeepNested{
                x: 42,
                y: null,
                s: "Hi",
            },
            another: "World",
        };
    }
}