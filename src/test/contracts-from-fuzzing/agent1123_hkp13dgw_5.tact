struct Mid {
    a: Int;
    b: Bool?;
    s: String;
}

struct Outer {
    inner1: Mid;
    inner2: Mid;
    optInner: Mid?;
}

contract NestedOptional {
    composite: Outer;

    init() {
        self.composite = Outer{
            inner1: Mid{a: 1, b: true, s: "one"},
            inner2: Mid{a: 2, b: null, s: "two"},
            optInner: null,
        };
    }
}