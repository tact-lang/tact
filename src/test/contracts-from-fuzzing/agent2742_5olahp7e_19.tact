struct OptionalStructWithDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "hi";
}

contract OptDefaultsContract {
    data: OptionalStructWithDefaults;

    init() {
        self.data = OptionalStructWithDefaults{};
    }
}