contract NestedOptionalsDefaults {
    opt1: Int? = null;
    opt2: String? = "hello";
    opt3: Bool? = false;

    init() {
        self.opt1 = 123;
        self.opt2 = null;
        self.opt3 = true;
    }
}