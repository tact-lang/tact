contract OptionalAfterDefaults {
    num: Int = 5;
    opt1: String?;
    flag: Bool = false;
    opt2: Address?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
    }
}