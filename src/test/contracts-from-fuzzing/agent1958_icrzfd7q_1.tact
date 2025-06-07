struct Nested {
    field: Int;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{field: 1};
    }
}
