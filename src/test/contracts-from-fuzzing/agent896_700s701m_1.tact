struct Nested {
    a: Int;
    b: Bool?;
}

contract Test {
    data: Nested;
    init() {
        self.data = Nested{a: 1, b: true};
    }
}