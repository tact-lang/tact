contract OptionalAndNonOptional {
    optInt: Int?;
    fixedInt: Int;
    optStr: String?;
    fixedStr: String;
    optBool: Bool?;
    fixedBool: Bool;

    init() {
        self.optInt = null;
        self.fixedInt = 1;
        self.optStr = null;
        self.fixedStr = "hi";
        self.optBool = null;
        self.fixedBool = true;
    }
}