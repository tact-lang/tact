// Persistent variable with Address optional initialized
contract OptionalAddressPersistent {
    addr: Address?;

    init() {
        self.addr = myAddress();
    }
}
