contract TestContract {
    intOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addressOpt = null;
    }

    receive() {
        self.intOpt = 1;
        self.boolOpt = true;
        self.addressOpt = myAddress();
    }
}
