contract ManyOptionalFields {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
        self.optAddr = null;
    }
}