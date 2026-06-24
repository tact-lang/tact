struct OptDefaults {
    a: Int? = null;
    b: Int? = null;
}

contract NestedOptDefaults {
    val: OptDefaults;
    init() {
        self.val = OptDefaults{};
    }
}