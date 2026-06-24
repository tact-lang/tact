struct DefaultedOpt {
    i: Int? = null;
    s: String? = null;
    b: Bool? = null;
}

contract TestContract {
    field: DefaultedOpt;
    init() {
        self.field = DefaultedOpt{};
    }
}