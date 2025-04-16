struct Nested {
    value: Int;
}

contract TestContract {
    nested: Nested;
    num: Int;

    init() {
        self.nested = Nested{ value: 1 };
        self.num = 42;
    }
}