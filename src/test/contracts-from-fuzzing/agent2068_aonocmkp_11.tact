contract ManyPrimitives {
    i: Int = 1;
    b: Bool = true;
    s: String = "x";

    optI: Int?;
    optB: Bool?;
    optS: String?;

    init() {
        self.optI = null;
        self.optB = null;
        self.optS = null;
    }
}