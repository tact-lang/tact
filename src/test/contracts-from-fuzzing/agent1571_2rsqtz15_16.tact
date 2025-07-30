struct DefOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract Test16 {
    st: DefOpt;
    init() {
        self.st = DefOpt{};
    }
}
