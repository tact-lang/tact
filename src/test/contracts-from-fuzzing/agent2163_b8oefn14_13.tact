contract OptionalFieldsDirect {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optString = null;
    }
}