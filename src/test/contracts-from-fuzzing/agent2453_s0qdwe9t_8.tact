struct DefOpt {
    op1: Int? = null;
    op2: Bool? = null;
    op3: String? = null;
}

contract DefaultsOptional {
    d: DefOpt;
    init() {
        self.d = DefOpt{};
    }
}