struct NestedComplex {
    a: Int?;
    b: Bool;
    c: InnerNested;
}

struct InnerNested {
    d: String?;
    e: Address;
    f: InnerMost;
}

struct InnerMost {
    g: Int?;
    h: Bool?;
}

contract ComplexDeep {
    data: NestedComplex;

    init() {
        self.data = NestedComplex{
            a: null,
            b: true,
            c: InnerNested{
                d: null,
                e: myAddress(),
                f: InnerMost{
                    g: null,
                    h: null,
                },
            },
        };
    }
}