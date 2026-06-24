struct OptWithDefaults {
    s: String? = null;
    n: Int? = null;
}

contract StructOptDefaults {
    val: OptWithDefaults;

    init() {
        self.val = OptWithDefaults{};
    }
}