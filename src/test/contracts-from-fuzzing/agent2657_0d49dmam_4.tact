contract OptionalContract {
    optInt: Int? = null;
    optBool: Bool? = null;
    optString: String? = null;

    init() {
        self.optInt = 123;
        self.optBool = true;
        self.optString = "hi";
    }
}
