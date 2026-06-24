contract ManyTypes {
    i: Int = 1;
    b: Bool = true;
    s: String = "hi";
    optI: Int?;
    optB: Bool?;
    optS: String?;

    init() {
        self.optI = null;
        self.optB = null;
        self.optS = null;
    }
}