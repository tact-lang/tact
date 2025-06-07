struct Nested {
    level: Int;
    deeper: Nested2;
}

struct Nested2 {
    value: Int;
    maybe: Int?;
}

contract Test {
    data: Nested;
    init() {
        self.data = Nested{
            level: 1,
            deeper: Nested2{ value: 42, maybe: null }
        };
    }
}