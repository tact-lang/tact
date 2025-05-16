struct Nested {
    field1: Int;
    field2: Bool;
}

contract Test {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{field1: 1, field2: true};
    }
}
