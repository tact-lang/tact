struct OptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
}

contract StructOptDefaults {
    val: OptDefaults;

    init() {
        self.val = OptDefaults{};
    }
}