struct DefOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    inner: DefOpt;

    init() {
        self.inner = DefOpt{};
    }
}
