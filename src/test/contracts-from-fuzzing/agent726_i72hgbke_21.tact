struct Inner {
    num: Int = 5;
}

contract OptionalWithDefaults {
    opt1: Int? = null;
    opt2: Bool? = null;
    opt3: Inner? = null;

    init() {
        self.opt1 = 1;
        self.opt2 = true;
        self.opt3 = Inner{};
    }

    receive() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
    }
}