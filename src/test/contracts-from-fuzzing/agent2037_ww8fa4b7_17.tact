struct OptionalBoolStrings {
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
}

contract PersistMixedOptionals {
    stuff: OptionalBoolStrings;

    init() {
        self.stuff = OptionalBoolStrings{
            b1: null,
            b2: true,
            s1: "abc",
            s2: null
        };
    }
}
