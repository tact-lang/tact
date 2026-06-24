contract OptionalAddressContract {
    addr: Address?;

    init() {
        self.addr = null;
    }

    receive() {
        self.addr = self.addr;
    }
}