struct WithDefaults { a: Int = 1; b: Bool = false; c: String = "abc"; }

contract DefaultsInsideStruct {
    value: WithDefaults;
    init() {
        self.value = WithDefaults{};
    }
}