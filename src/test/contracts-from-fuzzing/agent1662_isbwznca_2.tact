struct Nested {
    inner1: Int;
    inner2: Bool?;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{ inner1: 42, inner2: null };
    }
}