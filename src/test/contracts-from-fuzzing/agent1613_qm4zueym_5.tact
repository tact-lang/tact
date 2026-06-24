struct OptionalMix {
    a: Int?;
    b: String?;
    c: Cell?;
    d: Slice?;
    e: Address?;
}

contract OptMixTest {
    s: OptionalMix;

    init() {
        self.s = OptionalMix{
            a: null,
            b: null,
            c: null,
            d: null,
            e: null
        };
    }
}