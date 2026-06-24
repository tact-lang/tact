struct OuterMost {
    inner1: Int;
    inner2: String;
}

struct TopMost {
    field: OuterMost;
    other: Int;
}

contract NestedStructs2 {
    nested: TopMost;
    init() {
        self.nested = TopMost{
            field: OuterMost{
                inner1: 5,
                inner2: "hi"
            },
            other: 6
        };
    }
}