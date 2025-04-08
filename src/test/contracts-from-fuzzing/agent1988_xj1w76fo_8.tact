contract Test {
    bigInt: Int as int257;
    uint8val: Int as uint8;
    uint16val: Int as uint16;
    smallInt: Int as int4;
    boolVal: Bool;
    strVal: String;
    optVal: Int?;

    init() {
        self.bigInt = 0;
        self.uint8val = 0;
        self.uint16val = 0;
        self.smallInt = 0;
        self.boolVal = false;
        self.strVal = "";
        self.optVal = null;
    }
}
