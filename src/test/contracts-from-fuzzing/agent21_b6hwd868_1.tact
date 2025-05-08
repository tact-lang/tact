struct Nested {
    foo: Int;
    optionalBar: Int?;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ foo: 1, optionalBar: null };
    }
}