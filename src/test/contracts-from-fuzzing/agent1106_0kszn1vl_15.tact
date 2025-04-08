contract OptionalAddressField {
    addr: Address?;

    init() {
        self.addr = null;
    }
}