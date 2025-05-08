contract ManyNonNullOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;

    init() {
        self.intOpt = 5;
        self.boolOpt = false;
        self.strOpt = "abc";
        self.addrOpt = myAddress();
    }
}