contract TestContract {
    optA: Bool?;
    optB: Int?;
    optC: String?;

    init() {
        self.optA = true;
        self.optB = null;
        self.optC = "test";
    }
}