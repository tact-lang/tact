contract OptionalAddressString {
    addr: Address?;
    note: String?;

    init() {
        self.addr = null;
        self.note = null;
    }
}