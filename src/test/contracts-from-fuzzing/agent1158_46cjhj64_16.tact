contract OptionalMix {
    optA: Int?;
    optB: Bool?;
    optC: String?;
    optD: Address?;

    init() {
        self.optA = null;
        self.optB = null;
        self.optC = null;
        self.optD = null;
    }
}
