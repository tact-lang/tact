contract OptionalMix {
    optionalInt: Int?;
    optionalBool: Bool? = null;
    optionalString: String?;
    optionalAddress: Address?;

    init() {
        self.optionalInt = 1;
        self.optionalBool = true;
        self.optionalString = "hello";
        self.optionalAddress = null;
    }
}