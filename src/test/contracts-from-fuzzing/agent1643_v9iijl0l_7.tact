struct InnerDefaults {
    foo: Int = 7;
    bar: Bool = false;
}

contract DefaultsInNestedStructs {
    data: InnerDefaults;

    init() {
        self.data = InnerDefaults{};
    }
}
