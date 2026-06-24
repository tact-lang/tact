struct OptionalsMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
}

contract NestedOptMix {
    s: OptionalsMix;

    init() {
        self.s = OptionalsMix{
            a: null,
            b: true,
            c: null,
            d: null
        };
    }
}