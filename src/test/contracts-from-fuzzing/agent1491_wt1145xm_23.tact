contract NullDefaults {
    optionalInt: Int? = null;
    optionalBool: Bool? = null;

    init() {
        self.optionalInt = null;
        self.optionalBool = null;
    }
}