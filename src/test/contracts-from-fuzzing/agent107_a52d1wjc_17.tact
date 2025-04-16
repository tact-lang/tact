contract OptInOptOut {
    outsideOpt: Int?;
    insideValue: Int;

    init() {
        self.outsideOpt = null;
        self.insideValue = 123;
    }
}