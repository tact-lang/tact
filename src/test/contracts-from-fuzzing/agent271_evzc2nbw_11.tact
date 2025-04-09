contract OptionalDefaults {
    x: Int? = null;
    y: Bool? = null;
    s: String? = null;
    addr: Address? = null;

    init() {
        self.x = null;
        self.y = null;
        self.s = null;
        self.addr = null;
    }
}
