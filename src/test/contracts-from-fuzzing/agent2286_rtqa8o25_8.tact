contract OptionalFieldMix {
    optInt: Int? = null;
    optBool: Bool? = null;
    optString: String? = null;
    regInt: Int = 0;
    regBool: Bool = false;

    init() {
        self.optInt = 5;
        self.optBool = true;
        self.optString = "hello";
        self.regInt = 42;
        self.regBool = true;
    }
}