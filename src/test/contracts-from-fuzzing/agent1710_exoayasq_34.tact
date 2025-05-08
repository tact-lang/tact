struct NestedDefaults {
    s1: String = "default";
    s2: String? = null;
}

contract Test {
    field: NestedDefaults;

    init() {
        self.field = NestedDefaults{};
    }
}