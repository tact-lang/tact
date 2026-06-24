struct Nested {
    flag: Bool;
    val: Int?;
}

struct Outer {
    id: Int;
    nested: Nested;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            id: 42,
            nested: Nested{ flag: false, val: null }
        };
    }
}
