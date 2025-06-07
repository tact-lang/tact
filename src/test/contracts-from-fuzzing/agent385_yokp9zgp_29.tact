contract OptionalStringAddress {
    str: String?;
    addr: Address?;

    init() {
        self.str = null;
        self.addr = null;
    }
}