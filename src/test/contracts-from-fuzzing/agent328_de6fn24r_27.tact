struct DefaultsOpt {
    a: Int? = null;
    b: Bool? = null;
}

contract Test {
    dopt: DefaultsOpt;
    init() {
        self.dopt = DefaultsOpt{};
    }
}