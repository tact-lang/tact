contract OptionalAddressStrings {
    addr: Address?;
    str: String?;

    init() {
        self.addr = null;
        self.str = null;
    }
}