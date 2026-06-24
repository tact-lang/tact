struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
}

contract DiverseOptionals {
    data: OptionalMix;

    init() {
        self.data = OptionalMix{
            a: null, b: null, c: null, d: null, e: null
        };
    }
}
