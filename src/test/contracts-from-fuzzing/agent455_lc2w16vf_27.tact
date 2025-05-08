struct OptWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = null;
}

contract NestedOptDefaults {
    val: OptWithDefaults;
    init() {
        self.val = OptWithDefaults{};
    }
}