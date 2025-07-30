contract OptsAndDefaults {
    ai: Int? = null;
    asi: String? = null;
    ab: Bool? = null;
    bi: Int = 5;
    bs: String = "hi";
    bb: Bool = false;

    init() {
        self.ai = null;
        self.asi = "a";
        self.ab = true;
        self.bi = 9;
        self.bs = "bye";
        self.bb = true;
    }
}