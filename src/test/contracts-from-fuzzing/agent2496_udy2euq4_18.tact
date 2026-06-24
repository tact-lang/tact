contract OptionalFlags {
    flagA: Bool?;
    flagB: Bool?;
    flagC: Bool?;

    init() {
        self.flagA = null;
        self.flagB = true;
        self.flagC = false;
    }
}
