contract OneOfEachOptional {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;

    init() {
        self.intOpt = 42;
        self.boolOpt = true;
        self.strOpt = "hello";
        self.addrOpt = myAddress();
    }
}