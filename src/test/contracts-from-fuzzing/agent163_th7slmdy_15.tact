contract OptionalAddress {
    addr: Address?;
    init() {
        self.addr = null;
    }
}