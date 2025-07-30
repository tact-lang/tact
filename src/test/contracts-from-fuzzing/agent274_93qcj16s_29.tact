struct OptionalsMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract MixedOptionals {
    payload: OptionalsMix;

    init() {
        self.payload = OptionalsMix{
            a: null,
            b: null,
            c: "hello",
            d: null,
        };
    }
}