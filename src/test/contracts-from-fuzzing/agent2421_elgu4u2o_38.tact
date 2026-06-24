contract OptionalAddrField {
    optAddr: Address?;
    init() {
        self.optAddr = null;
    }
}