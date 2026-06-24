struct Nested {
    x: Int;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{x: 1};
    }
}