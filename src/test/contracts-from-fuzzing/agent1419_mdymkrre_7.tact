contract InlineOptionals {
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.optInt = 5;
        self.optBool = null;
        self.optString = "hello";
    }
}