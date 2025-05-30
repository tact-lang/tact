struct DefOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    d: DefOpt;

    init() {
        self.d = DefOpt{};
    }
}
