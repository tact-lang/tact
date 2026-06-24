struct OptStructDefaults {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

contract OptionalStructWithDefaults {
    data: OptStructDefaults;

    init() {
        self.data = OptStructDefaults{};
    }
}