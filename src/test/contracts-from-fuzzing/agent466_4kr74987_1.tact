struct Nested {
    innerOptional: Int?;
    another: Bool;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ innerOptional: null, another: true };
    }
}