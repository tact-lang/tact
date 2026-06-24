contract OptionalAddressDefault {
    addr: Address?;

    init() {
        self.addr = null;
    }
}