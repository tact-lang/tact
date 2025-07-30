contract Test {
    bigInt: Int as int257;
    smallInt: Int as int8;
    boolVal: Bool;
    str: String;
    opt: Int?;

    init() {
        self.bigInt = 123456789;
        self.smallInt = 7;
        self.boolVal = true;
        self.str = "string";
        self.opt = null;
    }
}