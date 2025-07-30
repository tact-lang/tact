contract OptionalDefaults {
    oo: Int? = null;
    ss: String? = null;
    bb: Bool? = null;
    
    init() {
        self.oo = 5;
        self.ss = "h";
        self.bb = true;
    }
}