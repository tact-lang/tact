contract OptionalPrimitive {
    numOpt: Int?;
    flagOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;

    init() {
        self.numOpt = null;
        self.flagOpt = true;
        self.addrOpt = null;
        self.strOpt = "hello";
    }
}
