contract ContractEmptyVsZero {
    v1: Int = 0;
    v2: Bool = false;
    v3: String = "";

    init() {
        self.v1 = 100;
        self.v2 = true;
        self.v3 = "x";
    }
}