contract OptionalStringAndAddress {
    text: String?;
    addr: Address?;

    init() {
        self.text = null;
        self.addr = null;
    }
}
