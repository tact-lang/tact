struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract TestContract {
    s: OptionalWithDefaults;
    
    init() {
        self.s = OptionalWithDefaults{};
    }
}