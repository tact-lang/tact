struct Nested {
    value: Int;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{ value: 42 };
    }
}