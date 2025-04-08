struct DefOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int = 5;
}

contract DefOptional {
    s: DefOpt;
    init() {
        self.s = DefOpt{};
    }
}