struct ComplexOptional {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Builder?;
    f: Address?;
}

contract ComplexOptionalTest {
    data: ComplexOptional;

    init() {
        self.data = ComplexOptional{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}