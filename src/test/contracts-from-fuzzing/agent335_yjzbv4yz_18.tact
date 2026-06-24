struct NestedMultiLevel {
    v1: Int;
    sub: NestedOne;
}

struct NestedOne {
    v2: Int;
    subsub: NestedTwo;
}

struct NestedTwo {
    flag: Bool;
}

contract DeepNestedThree {
    store: NestedMultiLevel;

    init() {
        self.store = NestedMultiLevel{
            v1: 1,
            sub: NestedOne{
                v2: 2,
                subsub: NestedTwo{ flag: false },
            },
        };
    }
}