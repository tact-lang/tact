struct Nested {
    level1: Int;
    optLevel: Int?;
}

contract TestContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{ level1: 1, optLevel: null };
    }
}