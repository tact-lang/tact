struct SubLevel {
    deeperValue: Int;
    deepOptional: Bool?;
}

struct NestedLevel {
    id: Int;
    sub: SubLevel;
}

contract DeepNest {
    field: NestedLevel;

    init() {
        self.field = NestedLevel{
            id: 1,
            sub: SubLevel{
                deeperValue: 100,
                deepOptional: null,
            },
        };
    }
}
