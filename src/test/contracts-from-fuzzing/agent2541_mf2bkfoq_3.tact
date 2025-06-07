struct Nested {
    inner1: Int;
    inner2: Bool;
}

struct Outer {
    nested1: Nested;
    nested2: Nested;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            nested1: Nested{ inner1: 1, inner2: true },
            nested2: Nested{ inner1: 2, inner2: false }
        };
    }
}