struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    x: S1;
    y: S1?;
}

contract NestedOptionals {
    data: S2;

    init() {
        self.data = S2{
            x: S1{ a: 1, b: null },
            y: null,
        };
    }
}