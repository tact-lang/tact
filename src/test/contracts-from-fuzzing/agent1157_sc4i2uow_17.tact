contract OptionalDefaultsContract {
    optInt: Int? = null;
    optBool: Bool? = true;
    optString: String? = null;

    init() {
        self.optInt = 42;
        self.optBool = null;
        self.optString = "hi";
    }
}