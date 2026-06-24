struct SubNested {
    a: Int;
    b: Bool;
}

struct OuterNested {
    s1: SubNested;
    s2: SubNested;
    s3: SubNested;
}

contract DeepMultiNest {
    outer: OuterNested;

    init() {
        self.outer = OuterNested{
            s1: SubNested{a: 1, b: true},
            s2: SubNested{a: 2, b: false},
            s3: SubNested{a: 3, b: true},
        };
    }
}
