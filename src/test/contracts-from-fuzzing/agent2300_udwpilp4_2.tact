struct DeeplyNested {
    nested: Nested;
}

struct Nested {
    value: Int;
}

contract TestContract {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{ nested: Nested{ value: 1 } };
    }
}