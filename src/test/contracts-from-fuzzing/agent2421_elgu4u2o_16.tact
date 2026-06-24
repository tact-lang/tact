struct OptStructWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract StructOptDefaults {
    val: OptStructWithDefaults;
    init() {
        self.val = OptStructWithDefaults{};
    }
}