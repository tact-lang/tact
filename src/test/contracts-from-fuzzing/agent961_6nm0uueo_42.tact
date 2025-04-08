contract PersistentAddressOpt {
    addr: Address?;

    init() {
        self.addr = null;
    }
}