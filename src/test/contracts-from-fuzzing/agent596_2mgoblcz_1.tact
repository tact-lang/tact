struct Nested {
    value: Int;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ value: 10 };
    }
}