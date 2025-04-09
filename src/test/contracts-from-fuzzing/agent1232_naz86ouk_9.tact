contract OptionalPrimitiveFields {
    ai: Int?;
    ab: Bool?;
    astr: String?;
    aaddr: Address?;
    acell: Cell?;

    init() {
        self.ai = null;
        self.ab = true;
        self.astr = "hey";
        self.aaddr = null;
        self.acell = emptyCell();
    }
}
