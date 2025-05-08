contract NestedOptionals {
    opt1: Int?;
    opt2: Bool?;
    opt3: Address?;

    init() {
        self.opt1 = null;
        self.opt2 = true;
        self.opt3 = null;
    }
}