contract CrossDefaults {
    i: Int = 5;
    opt: Int?;
    b: Bool = false;
    optb: Bool?;

    init() {
        self.opt = null;
        self.optb = null;
    }
}