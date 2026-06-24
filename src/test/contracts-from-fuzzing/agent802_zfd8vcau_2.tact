struct Nested {
    val1: Int;
    val2: Int?;
}

struct Outer {
    nested: Nested;
    optNested: Nested?;
}

contract TestNestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Nested{ val1: 1, val2: null },
            optNested: null
        };
    }
}