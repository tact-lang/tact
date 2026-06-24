contract OptionalPersistence {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = 123;
        self.optBool = null;
        self.optString = "hello";
    }
}