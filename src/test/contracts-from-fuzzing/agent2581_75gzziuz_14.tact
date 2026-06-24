contract OptionalDefaults {
    v1: Int?;
    v2: Bool?;
    v3: String?;
    v4: Slice?;
    v5: Cell?;
    v6: Address?;

    init() {
        self.v1 = null;
        self.v2 = null;
        self.v3 = null;
        self.v4 = null;
        self.v5 = null;
        self.v6 = null;
    }
}
