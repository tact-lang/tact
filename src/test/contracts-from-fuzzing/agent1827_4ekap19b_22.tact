struct MultiOptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract NestedOptDefaults {
    f: MultiOptDefaults;

    init() {
        self.f = MultiOptDefaults{};
    }
}