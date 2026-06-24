contract MultiAddresses {
    aa: Address;
    bb: Address;
    cc: Address;

    init() {
        self.aa = myAddress();
        self.bb = myAddress();
        self.cc = myAddress();
    }
}