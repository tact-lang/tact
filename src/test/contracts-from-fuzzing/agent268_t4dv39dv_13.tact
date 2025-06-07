struct OptionalNestedDefaults {
    innerOpt: Int? = null;
    innerOpt2: Bool? = true;
}

contract NestedDefaults {
    x: OptionalNestedDefaults;
    init() {
        self.x = OptionalNestedDefaults{};
    }
}