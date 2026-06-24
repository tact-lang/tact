struct ComplexOptionalInner {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct ComplexOuter {
    x: Int;
    y: Bool;
    z: ComplexOptionalInner;
}

contract NestedComplexOptional {
    f: ComplexOuter;

    init() {
        self.f = ComplexOuter{
            x: 5,
            y: true,
            z: ComplexOptionalInner{
                a: null,
                b: null,
                c: null
            }
        };
    }
}