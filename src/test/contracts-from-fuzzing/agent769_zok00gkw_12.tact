contract OptionalFields {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;

    init() {
        self.intOpt = 1;
        self.boolOpt = null;
        self.addrOpt = null;
        self.strOpt = "hi";
    }

    receive() {
        let _ = self.intOpt;
    }
}