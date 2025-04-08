struct WithOptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract OptionalDefaultsNestedStruct {
    val: WithOptionalWithDefaults;
    init() {
        self.val = WithOptionalWithDefaults{};
    }
}