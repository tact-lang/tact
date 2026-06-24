contract MixTypes {
    intF: Int;
    boolF: Bool;
    stringF: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.intF = 7;
        self.boolF = false;
        self.stringF = "x";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}