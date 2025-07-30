contract OptionalStrAddress {
    info: String?;
    addr: Address?;

    init() {
        self.info = null;
        self.addr = null;
    }
}