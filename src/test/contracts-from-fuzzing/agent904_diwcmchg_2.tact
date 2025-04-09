struct Nested {
    value: Int;
    flag: Bool;
}

contract TestContract {
    nested: Nested;

    init() {
        self.nested = Nested{ value: 123, flag: true };
    }
}