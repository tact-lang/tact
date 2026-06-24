contract MixedTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.stringField = "Test";
        self.optInt = null;
        self.optBool = false;
        self.optString = null;
    }
}
