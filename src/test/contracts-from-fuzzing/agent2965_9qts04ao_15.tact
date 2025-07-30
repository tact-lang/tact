struct OptionalInDefaults {
    x: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract TestContract {
    val: OptionalInDefaults;

    init() {
        self.val = OptionalInDefaults{};
    }
}
