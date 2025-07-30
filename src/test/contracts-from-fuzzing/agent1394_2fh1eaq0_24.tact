contract MixOptionDefault {
    optInt: Int?;
    optStr: String?;
    fixedBool: Bool = true;

    init() {
        self.optInt = null;
        self.optStr = null;
    }
}