contract OptionalsInitialNull {
    optString: String?;
    optInt: Int?;
    optBool: Bool?;

    init() {
        self.optString = null;
        self.optInt = null;
        self.optBool = null;
    }
}