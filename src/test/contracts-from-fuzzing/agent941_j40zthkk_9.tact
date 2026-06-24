contract OptionalPrimitiveField {
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

    receive() {
        self.optInt = 7;
        self.optBool = true;
        self.optString = "yes";
        self.optAddress = self.optAddress; // just assign itself
    }
}