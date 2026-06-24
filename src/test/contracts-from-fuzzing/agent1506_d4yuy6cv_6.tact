struct Nested {
    value: Int;
}

struct Outer {
    nested1: Nested;
    nested2: Nested;
    nested3: Nested;
}

contract Test {
    st: Outer;

    init() {
        self.st = Outer{
            nested1: Nested{ value: 1 },
            nested2: Nested{ value: 2 },
            nested3: Nested{ value: 3 }
        };
    }
}
// Nested struct repeated 3 times in contract storage