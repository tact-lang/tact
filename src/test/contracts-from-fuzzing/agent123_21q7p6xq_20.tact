// test maximal variety of primitive optional persistent state
contract TestOptPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addrOpt: Address?;

    init() {
        self.intOpt = -5;
        self.boolOpt = true;
        self.stringOpt = null;
        self.addrOpt = myAddress();
    }
}