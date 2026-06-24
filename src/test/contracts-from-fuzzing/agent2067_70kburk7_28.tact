struct OptionalBoolDefaults {
    flag1: Bool? = true;
    flag2: Bool? = null;
}

contract MixedOptionDefaults {
    d: OptionalBoolDefaults;

    init() {
        self.d = OptionalBoolDefaults{};
    }
}