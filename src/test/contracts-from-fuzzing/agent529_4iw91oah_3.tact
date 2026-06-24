struct Nested {
    inner1: Int;
    inner2: Bool;
}

struct Outer {
    a: Int;
    nested: Nested;
    b: Bool;
}

contract NestedStructs {
    s: Outer;

    init() {
        self.s = Outer{
            a: 5,
            nested: Nested{ inner1: 10, inner2: true },
            b: false
        };
    }
}