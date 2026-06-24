struct OptionalsMix {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
}

contract MixedOptionals {
    data: OptionalsMix;

    init() {
        self.data = OptionalsMix{
            optInt: null,
            optBool: null,
            optAddr: null,
            optStr: null,
            optCell: null,
        };
    }
}