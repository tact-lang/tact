struct ComplexA {
    x: Int;
    y: Bool;
}

struct ComplexB {
    a: ComplexA;
    b: ComplexA;
    c: ComplexA;
    d: Int?;
}

contract MultiNest {
    data: ComplexB;

    init() {
        self.data = ComplexB{
            a: ComplexA{ x: 1, y: true },
            b: ComplexA{ x: 2, y: false },
            c: ComplexA{ x: 3, y: true },
            d: null
        };
    }
}
