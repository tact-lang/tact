struct Nested {
    a: Int;
    b: Bool;
}

struct Outer {
    nested: Nested;
    v: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{
                a: 1,
                b: false,
            },
            v: "hi",
        };
    }
}