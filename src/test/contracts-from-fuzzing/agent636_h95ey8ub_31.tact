contract FieldMix {
    intField: Int;
    boolField: Bool;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intField = 1;
        self.boolField = false;
        self.strField = "abc";
        self.optInt = null;
        self.optBool = true;
        self.optStr = null;
    }
}