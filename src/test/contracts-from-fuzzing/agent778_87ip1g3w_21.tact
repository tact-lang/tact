contract OptionalFieldsOnly {
    p: Int?;
    q: Bool?;
    init() {
        self.p = null;
        self.q = null;
    }
}