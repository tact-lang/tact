contract OptionalPrimitiveFields {
    optInt: Int?;
    optAddress: Address?;
    optString: String?;
    optBool: Bool?;

    init() {
        self.optInt = null;
        self.optAddress = null;
        self.optString = "Hello";
        self.optBool = true;
    }
}