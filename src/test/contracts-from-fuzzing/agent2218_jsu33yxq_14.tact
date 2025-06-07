struct BigNested {
    nested1: NestedOne;
    nested2: NestedTwo;
}

struct NestedOne {
    n: Int;
    sub: SubNested;
}

struct NestedTwo {
    t: String;
    flag: Bool;
}

struct SubNested {
    value: Int;
}

contract Test {
    data: BigNested;
    init() {
        self.data = BigNested{
            nested1: NestedOne{n: 5, sub: SubNested{value: 10}},
            nested2: NestedTwo{t: "nested", flag: true}
        };
    }
}