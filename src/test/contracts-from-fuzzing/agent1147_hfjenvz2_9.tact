contract VariedPrimitives {
    intField: Int;
    boolField: Bool;
    strField: String;
    optIntField: Int?;
    optBoolField: Bool?;
    optStrField: String?;

    init() {
        self.intField = 10;
        self.boolField = true;
        self.strField = "zzz";
        self.optIntField = null;
        self.optBoolField = false;
        self.optStrField = null;
    }
}