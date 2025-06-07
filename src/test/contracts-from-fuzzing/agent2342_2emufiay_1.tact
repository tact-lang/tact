struct DeepNested {
    value: Int;
}

struct Nested {
    level: DeepNested;
}

contract NestedStorage {
    nested: Nested;

    init() {
        self.nested = Nested{ level: DeepNested{ value: 5 } };
    }
}