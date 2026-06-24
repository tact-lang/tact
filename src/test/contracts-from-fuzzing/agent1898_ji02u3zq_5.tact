struct OptionalPrims {
    a: Int?;
    b: Bool?;
    c: Address?;
    s: String?;
}

contract OptionalPrimitivesContract {
    stuff: OptionalPrims;

    init() {
        self.stuff = OptionalPrims{
            a: null,
            b: true,
            c: null,
            s: null
        };
    }
}