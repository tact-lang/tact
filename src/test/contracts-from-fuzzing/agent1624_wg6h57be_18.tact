struct MixedOptionals {
    optStr: String?;
    optAddr: Address?;
    optBool: Bool?;
    optInt: Int?;
}

contract OptionalPrimitivesMixed {
    data: MixedOptionals;

    init() {
        self.data = MixedOptionals{
            optStr: null,
            optAddr: null,
            optBool: null,
            optInt: null,
        };
    }
}