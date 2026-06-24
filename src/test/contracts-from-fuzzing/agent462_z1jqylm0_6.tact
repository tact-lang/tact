contract OptionalFieldDefaults {
    optionalInt: Int?;
    optionalBool: Bool?;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
    }
}