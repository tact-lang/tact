contract SeveralTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    addrField: Address;
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;

    init() {
        self.intField = 1;
        self.boolField = true;
        self.strField = "hi";
        self.addrField = myAddress();
        self.intOpt = null;
        self.boolOpt = false;
        self.strOpt = null;
        self.addrOpt = null;
    }
}