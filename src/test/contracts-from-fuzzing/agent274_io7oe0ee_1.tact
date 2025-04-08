struct DeepNested {
    nested: NestedLevel;
}

struct NestedLevel {
    level2: NestedLevel2;
}

struct NestedLevel2 {
    x: Int;
    y: Bool;
}

contract TestDeep {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            nested: NestedLevel{
                level2: NestedLevel2{
                    x: 42,
                    y: true,
                },
            },
        };
    }

    receive() {}
}
