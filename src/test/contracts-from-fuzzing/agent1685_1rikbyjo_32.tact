struct DefOpt {
    a: Int? = null;
}

contract HasDefOpt {
    d: DefOpt;

    init() {
        self.d = DefOpt{};
    }
}
