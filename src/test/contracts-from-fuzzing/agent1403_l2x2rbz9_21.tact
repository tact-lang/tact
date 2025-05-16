struct InnerAddrOpt {
    inner: Address?;
}

contract OptAddrField {
    s: InnerAddrOpt;

    init() {
        self.s = InnerAddrOpt{ inner: null };
    }
}