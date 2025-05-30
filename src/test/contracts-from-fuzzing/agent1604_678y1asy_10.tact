struct MixedOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;
    optCell: Cell?;
}

contract OptionalCombo {
    s: MixedOptionals;

    init() {
        self.s = MixedOptionals{
            optInt: null,
            optBool: null,
            optString: null,
            optAddress: null,
            optCell: null
        };
    }
}