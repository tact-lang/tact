contract DefaultVals {
    i: Int = 12;
    b: Bool = false;
    s: String = "hello";
    oi: Int? = null;
    ob: Bool? = null;

    init() {
        self.i = 7;
        self.b = true;
        self.s = "world";
        self.oi = 3;
        self.ob = false;
    }
}
