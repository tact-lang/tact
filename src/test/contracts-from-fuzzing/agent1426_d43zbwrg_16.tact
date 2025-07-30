struct OptionalComplex {
    o1: Int?;
    o2: ComplexInner?;
}

struct ComplexInner {
    a: Int;
    b: Bool;
}

contract OptionalComb {
    data: OptionalComplex;

    init() {
        self.data = OptionalComplex{
            o1: 25,
            o2: null
        };
    }
}