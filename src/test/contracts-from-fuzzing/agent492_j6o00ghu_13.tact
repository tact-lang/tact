contract ComboFields {
    int1: Int;
    bool1: Bool;
    str1: String;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;

    init() {
        self.int1 = 1;
        self.bool1 = true;
        self.str1 = "x";
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
    }
}
