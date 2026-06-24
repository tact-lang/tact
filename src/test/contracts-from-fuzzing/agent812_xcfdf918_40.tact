contract OptionalAddrDefault {
    adr: Address?;

    init() {
        self.adr = null;
    }
}