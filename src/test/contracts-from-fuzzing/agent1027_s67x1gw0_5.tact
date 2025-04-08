contract OptionalFields {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
        self.optionalString = null;
    }
}