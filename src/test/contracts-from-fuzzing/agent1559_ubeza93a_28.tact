struct OptionalsMix {
    one: Int?;
    two: Bool?;
    three: String?;
    four: Cell?;
    five: Address?;
}

contract MixedOptionals {
    f: OptionalsMix;

    init() {
        self.f = OptionalsMix{
            one: null,
            two: null,
            three: null,
            four: null,
            five: null,
        };
    }
}