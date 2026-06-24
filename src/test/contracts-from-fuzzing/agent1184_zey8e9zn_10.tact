contract OptionalFields {
    optionalInt: Int?;
    optionalString: String?;
    optionalBool: Bool?;

    init() {
        self.optionalInt = null;
        self.optionalString = null;
        self.optionalBool = true;
    }
}