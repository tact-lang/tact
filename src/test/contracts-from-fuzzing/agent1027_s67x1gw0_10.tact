contract OnlyOptionals {
    optA: Int?;
    optB: Bool?;
    optC: String?;

    init() {
        self.optA = null;
        self.optB = null;
        self.optC = null;
    }
}