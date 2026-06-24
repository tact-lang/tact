contract AddrOpt {
    a: Address?;

    init() {
        self.a = myAddress();
    }
}