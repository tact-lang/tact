struct OptionalMix {
    a: Address?;
    b: Bool?;
    c: Int?;
    d: String?;
    e: Cell?;
    f: Slice?;
}

contract OptionalCompositeTest {
    data: OptionalMix;

    init() {
        self.data = OptionalMix {
            a: null,
            b: null,
            c: null,
            d: null,
            e: null,
            f: null
        };
    }
}