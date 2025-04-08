struct OptionalWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "hello";
    d: Address? = null;
    e: Slice? = null;
}

contract TestContract {
    owdef: OptionalWithDefaults;

    init() {
        self.owdef = OptionalWithDefaults{};
    }
}