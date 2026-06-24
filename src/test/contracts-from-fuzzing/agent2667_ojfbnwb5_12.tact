struct OptionalStructWithDefaults {
    a: Int? = null;
    b: Bool? = null;
}

contract DefaultsWithOptionals {
    data: OptionalStructWithDefaults;

    init() {
        self.data = OptionalStructWithDefaults{};
    }

    receive() {
        self.data = OptionalStructWithDefaults{a: 5, b: true};
    }
}