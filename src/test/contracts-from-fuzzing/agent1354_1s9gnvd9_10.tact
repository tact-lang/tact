contract OptionalsContract {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = null;
        self.optBool = true;
        self.optString = "hi";
    }
}