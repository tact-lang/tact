contract OptionalDefaults {
    optInt: Int? = null;
    optBool: Bool? = null;
    optString: String? = null;

    init() {
        self.optInt = 1;
        self.optBool = true;
        self.optString = "hello";
    }
}
