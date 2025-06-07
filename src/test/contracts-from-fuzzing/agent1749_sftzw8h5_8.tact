struct S1 {
    x: Int;
    y: Bool;
}

struct S2 {
    a: S1;
    b: S1;
}

contract NestedSameStructs {
    field: S2;

    init() {
        self.field = S2{
            a: S1{ x: 1, y: true },
            b: S1{ x: 2, y: false },
        };
    }
}