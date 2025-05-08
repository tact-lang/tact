contract OptionalBeforeAfter {
    opt1: Int?;
    val1: Bool = false;
    opt2: Int?;
    val2: Int = 7;

    init() {
        self.opt1 = null;
        self.opt2 = null;
    }
}