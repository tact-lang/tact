contract MaxPrimitiveDefaults {
    n: Int = 257;
    b: Bool = true;
    s: String = "maximum";

    init() {
        self.n = 1;
        self.b = false;
        self.s = "min";
    }
}