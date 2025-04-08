struct InlineDefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefOpt {
    f: InlineDefaultOpt;

    init() {
        self.f = InlineDefaultOpt{};
    }
}