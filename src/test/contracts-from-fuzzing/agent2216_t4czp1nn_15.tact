struct WithDefaultsOpt {
    a: Int? = null;
    b: Bool? = null;
    c: Address? = null;
    d: Cell? = null;
    e: Slice? = null;
    f: String? = null;
}

contract DefaultsForOptionals {
    s: WithDefaultsOpt;
    init() {
        self.s = WithDefaultsOpt{};
    }
}
