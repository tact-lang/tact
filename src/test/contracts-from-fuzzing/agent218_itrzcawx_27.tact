contract OptionalAddressCell {
    addr: Address?;
    dat: Cell?;

    init() {
        self.addr = null;
        self.dat = null;
    }
}