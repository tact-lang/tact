contract DefaultOptionalFields {
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;

    init() {
        self.optInt = 11;
        self.optBool = true;
        self.optStr = "abc";
    }
}