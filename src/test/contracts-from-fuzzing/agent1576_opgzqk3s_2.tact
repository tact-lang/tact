struct Nested {
    v1: Int;
    v2: Bool?;
    v3: String;
}

struct Outer {
    n: Nested;
    x: Int;
    y: String?;
}

contract DeepNestTest {
    data: Outer;

    init() {
        self.data = Outer{
            n: Nested{
                v1: 7,
                v2: null,
                v3: "world",
            },
            x: 42,
            y: null,
        };
    }
}