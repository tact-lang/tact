contract Optionals {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    stringOpt: String? = null;
    addrOpt: Address? = null;
    init() {
        self.intOpt = 5;
        self.boolOpt = true;
        self.stringOpt = "hi";
        self.addrOpt = myAddress();
    }
}