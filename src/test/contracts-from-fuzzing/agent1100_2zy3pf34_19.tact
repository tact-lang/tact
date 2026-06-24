struct NestedDefOpt {
    ival: Int? = null;
    bval: Bool? = null;
}

contract NestedOptDefaults {
    s: NestedDefOpt;

    init() {
        self.s = NestedDefOpt{};
    }
}
