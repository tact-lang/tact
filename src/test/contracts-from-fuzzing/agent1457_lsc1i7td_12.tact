// complicated arrangement
struct NestedOne {
    a: Int;
    b: Bool?;
}

struct NestedTwo {
    c: Int?;
    d: String;
}

struct TopMost {
    x: NestedOne;
    y: NestedTwo;
    z: Bool;
}

contract ComplexNest {
    big: TopMost;

    init() {
        self.big = TopMost{
            x: NestedOne{a: 1, b: null},
            y: NestedTwo{c: null, d: "d"},
            z: true,
        };
    }
}
