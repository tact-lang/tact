// Nested structs with mixture of primitives and optionals, plus optional structs
struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    a: Bool;
    b: Inner?;
}

contract MixedNesting {
    outer: Outer;

    init() {
        self.outer = Outer{
            a: false,
            b: Inner{
                x: 7,
                y: null,
            },
        };
    }
}