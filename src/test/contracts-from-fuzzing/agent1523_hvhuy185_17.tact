contract LargeOptional {
    optA: Int?;
    optB: Bool?;
    optC: String?;
    optD: Cell?;
    optE: Slice?;
    optF: Address?;
    fixedA: Int = 1;
    fixedB: Bool = true;
    fixedC: String = "str";

    init() {
        self.optA = null;
        self.optB = null;
        self.optC = null;
        self.optD = null;
        self.optE = null;
        self.optF = null;
    }
}