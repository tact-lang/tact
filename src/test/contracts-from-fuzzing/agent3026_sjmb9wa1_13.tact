struct InnerA { val: Int; }
struct InnerB { flag: Bool; }
struct Complex {
    a: InnerA;
    b: InnerB;
    maybeInt: Int?;
    maybeStr: String?;
}

contract NestedOptionalMixed {
    data: Complex;

    init() {
        self.data = Complex{
            a: InnerA{val: 7},
            b: InnerB{flag: true},
            maybeInt: null,
            maybeStr: null
        };
    }
}