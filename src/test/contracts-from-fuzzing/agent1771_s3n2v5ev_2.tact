struct DeepNested {
    z: Int;
}

struct Nested {
    inner: DeepNested;
}

contract MultiLevelNestedField {
    field: Nested;

    init() {
        self.field = Nested{ inner: DeepNested{ z: 123 } };
    }
}