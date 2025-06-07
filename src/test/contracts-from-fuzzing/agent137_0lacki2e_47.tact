struct MultiNested {
    n1: NestedA;
    n2: NestedB;
}
struct NestedA {
    x: Int;
    y: NestedC;
}
struct NestedB {
    a: Bool;
    b: String;
}
struct NestedC {
    s: String;
    f: Bool;
}

contract TestMultiNested {
    v: MultiNested;
    init() {
        self.v = MultiNested{
            n1: NestedA{ x: 1, y: NestedC{ s: "s", f:true } },
            n2: NestedB{ a: false, b: "b" }
        };
    }
}