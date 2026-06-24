struct NestedDefaultsOpt {
    i: Int? = null;
    b: Bool? = null;
}

contract TestContract {
    s: NestedDefaultsOpt;
    init() {
        self.s = NestedDefaultsOpt{};
    }
}