contract OptionalMultipleTypes {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = 1;
        self.optBool = null;
        self.optString = "hi";
    }
}