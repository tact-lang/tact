struct S1 {
    x: Int;
}

struct S2 {
    y: Int?;
}

struct Combined {
    a: S1;
    b: S2;
}

contract NestedOptMix {
    d: Combined;

    init() {
        self.d = Combined{
            a: S1{ x: 1 },
            b: S2{ y: null }
        };
    }
}