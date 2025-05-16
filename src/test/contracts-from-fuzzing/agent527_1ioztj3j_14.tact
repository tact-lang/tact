struct Immersive {
    s1: String;
    s2: String;
    i1: Int;
    b1: Bool;
    nested: Nested;
}

struct Nested {
    s: String;
    i: Int;
    b: Bool;
    optInt: Int?;
}

contract MixedDeep {
    field: Immersive;
    init() {
        self.field = Immersive{
            s1: "outer1",
            s2: "outer2",
            i1: 123,
            b1: true,
            nested: Nested{
                s: "inner",
                i: 456,
                b: false,
                optInt: null,
            },
        };
    }
}