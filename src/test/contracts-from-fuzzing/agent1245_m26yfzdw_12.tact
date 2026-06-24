struct S1 {
    a: Int;
}

struct S2 {
    s: S1;
    b: Bool;
}

contract NestedOrdering {
    data: S2;

    init() {
        self.data = S2{
            s: S1{ a: 5 },
            b: true,
        };
    }
}
