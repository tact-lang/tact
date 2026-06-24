struct Nested {
    a: Int;
    b: Bool?;
}

struct NestedMore {
    n1: Nested;
    n2: Nested;
}

struct TopLevel {
    nest: NestedMore;
    c: Int?;
    d: Bool;
}

contract NestedManyOptionals {
    s: TopLevel;

    init() {
        self.s = TopLevel{
            nest: NestedMore{
                n1: Nested{ a: 7, b: null },
                n2: Nested{ a: 8, b: true }
            },
            c: null,
            d: true,
        };
    }
}