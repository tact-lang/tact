struct ComplexMix {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String;
}

contract MultiOptionalMix {
    cm: ComplexMix;

    init() {
        self.cm = ComplexMix{
            a: 1,
            b: false,
            c: null,
            d: null,
            e: null,
            f: "x"
        };
    }
}