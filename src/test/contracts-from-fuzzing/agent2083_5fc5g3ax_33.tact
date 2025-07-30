contract ComplexPrimitiveMix {
    flag: Bool;
    count: Int as uint64;
    label: String;
    optVal: Int?;

    init() {
        self.flag = true;
        self.count = 7;
        self.label = "label";
        self.optVal = null;
    }
}
