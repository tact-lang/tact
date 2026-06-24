contract NestedStringOptionals {
    opt1: String?;
    opt2: String?;
    opt3: String?;

    init() {
        self.opt1 = "a";
        self.opt2 = null;
        self.opt3 = "c";
    }
}