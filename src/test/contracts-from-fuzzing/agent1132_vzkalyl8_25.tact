contract OptionalInit {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;

    init() {
        self.optionalInt = null;
        self.optionalBool = true;
        self.optionalString = null;
    }
}