contract OptionalRoots {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
    optAddress: Address?;

    init() {
        self.optInt = 123;
        self.optBool = null;
        self.optString = "hi";
        self.optAddress = null;
    }
}