contract VariousPrimitives {
    i256: Int;
    smallInt: Int as int8;
    largeInt: Int as int257;
    b: Bool;
    txt: String;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.i256 = 123456;
        self.smallInt = -5;
        self.largeInt = 789123;
        self.b = true;
        self.txt = "hi";
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}