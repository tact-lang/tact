struct OptionalStructWithDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Address? = null;
    e: Cell? = null;
}

contract TestContract {
    data: OptionalStructWithDefaults;

    init() {
        self.data = OptionalStructWithDefaults{};
    }
}