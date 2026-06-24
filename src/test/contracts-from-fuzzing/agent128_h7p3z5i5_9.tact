struct NestedDefaultOpt {
    x: Int? = null;
    y: Bool = true;
}

contract StructOptDefaults {
    s: NestedDefaultOpt;

    init() {
        self.s = NestedDefaultOpt{};
    }
}