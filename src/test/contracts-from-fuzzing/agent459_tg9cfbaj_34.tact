contract NullDefaultAddressOpt {
    addr: Address? = null;

    init() {
        self.addr = null; // remains null
    }
}