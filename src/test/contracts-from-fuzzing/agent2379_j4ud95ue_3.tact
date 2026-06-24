contract Test {
    boolField: Bool;
    intField: Int;
    stringField: String;
    optInt: Int?;
    optString: String?;
    optBool: Bool?;

    init() {
        self.boolField = true;
        self.intField = 123;
        self.stringField = "Test";
        self.optInt = null;
        self.optString = null;
        self.optBool = false;
    }
}