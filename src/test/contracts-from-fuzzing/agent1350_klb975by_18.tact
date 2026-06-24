contract OptionalAddressAndString {
    addr: Address?;
    text: String?;

    init() {
        self.addr = null;
        self.text = null;
    }
}