struct OptionalComplex {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;
    s: String?;
    sl: Slice?;
}

contract OptionalCompositeTest {
    data: OptionalComplex;

    init() {
        self.data = OptionalComplex{
            i: null,
            b: null,
            a: null,
            c: null,
            s: null,
            sl: null,
        };
    }
}
