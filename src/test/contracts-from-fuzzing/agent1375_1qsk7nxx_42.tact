contract MixedOptionals {
    optInt: Int?;
    optBool: Bool? = null;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optStr = null;
    }
}