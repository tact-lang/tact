contract ManyOptionalPrimitives {
    optA: Int?;
    optB: Bool?;
    optC: String?;
    optD: Address?;

    init() {
        self.optA = null;
        self.optB = true;
        self.optC = "hello";
        self.optD = null;
    }
}
