struct OptionalWithDefaults {
    opt1: Int? = null;
    opt2: Bool? = null;
}

contract Test39 {
    val: OptionalWithDefaults;

    init() {
        self.val = OptionalWithDefaults{};
    }
}
