struct InnerInt {
    x: Int;
}

struct InnerBool {
    b: Bool;
}

struct ComplexNest {
    intp: InnerInt?;
    boolp: InnerBool?;
}

contract TestComplexNest {
    nest: ComplexNest;

    init() {
        self.nest = ComplexNest{
            intp: InnerInt{ x: 5 },
            boolp: null
        };
    }
}