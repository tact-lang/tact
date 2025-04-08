struct NestedComplex {
    a: Int?;
    b: Bool;
}

struct ComplexOuter {
    x: NestedComplex;
    y: NestedComplex?;
}

contract DoubleNestedComplex {
    c: ComplexOuter;

    init() {
        self.c = ComplexOuter{
            x: NestedComplex{a: null,b:true},
            y: null
        };
    }
}
