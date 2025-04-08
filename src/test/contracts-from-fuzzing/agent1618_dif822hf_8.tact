struct OptionalWithDefaults {
    a: Int? = null;
    b: Int? = 42;
    c: Bool? = false;
    d: String? = "hi";
    e: Address? = null;
}

contract TestContract {
    data: OptionalWithDefaults;

    init() {
        self.data = OptionalWithDefaults{};
    }
}