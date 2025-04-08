struct ComplexOptional {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;
    e: Builder?;
    f: Address?;
    g: String?;
}

contract OptionalDiversity {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null,
            g: null,
        };
    }
}