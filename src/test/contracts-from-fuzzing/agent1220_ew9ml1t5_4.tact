contract ManyPersistentVars {
    int1: Int;
    int2: Int;
    bool1: Bool;
    bool2: Bool;
    str1: String;
    str2: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.bool1 = true;
        self.bool2 = false;
        self.str1 = "hello";
        self.str2 = "world";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}