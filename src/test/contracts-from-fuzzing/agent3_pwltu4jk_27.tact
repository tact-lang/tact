contract FieldOrdering {
    b: Bool;
    i: Int;
    s: String;
    opt: Int?;
    strOpt: String?;

    init() {
        self.b = false;
        self.i = 42;
        self.s = "a";
        self.opt = 7;
        self.strOpt = null;
    }
}