struct Nested {
    foo: Int;
    bar: Bool?;
}

struct Outer {
    a: Nested;
    b: Int?;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            a: Nested{ foo: 1, bar: null },
            b: null
        };
    }
}