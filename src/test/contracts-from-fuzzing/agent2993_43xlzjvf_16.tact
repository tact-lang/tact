contract InitAddrOpt {
    who: Address?;

    init() {
        self.who = myAddress();
    }
}