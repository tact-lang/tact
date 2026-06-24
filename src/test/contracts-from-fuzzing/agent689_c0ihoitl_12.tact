contract ManyPrimitiveFieldsTest {
    int1: Int;
    bool1: Bool;
    str1: String;
    int2: Int;
    bool2: Bool;
    str2: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.int1 = 10;
        self.bool1 = false;
        self.str1 = "x";
        self.int2 = -42;
        self.bool2 = true;
        self.str2 = "y";
        self.optInt = null;
        self.optBool = null;
        self.optStr = "z";
    }
}