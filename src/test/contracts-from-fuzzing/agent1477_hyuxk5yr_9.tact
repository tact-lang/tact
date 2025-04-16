contract OptionalFieldsOnPersistentVars {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
    optionalString: String?;

    init() {
        self.optionalInt = null;
        self.optionalBool = false;
        self.optionalAddress = null;
        self.optionalString = null;
    }
}