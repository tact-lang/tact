struct NestedOptional {
    a: Int?;
    b: Bool?;
}

struct Outer {
    inner1: NestedOptional;
    inner2: NestedOptional;
}

contract Test {
    s: Outer;

    init() {
        self.s = Outer{
            inner1: NestedOptional{ a: null, b: true },
            inner2: NestedOptional{ a: 10, b: null },
        };
    }
}
