struct InnerD {
    d1: Int?;
    d2: Bool?;
}

struct InnerC {
    c1: String?;
    c2: Slice?;
}

struct InnerB {
    b1: Cell?;
    b2: Bool;
}

struct InnerA {
    a1: Int;
    a2: Address?;
}

struct ComplexNested {
    a: InnerA;
    b: InnerB;
    c: InnerC;
    d: InnerD;
}

contract ComplexNestedFields {
    state: ComplexNested;

    init() {
        self.state = ComplexNested{
            a: InnerA{a1: 1, a2: null},
            b: InnerB{b1: null, b2: true},
            c: InnerC{c1: null, c2: null},
            d: InnerD{d1: null, d2: false}
        };
    }
}