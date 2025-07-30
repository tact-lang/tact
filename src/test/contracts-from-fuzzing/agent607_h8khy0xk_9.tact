contract DefaultsOptional {
    opt1: Int? = null;
    opt2: Bool? = true;
    opt3: String? = null;

    init() {
        self.opt1 = 42;
        self.opt2 = false;
        self.opt3 = "hello";
    }
}