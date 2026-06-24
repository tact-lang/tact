struct Nested {
    field1: Int;
    field2: Bool;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{field1: 10, field2: true};
    }
}