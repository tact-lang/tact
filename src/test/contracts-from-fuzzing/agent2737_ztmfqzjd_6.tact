contract OptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optAddress = null;
    }
}