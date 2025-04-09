struct NestedWithOptional {
    x: Int;
    y: Bool?;
}

struct Outer {
    nestedA: NestedWithOptional;
    nestedB: NestedWithOptional?;
}

contract OptionalNestedFields {
    outer: Outer;

    init() {
        self.outer = Outer{
            nestedA: NestedWithOptional{ x: 5, y: null },
            nestedB: null
        };
    }
}