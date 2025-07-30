contract ManyFields {
    int1: Int;
    bool1: Bool;
    string1: String;
    optInt: Int?;
    optBool: Bool?;
    fixedStr: String;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.string1 = "hi";
        self.optInt = null;
        self.optBool = false;
        self.fixedStr = "fixed";
    }
}
