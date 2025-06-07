contract OptionalDirectField {
    optInt: Int?;
    optBool: Bool?;
    optAddress: Address?;

    init() {
        self.optInt = 12;
        self.optBool = null;
        self.optAddress = null;
    }
}
