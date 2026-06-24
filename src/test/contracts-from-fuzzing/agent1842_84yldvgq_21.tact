contract OptionalAddressBool {
    addr: Address?;
    toggle: Bool?;

    init() {
        self.addr = null;
        self.toggle = null;
    }
}