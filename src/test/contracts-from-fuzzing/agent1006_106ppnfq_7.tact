contract OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = 5;
        self.optBool = null;
        self.optStr = null;
    }
}
