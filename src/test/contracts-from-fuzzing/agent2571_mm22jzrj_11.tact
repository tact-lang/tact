contract NoStructs {
    intField: Int;
    strField: String;
    boolField: Bool;
    optField: Int?;
    strOpt: String?;
    boolOpt: Bool?;

    init() {
        self.intField = 3;
        self.strField = "abc";
        self.boolField = false;
        self.optField = null;
        self.strOpt = null;
        self.boolOpt = null;
    }
}
